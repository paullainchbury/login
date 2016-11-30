module DeviseHelper
  def devise_error_messages!
    return "" unless devise_error_messages?

    # messages = resource.errors.full_messages.map { |msg| content_tag(:li, content_tag(:a, msg)) }.join
    links = []

    messages =  resource.errors.full_messages.each_with_index do |msg,index|
                  links << content_tag(:li, content_tag(:a, link_to(msg, "##{resource.class.name.downcase}_#{resource.errors.details.to_a[index].first.to_s}")))
                end

    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
    <div class="error-summary" role="group" aria-labelledby="error-summary-heading-example-1" tabindex="-1">
      <h1 class="heading-medium error-summary-heading" id="error-summary-heading-example-1">
        #{sentence}
      </h1>
      <ul class="error-summary-list">
        #{links.join}
        <!-- <li><a href="#example-personal-details">Fix the error</a></li> -->
      </ul>
    </div>
    HTML

    html.html_safe
  end

  def devise_error_messages?
    !resource.errors.empty?
  end

end
