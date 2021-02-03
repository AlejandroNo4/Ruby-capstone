# frozen_string_literal: true

require 'telegram/bot'
require_relative 'main'

token = '1625240950:AAEqgLKzTrt0nWXc1LlXg117qR9pryH_mBI'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    ans_bot = Answer.new
    ans_bot.ans_img(message.text)
    bot.api.send_photo(chat_id: message.chat.id, photo: Faraday::UploadIO.new(ans_bot.reply, 'image/jpg'))
  end
end
