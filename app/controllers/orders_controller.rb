class OrdersController < ApplicationController

  def show
    @book = Book.find(params[:book_id])
  end

  def new
    @book = Book.find(params[:book_id])
    @order = Order.new
  end

  def create
    @book = Book.find(params[:book_id])
    @author = @book.author
    @order = @book.orders.build(order_params)


    if @order.save
      UserMailer.order_details(@author,@book,@order).deliver
      redirect_to @book
    else
      render :new
    end
  end

  private

  def order_params
    params.require(:order).permit!
  end

end
