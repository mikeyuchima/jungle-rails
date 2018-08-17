class SendOrder < ApplicationMailer
    default from: "no-reply@jungle.com"

    def confirm_email(order)
        @order = order
        mail(to: order.email, subject: `Your Order Number is #{order.id}`)
    end
end
