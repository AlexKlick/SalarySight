# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'salary-sight.herokuapp', 'localhost:3000'

    resource '*',
             headers: %w[Origin Content-Type Content-MD5 Content-Disposition],
             methods: %i[get post put patch delete options head]
  end
end
