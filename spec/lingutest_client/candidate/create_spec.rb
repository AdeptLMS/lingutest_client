# frozen_string_literal: true

RSpec.describe LingutestClient::Candidate, '.create' do
  subject(:create) { described_class.create(**params) }

  let(:params) do
    {
      fname: 'Sean',
      lname: 'Palmer',
      email: 'sean@gmail.com',
      locale: 'en',
      mobile: '11111111',
      gender: 'male',
      ssn: '11111111111'
    }
  end

  around do |example|
    VCR.use_cassette('candidate/create') do
      example.run
    end
  end

  it { expect(create).to be_a(described_class) }
  it { expect(create.id).to eq(30) }
  it { expect(create.email).to eq('sean@gmail.com') }
  it { expect(create.fname).to eq('Sean') }
  it { expect(create.lname).to eq('Palmer') }
  it { expect(create.mobile).to eq('11111111') }
  it { expect(create.locale).to eq('en') }
  it { expect(create.ssn).to eq('11111111111') }
  it { expect(create.gender).to eq('male') }
end
