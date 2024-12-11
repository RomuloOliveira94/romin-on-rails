module UiHelper
  def romin_navbar(brand: {}, links: [])
    content_tag :nav, class: "simple-nav-bar" do
      content_tag(:div, class: "simple-nav-bar-container") do
        concat(
          content_tag(:a, href: brand[:url], class: "simple-nav-bar-brand-link") do
            concat content_tag(:h1, brand[:title], class: "simple-nav-bar-brand-title") if brand[:title].present?
            concat image_tag(brand[:logo], class: "simple-nav-bar-brand-logo") if brand[:logo].present?
          end
        )

        concat(
          content_tag(:button, class: "simple-nav-bar-burger-button") do
            concat content_tag(:span, "", class: "simple-nav-bar-burger-line")
            concat content_tag(:span, "", class: "simple-nav-bar-burger-line")
            concat content_tag(:span, "", class: "simple-nav-bar-burger-line")
          end
        )

        concat(
            content_tag(:button, class: "simple-nav-bar-close-button", data: { action: "click->menu#toggle", menu_target: "closeButton" }) do
              concat content_tag(:span, "", class: "simple-nav-bar-close-line")
              concat content_tag(:span, "", class: "simple-nav-bar-close-line")
            end
        )

        concat(
          content_tag(:div, class: "simple-nav-bar-nav-list-container") do
            content_tag(:nav) do
              content_tag(:ul, class: "simple-nav-bar-nav-list") do
                links.map do |link|
                  concat content_tag(:li, link_to(link[:label], link[:url], class: "simple-nav-bar-nav-link"), class: "simple-nav-bar-nav-item")
                end.join.html_safe
              end
            end
          end
        )
      end
    end
  end

  def romin_navbar_stimulus(brand: {}, links: [])
    content_tag :nav, class: "simple-nav-bar", data: { controller: "menu" } do
      content_tag(:div, class: "simple-nav-bar-container") do
        concat(
          content_tag(:a, href: brand[:url], class: "simple-nav-bar-brand-link") do
            concat content_tag(:h1, brand[:title], class: "simple-nav-bar-brand-title") if brand[:title].present?
            concat image_tag(brand[:logo], class: "simple-nav-bar-brand-logo") if brand[:logo].present?
          end
        )

        concat(
          content_tag(:button, class: "simple-nav-bar-burger-button", data: { action: "click->menu#toggle", menu_target: "burgerButton" }) do
            concat content_tag(:span, "", class: "simple-nav-bar-burger-line")
            concat content_tag(:span, "", class: "simple-nav-bar-burger-line")
            concat content_tag(:span, "", class: "simple-nav-bar-burger-line")
          end
        )

        concat(
            content_tag(:button, class: "simple-nav-bar-close-button", data: { action: "click->menu#toggle", menu_target: "closeButton" }) do
              concat content_tag(:span, "", class: "simple-nav-bar-close-line")
              concat content_tag(:span, "", class: "simple-nav-bar-close-line")
            end
        )

        concat(
          content_tag(:div, class: "simple-nav-bar-nav-list-container", data: { menu_target: "menu", action: "click->menu#toggle" }) do
            content_tag(:nav) do
              content_tag(:ul, class: "simple-nav-bar-nav-list") do
                links.map do |link|
                  concat content_tag(:li, link_to(link[:label], link[:url], class: "simple-nav-bar-nav-link"), class: "simple-nav-bar-nav-item")
                end.join.html_safe
              end
            end
          end
        )
      end
    end
  end
end
