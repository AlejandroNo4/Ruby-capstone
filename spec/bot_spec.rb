require_relative '../lib/answers'

describe Answer do
  describe '.ans_img' do
    let(:ans_test) { Answer.new }
    context 'Will return the expected image depending on the message' do
      it 'returns a random image from the variable simple_answer' do
        ans_test.ans_img('will I ever get married?')
        expect(ans_test.reply).to eql(ans_test.simple_answer)
      end

      it 'returns a random image from the variable simple_answer no matter if its lowercase or uppercase' do
        ans_test.ans_img('DO YOU LIKE MY SHOES?')
        expect(ans_test.reply).to eql(ans_test.simple_answer)
      end

      it 'returns a random image from the variable simple_answer' do
        ans_test.ans_img('should i drink water or coffee?')
        expect(ans_test.reply).to eql(ans_test.option_answer)
      end

      it 'returns the specific image when the message is bye, goodbye or thanks' do
        ans_test.ans_img('should i drink water or coffee?')
        expect(ans_test.reply).to eql(ans_test.option_answer)
      end

      it 'returns nothing if the question has the word DO' do
        ans_test.ans_img('what do we need to do?')
        expect(ans_test.reply).to eql('../img/nothing.jpg')
      end
    end
  end
end

describe Answer do
  describe '.ans_img' do
    let(:ans_test) { Answer.new }
    context "It will return the img 'try again' when the expected messaged is input (BAD USAGE)" do
      it "the word 'When' triggers this" do
        ans_test.ans_img('When did he leave?')
        expect(ans_test.reply).to eql('../img/try_again.jpg')
      end

      it "the word 'How' triggers this" do
        ans_test.ans_img('How are you?')
        expect(ans_test.reply).to eql('../img/try_again.jpg')
      end

      it 'When the message is not a question' do
        ans_test.ans_img('This is not a question')
        expect(ans_test.reply).to eql('../img/try_again.jpg')
      end

      it 'With this special little easter egg' do
        ans_test.ans_img("Can't you say anything else but no?")
        expect(ans_test.reply).to eql('../img/try_again.jpg')
      end
    end
  end
end
