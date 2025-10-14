class ContactMailer < ApplicationMailer
  def account_summary(contact_id, template_id)
    template = EmailTemplate.find(template_id)
    user = Contact.last # For demo purposes, we use the last contact

    data = {
      name: user.name,
      balance: user.balance,
      performance: "#{user.performance}%"
    }

    body = TemplateRenderer.new(template.body, data).render

    mail(
      to: user.email,
      subject: template.subject,
      body: body,
      content_type: "text/plain"
    )
  end
end
