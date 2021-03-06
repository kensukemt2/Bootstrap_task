class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :read_blog, only:[:index, :top]
  # GET /blogs
  # GET /blogs.json
  def index
  end

  # GET /blogs/1
  # GET /blogs/1.json
  def show
  end

  # GET /blogs/new
  def new
    if params[:back]
      @blog =Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end

  # GET /blogs/1/edit
  def edit
  end

  # POST /blogs
  # POST /blogs.json
  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      redirect_to @blog, notice: "ブログが作成されました"
    else
      render :new
    end
  end


  # PATCH/PUT /blogs/1
  # PATCH/PUT /blogs/1.json
  def update
    if @blog.update(blog_params)
      redirect_to @blog, notice: "ブログを編集しました"
      else
      render :edit
    end
  end


  # DELETE /blogs/1
  # DELETE /blogs/1.json
  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "ブログを削除しました"
  end
  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end
  def top
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def blog_params
      params.require(:blog).permit(:title, :content)
    end
    def read_blog
      @blogs = Blog.all
    end
end
