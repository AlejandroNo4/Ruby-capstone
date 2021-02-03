# frozen_string_literal: true

require 'telegram/bot'

token = '1625240950:AAEqgLKzTrt0nWXc1LlXg117qR9pryH_mBI'

class Answer 
  attr_accessor :reply
  def initialize
    @reply = ''
  end

  def ans_img(message)
    @simple_answer = ['../img/yes.jpg', '../img/no.jpg', '../img/dont_think.jpg', '../img/definitely.jpg',
                     '../img/maybe.jpg', '../img/never.jpg'].sample
    @option_answer = ['../img/neither.jpg', '../img/nothing.jpg', '../img/first.jpg', '../img/second.jpg'].sample
    case message.downcase
    when %r{/start}
      @reply = '../img/start.jpg'
    when /bye|goodbye|thanks/
      @reply = '../img/end.jpg'
    when /\bor\b/
      @reply = @option_answer
    when /\sdo\s/ 
      @reply = '../img/nothing.jpg'
    when /else\sbut\sno|when\s|how/
      @reply = '../img/try_again.jpg'
    when /\?/
      @reply = @simple_answer
    else
      @reply = '../img/try_again.jpg'
    end
  end
end

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    ans_bot =  Answer.new
    ans_bot.ans_img(message.text)
    bot.api.send_photo(chat_id: message.chat.id, photo: Faraday::UploadIO.new(ans_bot.reply, 'image/jpg'))
  end
end
