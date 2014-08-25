describe DMARCInspector do
  describe '#receiver_policy' do
    it 'returns receiver policy of a domain' do
      # TODO: Mock DNS query
      dmarc_inspector = DMARCInspector.new('gmail.com')
      expect(dmarc_inspector.receiver_policy).to eq(:none)
    end

    context "policy is 'reject'" do
      it 'returns :reject' do
        # TODO: Mock DNS query
        dmarc_inspector = DMARCInspector.new('yahoo.com')
        expect(dmarc_inspector.receiver_policy).to eq(:reject)
      end
    end
  end
end
