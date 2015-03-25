class BooksController < ApplicationController

  def index
    @books = Book.order(title: :asc)

  end

  def new
    @book = Book.new
  end

  def create

    @author = Author.find(current_user.id)

    @book = @author.books.build(params_books)

  if @book.save
    redirect_to books_author_path(session[:author_id])
  else
    render :new
  end

  end


  def show
    @book = Book.find(params[:id])
  end


  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(params_books)
      redirect_to @book
    else
      render :edit
    end
  end

  def destroy
  end


  private
  def params_books
    params.require(:book).permit!
  end


end
