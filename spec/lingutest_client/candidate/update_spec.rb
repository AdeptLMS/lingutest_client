# frozen_string_literal: true

RSpec.describe LingutestClient::Candidate, '.update' do
  subject(:update) { described_class.update(candidate_id, **params) }

  let(:candidate_id) { 18 }
  let(:params) do
    {
      fname: 'Sean',
      lname: 'Palmer',
      email: 'palmer@gmail.com',
      locale: 'en',
      mobile: '11111111',
      gender: 'male',
      ssn: '11111111111'
    }
  end

  around do |example|
    VCR.use_cassette('candidate/update') do
      example.run
    end
  end

  it { expect(update).to be_a(described_class) }
  it { expect(update.id).to eq(candidate_id) }
  it { expect(update.email).to eq('palmer@gmail.com') }
  it { expect(update.fname).to eq('Sean') }
  it { expect(update.lname).to eq('Palmer') }
  it { expect(update.mobile).to eq('11111111') }
  it { expect(update.locale).to eq('en') }
  it { expect(update.ssn).to eq('11111111111') }
  it { expect(update.gender).to eq('male') }
end
