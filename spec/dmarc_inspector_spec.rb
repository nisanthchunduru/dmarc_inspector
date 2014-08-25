describe DMARCInspector do
  describe '#receiver_policy' do
    it 'returns receiver policy of a domain' do
      # TODO: Mock DNS query
      # "v=DMARC1\; p=none\; rua=mailto:mailauth-reports@google.com"
      dmarc_inspector = DMARCInspector.new('gmail.com')
      expect(dmarc_inspector.receiver_policy).to eq(:none)
    end

    context "receiver policy is 'reject'" do
      it 'returns :reject' do
        # TODO: Mock DNS query
        # "v=DMARC1\; p=reject\; sp=none\; pct=100\; rua=mailto:dmarc-yahoo-rua@yahoo-inc.com, mailto:dmarc_y_rua@yahoo.com\;"
        dmarc_inspector = DMARCInspector.new('yahoo.com')
        expect(dmarc_inspector.receiver_policy).to eq(:reject)
      end
    end

    context "dns information isn't available" do
      it 'returns :none' do
        # TODO: Mock DNS query
        dmarc_inspector = DMARCInspector.new('supportbee.com')
        expect(dmarc_inspector.receiver_policy).to eq(:none)
      end
    end
  end
end
