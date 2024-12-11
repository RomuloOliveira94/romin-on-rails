module UiHelper
  def romin_navbar(brand: {}, links: [])
    content_tag :nav, class: "bg-gray-800 p-4 shadow-sm", data: { controller: "menu" } do
      content_tag(:div, class: "container mx-auto flex flex-wrap items-center") do
        concat(
          content_tag(:a, href: brand[:url], class: "flex-1 flex items-center gap-2") do
            concat content_tag(:h1, brand[:title], class: "text-white text-lg font-bold") if brand[:title].present?
            concat image_tag(brand[:logo], class: "w-10 h-10") if brand[:logo].present?
          end
        )

        concat(
          content_tag(:button, class: "text-white lg:hidden", data: { action: "click->menu#toggle", menu_target: "burgerButton" }) do
            concat content_tag(:span, "", class: "block w-4 h-0.5 bg-white mb-1 rounded-sm")
            concat content_tag(:span, "", class: "block w-4 h-0.5 bg-white mb-1 rounded-sm")
            concat content_tag(:span, "", class: "block w-4 h-0.5 bg-white rounded-sm")
          end
        )

        concat(
            content_tag(:button, class: "relative w-6 h-6 flex items-center justify-center relative text-white lg:hidden", data: { action: "click->menu#toggle", menu_target: "closeButton" }) do
              concat content_tag(:span, "", class: "block absolute w-4 h-0.5 transform rotate-45 bg-white")
              concat content_tag(:span, "", class: "block absolute w-4 h-0.5 transform -rotate-45 bg-white")
            end
        )

        concat(
          content_tag(:div, class: "hidden lg:flex lg:items-center lg:w-auto w-full", data: { menu_target: "menu", action: "click->menu#toggle" }) do
            content_tag(:nav) do
              content_tag(:ul, class: "text-xl text-start items-center gap-x-5 pt-4 md:gap-x-4 lg:text-lg lg:flex lg:pt-0") do
                links.map do |link|
                  concat content_tag(:li, link_to(link[:label], link[:url], class: "text-white hover:text-gray-400"), class: "py-2 lg:py-0 ")
                end.join.html_safe
              end
            end
          end
        )
      end
    end
  end

  def romin_sidebar(items: [])
    content_tag :aside, class: "bg-gray-800 text-white w-64 h-screen p-4 hidden md:block" do
      content_tag(:ul) do
        items.map do |item|
          concat content_tag(:li, link_to(item[:label], item[:url], class: "block py-2 hover:bg-gray-700"))
        end.join.html_safe
      end
    end
  end

  def romin_footer(text:)
    content_tag :footer, class: "bg-gray-800 text-center p-4 text-white" do
      text
    end
  end
end
