Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '940340948384-u8rlbs685rqnas1vleaqafh3j0vm93a6.apps.googleusercontent.com', 'd0-S8DrbtB4EtVN6K5rvIR6P', scope: 'userinfo.profile,youtube'
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE if Rails.env.development?
end