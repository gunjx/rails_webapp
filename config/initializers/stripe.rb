if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_ehamUdPR2BV3VPaO1F3LBzQW',
    secret_key: 'sk_test_rdBz0B0RPqj7eDXzao3PJ7ub'
  }
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]
