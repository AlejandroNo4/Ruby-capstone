require 'telegram/bot'
require_relative '../lib/answers'

token = ''

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    ans_bot = Answer.new
    ans_bot.ans_img(message.text)
    bot.api.send_photo(chat_id: message.chat.id, photo: Faraday::UploadIO.new(ans_bot.reply, 'image/jpg'))
  end
end
