class UserMailer < ActionMailer::Base
  default from: "customercare@mybank.com"

  def welcome_email(author)
    @author = author
    mail(to: @author.email, subject: "Welcome a Biblio")
  end

  def order_details(author,book,order)
    @order = order
    @book = book
    @author = author
    mail(to: @author.email, subject: "Pedido")
  end
end
