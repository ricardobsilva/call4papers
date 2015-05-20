require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe '#flash_messages' do
    it 'returns nothing if no flash message is supplied' do
      expect(helper.flash_messages).to eq('')
    end

    it 'displays flash message if supplied' do
      [:success, :error, :alert, :notice].each do |key|
        message = Faker::Lorem.words(5).join(' ')
        flash.clear # clear previous messages
        flash[key] = message
        expect(helper.flash_messages).to eq(render(partial: 'flash_messages', locals: { msg_type: key, message: message }))
      end
    end
  end
end
