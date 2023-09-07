require "langchain"

class LangchainService
  attr_reader :client, :prompt

  def initialize(prompt)
    @client = Langchain::Client.new
    @prompt = prompt
  end
end
