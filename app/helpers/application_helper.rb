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
end
