# config/initializers/stripe.rb

Rails.configuration.stripe = {
  publishable_key: 'pk_test_51NAWWLLmCgbhGkdH3KnzIC0e4Pc8wVYQMpNFH6KUkNT7VxP8VptFohi6hHYrew8Y1zyJ7KvkfKYLMWkk4WrqB9p200WHNN9jvm',
  secret_key: 'sk_test_51NAWWLLmCgbhGkdH1PuKScZqkUywEaoFDPf9B8o7Lmt8wc1MCwdKUlnPCa2nuBEc0nrrHb7wyGu9bOUBmgswZclz005LdgO3lF'
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]

