# frozen_string_literal: true

RSpec.describe Generator do
  subject(:generator) { described_class.new }

  let(:calculator) { double }
  let(:message) { double }

  describe '#send_messages' do
    before do
      allow(Calculator)
        .to receive(:new)
        .and_return(calculator)

      allow(calculator)
        .to receive(:sum)
        .with(5, 6)

      allow(WaterDrop::Message)
        .to receive(:new)
        .and_return(message)

      allow(message)
        .to receive(:send!)
    end

    it { generator.send_messages }
  end
end
