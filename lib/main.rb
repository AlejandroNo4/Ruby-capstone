class Answer
  attr_accessor :reply

  def initialize
    @reply = ''
  end

  def ans_img(message)
    @simple_answer = ['../img/yes.jpg', '../img/no.jpg', '../img/dont_think.jpg', '../img/definitely.jpg',
                      '../img/maybe.jpg', '../img/never.jpg'].sample
    @option_answer = ['../img/neither.jpg', '../img/nothing.jpg', '../img/first.jpg', '../img/second.jpg'].sample
    @reply = case message.downcase
             when %r{/start}
               '../img/start.jpg'
             when /bye|goodbye|thanks/
               '../img/end.jpg'
             when /\bor\b/
               @option_answer
             when /\sdo\s/
               '../img/nothing.jpg'
             when /else\sbut\sno|when\s|how/
               '../img/try_again.jpg'
             when /\?/
               @simple_answer
             else
               '../img/try_again.jpg'
             end
  end
end