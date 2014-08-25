describe DMARCInspector do
  describe '#receiver_policy' do
    it 'returns :none' do
      expect(DMARCInspector.new.receiver_policy).to eq(:none)
    end
  end
end
