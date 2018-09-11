class BlogsController < ApplicationController
  def top

  end

  def index
    @blogs = Blog.all
    @blog = Blog.new
  end

   def create
    blog = Blog.new(blog_params)
   if blog.save
    flash[:notice] = "Book was successfully created."
    redirect_to blog_path(blog[:id])
  else
    render("blogs/index")
   end
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    blog = Blog.find(params[:id])
   if blog.update(blog_params)
    flash[:notice] = "Book was successfully updated."
    redirect_to blog_path(blog[:id])
  else
    render("blogs/edit")
  end
end

  def destroy
    blog = Blog.find(params[:id])
    if blog.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to blogs_path
  else
    render("blogs/index")
  end
end

private
  def blog_params
  	params.require(:blog).permit(:title, :category, :body)
  end
end