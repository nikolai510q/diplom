Rails.application.config.middleware.use OmniAuth::Builder do
 provider :vkontakte, '6438183', 'XvFygsSTr42Ziui3PcyF' , scope: 'email'
end