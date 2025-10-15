class ContactMailer < ApplicationMailer
  def account_summary(contact_id, template_id)
    template = EmailTemplate.find(template_id)
    user = Contact.find(contact_id)
    summery = user.get_summary
    
    data = {
      name: user.name,
      email: user.email,
      organization_name: summery[:organization_nm],
      organization_email: summery[:organization_email],
      best_performance: "#{summery[:best]}",
      worst_performance: "#{summery[:worst]}",
      balance: summery[:balance],
      performance: "#{summery[:best]}"
    }

    body = TemplateRenderer.new(template.body, data).render
    
    mail(
      to: user.email,
      subject: template.subject,
      body: body,
      content_type: "text/html"
    )
  end
end
