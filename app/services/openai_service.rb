require "openai"
require "langchain"


class OpenaiService
  attr_reader :client, :prompt

  def initialize(prompt)
    @client = OpenAI::Client.new
    @prompt = prompt
    @database = Langchain::Tool::Database.new(connection_string: Rails.env.development? ? ENV["DB_LOCAL"] : ENV["DB_PROD"])
    @agent = Langchain::Agent::SQLQueryAgent.new(llm: Langchain::LLM::OpenAI.new(api_key: ENV["OPENAI_API_KEY"]), db: @database)
  end

  def call
    response = client.chat(
      parameters: {
        model: "gpt-3.5-turbo", # Required.
        messages: [{ role: "user", content: prompt }], # Required.
        temperature: 0.7,
        stream: false,
        max_tokens: 100 # might want to check this
      }
    )
    # you might want to inspect the response and see what the api is giving you
    return response["choices"][0]["message"]["content"]
  end

  def call_langchain(question)
    @agent.run(question: question)
  end
end
