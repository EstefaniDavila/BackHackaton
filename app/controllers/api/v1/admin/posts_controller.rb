class Api::V1::Admin::PostsController < ApplicationController
  include SearchHelper
  skip_before_action :verify_authenticity_token

  def index_admin
    keywords = params[:search_params] || ''
    fields = params[:search_fields]&.split(',') || []
    posts = Post.all

    if fields.present? && keywords.present?
      search_conditions = combine_search_fields(fields, keywords, 'text')
      posts = posts.ransack(search_conditions).result
    end
    total_records = posts.count
    if params[:sort].present?
      field, order = params[:sort].split('%')
      posts = posts.order(field => order)
    end
    posts = posts.page(params[:page]).per(params[:per_page])
   render json: {
      posts: posts.map { |p|
        {
          id: p.id,
          title: p.title,
          body: p.body,
          political_party_id: p.political_party_id,
          source_url: p.source_url,
          created_at: p.created_at,
          updated_at: p.updated_at
        }
      },
      current_page: posts.current_page,
      total_pages: posts.total_pages,
      per_page: posts.limit_value,
      total_posts: total_records
    }, status: :ok

  end

  def index_post_admin
    posts = Post.where(political_party_id: nil).order(created_at: :desc)

    render json: posts.map { |p|
      {
        id: p.id,
        title: p.title,
        body: p.body,
        political_party_id: p.political_party_id,
        source: p.source_url,
        created_at: p.created_at,
        updated_at: p.updated_at
      }
    }, status: :ok
  end

  def index_by_party
    posts = Post.where.not(political_party_id: nil)
                .includes(:political_party)
                .order(created_at: :desc)

    render json: posts.map { |p|
      {
        id: p.id,
        title: p.title,
        body: p.body,
        political_party_id: p.political_party_id,
        political_party_name: p.political_party&.name,
        source: p.source_url,
        created_at: p.created_at,
        updated_at: p.updated_at
      }
    }, status: :ok
  end

  def show
    post = Post.find(params[:id])

    render json: post.as_json(
      only: %i[id title body created_at updated_at],
      methods: [:source_url]
    )
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'Publicación no encontrada' }, status: :not_found
  end

  def create
    post = Post.new(post_params.except(:source))
    if post.save
      post.source.attach(post_params[:source]) if post_params[:source].present?
      render json: { message: 'Publicación creada con éxito' }, status: :ok
    else
      render json: { message: 'Error al crear la publicación', errors: post.errors.full_messages },
          status: :unprocessable_entity
    end
  end

  def update
    post = Post.find(params[:id])

    if post.update(post_params.except(:source))
      if post_params[:source].present?
        post.source.purge_later if post.source.attached?
        post.source.attach(post_params[:source])
      end

      render json: {
        message: 'Publicación actualizada con éxito',
        post: post.as_json(only: %i[id title body])
      }, status: :ok
    else
      render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    post = Post.find(params[:id])

    post.source.purge if post.source.attached?
    post.destroy

    render json: { message: 'Publicación eliminada' }, status: :ok
  end

  private

  def post_params
    params.require(:post).permit(
      :title,
      :body,
      :political_party_id,
      :source
    )
  end
end
