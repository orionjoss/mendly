require 'weaviate'

WeaviateClient = Weaviate::Client.new(
  url: ENV['https://mendly-xl1syyd8.weaviate.network'],
  api_key: ENV['WEAVIATE_API_KEY'],
  model_service: :openai, # Service that will be used to generate vectors
  model_service_api_key: ENV['OPENAI_ACCESS_TOKEN']
)
