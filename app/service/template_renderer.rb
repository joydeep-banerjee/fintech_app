class TemplateRenderer
  def initialize(template_body, data = {})
    @template_body = template_body
    @data = data
  end

  def render
    rendered = @template_body.dup
    @data.each do |key, value|
      rendered.gsub!("{{#{key}}}", value.to_s)
    end
    rendered
  end
end
