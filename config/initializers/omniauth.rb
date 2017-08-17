OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '498757838639-48gmt5cl1cp42d4gmmdcb48a5geou6qj.apps.googleusercontent.com', 'GK7M04BAc6l0e23jVNCf-GiB', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
