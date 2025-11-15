class Api::V1::Admin::PoliticalPartiesController < ApplicationController
  #   before_action :authenticate_resource
  #   before_action :authorize_user!
  include SearchHelper
  skip_before_action :verify_authenticity_token

  # before_action :authenticate_and_set_user

  def index
    keywords = params[:search_params] || ""
    fields = params[:search_fields]&.split(",") || []
    political_parties = PoliticalParty.all

    if fields.present? && keywords.present?
      search_conditions = combine_search_fields(fields, keywords, "text")
      political_parties = political_parties.ransack(search_conditions).result
    end
    total_records = political_parties.count
    if params[:sort].present?
      field, order = params[:sort].split("%")
      political_parties = political_parties.order(field => order)
    else
      political_parties = political_parties.order(Arel.sql("CASE WHEN status = 0 THEN 0 ELSE 1 END, created_at DESC"))
    end
    political_parties = political_parties.page(params[:page]).per(params[:per_page])

    render json: {
      political_parties: political_parties.as_json(
        only: [:id, :name, :acronym, :description, :status, :members_count, :founded_at, :member_id, :created_at, :updated_at],
        methods: [:logo_url, :plan_pdf_url]
      ),
      current_page: political_parties.current_page,
      total_pages: political_parties.total_pages,
      per_pages: political_parties.limit_value,
      total_political_parties: total_records,
    }, status: :ok
  end

  def show
    render json: @political_party.as_json(
      only: [:id, :name, :acronym, :description, :status, :members_count, :founded_at, :member_id, :created_at, :updated_at],
      methods: [:logo_url, :plan_pdf_url],
      include: {
        forum: { only: [:id, :name, :created_at, :updated_at] }
      }
    )
  end

  def create
    party = PoliticalParty.new(political_party_params.merge(status: :active).except(:logo, :plan_pdf))

    # if params[:political_party][:logo].present?
    #   party.logo.attach(params[:political_party][:logo])
    # end
    # if params[:political_party][:plan_pdf].present?
    #   party.plan_pdf.attach(params[:political_party][:plan_pdf])
    # end

    if party.save
      if params[:political_party][:logo].present?
        party.logo.attach(params[:political_party][:logo])
      end
      if params[:political_party][:plan_pdf].present?
        party.plan_pdf.attach(params[:political_party][:plan_pdf])
      end
      render json: { message: "Partido Creado con exito" }, status: :ok
    else
      render json: { message: "Ocurrió un error al registrar el partido", errors: party.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    party = PoliticalParty.find(params[:id])

    if party.update(political_party_params.except(:logo, :plan_pdf))
      if params[:political_party][:logo].present?
        party.logo.purge_later if party.logo.attached?
        party.logo.attach(params[:political_party][:logo])
      end

      if params[:political_party][:plan_pdf].present?
        party.plan_pdf.purge_later if party.plan_pdf.attached?
        party.plan_pdf.attach(params[:political_party][:plan_pdf])
      end

      render json: {
        message: 'Political Party updated successfully',
        party: party.as_json(
          only: [:id, :name, :acronym, :description, :founded_at, :member_id]
        )
      }, status: :ok
    else
      render json: { errors: party.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    party =PoliticalParty.find(params[:id])
    party.logo.purge if party.logo.attached?
    party.plan_pdf.purge if party.plan_pdf.attached?

    # Destruir el foro asociado
    party.forum.destroy if party.forum.present?
    if party.destroy
      render json: { message: 'Political party deleted' }, status: :ok
    else
      render json: { message: 'Error on Political party deleted' }, status: :ok
    end
  end

  def assign_representative
    party = PoliticalParty.find(params[:id])
    member = Member.find(params[:member_id])

    unless member.role_member == 'party_representative'
      return render json: { error: 'El miembro no es un representante válido' }, status: :unprocessable_entity
    end

    member.update!(political_party: party)

    render json: { message: 'Representante asignado correctamente', member: member }
  end

  def approve
    @political_party.update(status: :approved)
    render json: { message: 'Party approved', party: @political_party }
  end

  def reject
    @political_party.update(status: :rejected)
    render json: { message: 'Party rejected', party: @political_party }
  end

  private

  def set_political_party
    @political_party = PoliticalParty.find(params[:id])
  end

  def political_party_params
    params.require(:political_party).permit(
      :name,
      :acronym,
      :description,
      :founded_at,
      :hq_address,
      :website,
      :facebook_url,
      :twitter_url,
      :instagram_url,
      :youtube_url,
      :tiktok_url,
      :member_id
    )
  end
end
