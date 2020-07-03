module UsersHelper
  def cred_page?
    request.env['PATH_INFO'].exclude? "/users/" # if user url
  end
end