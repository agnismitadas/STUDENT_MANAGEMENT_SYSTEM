module ApplicationHelper
    def formatted_date(date)
        if date.nil?
            "N/A" 
        else
            date.strftime('%A, %d %b, %Y')
        end
    end
end