# From http://stackoverflow.com/questions/8017042/pdfkit-not-rendering-correctly-in-rails-3-1

ActionController::Base.asset_host = Proc.new { |source, request|
  if request.env["REQUEST_PATH"].include? ".pdf"
    "file://#{Rails.root.join('public')}"
  else
    "#{request.protocol}#{request.host_with_port}"
  end
}