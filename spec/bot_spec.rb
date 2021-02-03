# frozen_string_literal: true

# spec/bot_spec.rb

require_relative '../lib/main'

describe Answer do
  describe '.ans_img' do
  let(:ans_test) {Answer.new}
    it 'The reply is the expected due the message' do
      ans_test.ans_img('When did he leave?')
      expect(ans_test.reply).to eql('../img/try_again.jpg')
    end
  end
end
