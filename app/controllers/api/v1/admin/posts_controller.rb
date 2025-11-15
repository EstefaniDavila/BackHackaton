class Api::V1::Admin::PostsController < ApplicationController
  #   before_action :authenticate_resource
  #   before_action :authorize_user!
  include SearchHelper
  skip_before_action :verify_authenticity_token

  # before_action :authenticate_and_set_user

  def index
    posts = Post.all.order(created_at: :desc)
    render json: posts, status: :ok
  end

  def index_by_forum
    forum_id = params[:forum_id]
    if forum_id.blank?
      return render json: { error: "Se requiere forum_id" }, status: :unprocessable_entity
    end
    posts = Post.where(forum_id: forum_id).order(created_at: :desc)
    render json: posts, status: :ok
  end

  def show
    post = Post.find(params[:id])
    render json: post.as_json(
      only: [:id, :title, :body, :source, :created_at, :updated_at],
      include: {
        forum: { only: [:id, :name] }
      }
    )
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Publicación no encontrada" }, status: :not_found
  end

  def create
    post = Post.new(post_params.except(:source))

    if post.save
      if params[:post][:source].present?
        post.source.attach(params[:post][:source])
      end
      render json: { message: "Publicacion creada con exito" }, status: :ok
    else
      render json: { message: "Ocurrió un error al crear la publicacion", errors: post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    post = Post.find(params[:id])

    if post.update(post_params.except(:source))
      if params[:post][:source].present?
        post.source.purge_later if post.source.attached?
        post.source.attach(params[:post][:source])
      end

      render json: {
        message: 'Post updated successfully',
        party: post.as_json(
          only: [:id, :title, :body]
        )
      }, status: :ok
    else
      render json: { errors: post.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    post =Post.find(params[:id])
    post.source.purge if post.source.attached?

    if post.destroy
      render json: { message: 'Post deleted' }, status: :ok
    else
      render json: { message: 'Error on Post deleted' }, status: :ok
    end
  end

  def post_params
    # params.require(:political_party).permit(
    #   :title,
    #   :body,
    #   :forum_id
    # )
    params.permit(
      :title,
      :body,
      :forum_id
    )
  end
end
