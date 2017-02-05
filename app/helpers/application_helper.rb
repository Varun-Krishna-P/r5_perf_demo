module ApplicationHelper
    
    def display_error_messages model
        model_errors = model.errors.full_messages
        content_tag(:div, class: 'row') do 
                content_tag(:div, class: 'large-9 columns') do
                    content_tag(:div, class: 'error-container') do
                     concat(content_tag(:div, class: 'error-header') do
                       content_tag(:h4, "#{pluralize(model.errors.count, 'error')} prohibited this #{model.class.to_s.downcase} from being saved: ")
                     end)
                    concat(content_tag(:ul) do        
                        model_errors.each do |msg|
                           concat content_tag(:li, msg)
                        end
                    end) # end of content tag ul
                end # end of content tag div error container
            end # div.large-9
        end # div.row         
    end
    
    def breadcrumbs(**options)
#        byebug
        content_tag(:div, class: 'expanded row bg-grey') do
            content_tag(:div, class: 'large-12 columns') do
                content_tag(:nav, aria:{label: "You are here: "}, role:"navigation") do
                    content_tag(:ul, class: 'breadcrumbs') do
                        concat(content_tag(:li) do
                           concat(content_tag(:a, options[:home_path], href: "#"))
                        end)
                        
                        concat(content_tag(:li) do
                            content_tag(:a, options[:controller_path], href: "#")
                        end) if options.has_key? :controller_path

                        
                        concat(content_tag(:li, class: "disabled") do
                            options[:action_path]
                        end) if options.has_key? :action_path
                    end

                end # end or nav
            end # end of large-12
        end # end of row
    end
end
