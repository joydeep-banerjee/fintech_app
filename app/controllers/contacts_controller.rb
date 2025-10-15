class ContactsController < ApplicationController
  def index
    @contacts = Contact.includes(:organization, :portfolios).all
    @email_templates = EmailTemplate.pluck(:id, :subject)
  end

  # For testing from rails console, use below example
  # Ex: ContactMailer.account_summary(Contact.last.id, EmailTemplate.last.id).deliver_now
  def send_email
    ContactMailer.account_summary(params[:id], params[:template_id]).deliver_now
  end
end
