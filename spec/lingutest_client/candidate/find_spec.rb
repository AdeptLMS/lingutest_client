# frozen_string_literal: true

RSpec.describe LingutestClient::Candidate, '.find' do
  subject(:find) { described_class.find(18) }

  around do |example|
    VCR.use_cassette('candidate/find') do
      example.run
    end
  end

  it { expect(find).to be_a(described_class) }
  it { expect(find.id).to eq(18) }
  it { expect(find.email).to eq('sean.palmer@example.com') }
  it { expect(find.fname).to eq('Sean') }
  it { expect(find.lname).to eq('Palmer') }
  it { expect(find.mobile).to eq('91122335') }
  it { expect(find.locale).to eq('en') }
  it { expect(find.ssn).to eq('12029845666') }
  it { expect(find.gender).to eq('male') }
end
