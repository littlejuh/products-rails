Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://products-react-2la2.onrender.com', 'http://localhost:5173'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      expose: ['Authorization'],
      credentials: true
  end
end