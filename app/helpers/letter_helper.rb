module LetterHelper
  
  def heading_format_phone(phone_number)
    return "none" if phone_number.nil?
    phone = phone_number.gsub(/[^0-9]/, '')  #remove any non-numerical characters
    "#{phone[0..2]} / #{phone[3..5]}-#{phone[6..9]}"
  end
  
end
