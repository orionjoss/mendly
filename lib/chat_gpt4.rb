require 'openai'
class ChatGPT4Client
def initialize
@client = OpenAI::Client.new(api_key: ENV['OPENAI_API_KEY'])
end
def generate_text(prompt, length)
@client.completions(
engine: 'text-davinci-002',
prompt: prompt,
max_tokens: length
)['choices'][0]['text']
end
end
