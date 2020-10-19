class Api::V1::BlogsController < Api::V1::ApiController

  # before_action :authenticate, only: [:update, :create, :index, :show]
  before_action :authenticate, except: [:signed_url]
  before_action :set_blogs, only: [:update, :show, :destroy]

  def create
    @blog = current_user.blogs.new(blog_params)
    if @blog.save
      render json: User::BlogSerializer.new(@blog).serialized_json, status: :created
    else
      unprocessable_entity @blog.errors
    end
  end

  def index
     blogs = current_user.blogs.order_by_latest
     render json: User::BlogSerializer.new(blogs).serializable_hash.merge(pagy: 1), status: :ok
  end

  def show
    render json: User::BlogSerializer.new(@blogs).serialized_json, status: :created
  end

  def update
    if(@blogs.update(blog_params))
      render json: User::BlogSerializer.new(@blogs).serialized_json, status: :created
    else
      unprocessable_entity @blog.errors
    end
  end

  private
    def blog_params
      params.require(:blog).permit(:title, :description, comments_attributes:[:comment_body])
    end

    # def options
    #   { params: { current_user: current_user, controller: "blogs" } }
    # end  

    def set_blogs
      @blogs = current_user.blogs.find(params[:id])
    end

end