OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '145628795958061', 'e1d5d35eaafda44b42b1da2c1476b487'
end