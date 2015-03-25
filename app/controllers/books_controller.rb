class BooksController < ApplicationController

  def index


  end

  def new
    @author = Author.find(params[:id])
    @book = Book.new

  end


  def show
  end

  def update
  end

  def destroy
  end


end
