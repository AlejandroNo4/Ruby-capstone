class Answer
  attr_reader :reply, :simple_answer, :option_answer

  def initialize
    @reply = ''
    @simple_answer = ['../img/yes.jpg', '../img/no.jpg', '../img/dont_think.jpg', '../img/definitely.jpg',
                      '../img/maybe.jpg', '../img/never.jpg'].sample
    @option_answer = ['../img/neither.jpg', '../img/nothing.jpg', '../img/first.jpg', '../img/second.jpg'].sample
  end

  def question(message)
    @reply = case message.downcase
             when /\bor\b/
               @option_answer
             when /\bwhat\sshould|\sdo\s/
               '../img/nothing.jpg'
             when /else\sbut\sno|\bwhen\s|\bhow\s|\bwhat\s|\bwhy\s|\bwhere\s|\bwho\s/
               '../img/try_again.jpg'
             else
               @simple_answer
             end
  end

  def no_question(message)
    @reply = case message.downcase
             when %r{/start}
               '../img/start.jpg'
             when /bye|goodbye|thanks/
               '../img/end.jpg'
             else
               '../img/try_again.jpg'
             end
  end

  def ans_img(message)
    message[-1, 1] == '?' ? question(message) : no_question(message)
  end
end
