module ApplicationHelper
  def gravatar_url_for(email, pic = "avatar.jpg", options = {})
    default = "#{request.protocol}#{request.host}:#{request.port}/images/#{pic}"
    subdomain = (request.protocol == "https://") ? "secure" : "www"
    return "#{request.protocol}#{subdomain}.gravatar.com/avatar.php?default=#{default}&gravatar_id=#{Digest::MD5.hexdigest(email)}"
  end

end
