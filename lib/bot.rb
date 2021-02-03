require 'telegram/bot'


token = "1625240950:AAEqgLKzTrt0nWXc1LlXg117qR9pryH_mBI"

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    picture = ['../no.jpg', '../si.jpg'].sample
    simple_answer = ['Yes', 'No', 'Maybe someday', 'How about No', 'The destiny is calling'].sample
    option_answer = ['Neither', 'Nothing', 'mmm the first one', 'Second one defenitly'].sample
    case message.text
    when /(?=or)/
      bot.api.send_photo(chat_id: message.chat.id, photo: Faraday::UploadIO.new( picture, 'image/jpeg'))
    when /\?/
      bot.api.send_message(chat_id: message.chat.id, text: simple_answer)
    else
      bot.api.send_message(chat_id: message.chat.id, text: "Try asking again.")
    end
  end
end