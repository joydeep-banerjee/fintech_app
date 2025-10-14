class ContactsController < ApplicationController
  def index
    @contacts = Contact.includes(:organization, :portfolios).all
    @email_templates = EmailTemplate.pluck(:id, :subject)
  end

  def send_email
    ContactMailer.account_summary(params[:id]).deliver_now
  end
end
