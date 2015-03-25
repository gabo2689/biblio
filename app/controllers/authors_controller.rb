class AuthorsController < ApplicationController

  def new
    if current_user.present?
      redirect_to root_path
    else
      @author = Author.new
    end
  end

  def create
    @author = Author.new(authors_params)

  if @author.save
    UserMailer.welcome_email(@author).deliver
    login(@author)
  else
    render :new
  end
  end


  def books
    @books = Book.where("author_id = #{params[:id]}").order(title: :asc)
  end

  private
  def authors_params
    params.require(:author).permit!
  end

end
