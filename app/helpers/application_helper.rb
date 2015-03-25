module ApplicationHelper


  def getSumOrdenes
    @suma = Order.where("book_id = #{params[:id]}")
    @suma.sum(:total)
  end

end
