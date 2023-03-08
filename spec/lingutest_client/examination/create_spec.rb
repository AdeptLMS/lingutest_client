# frozen_string_literal: true

RSpec.describe LingutestClient::Examination, '.create' do
  subject(:create) { described_class.create(**params) }

  let(:params) do
    {
      exam_id: 1,
      candidate_id: 18,
      expires_at: Time.parse('10/10/2023'),
      redirect_url: 'http://example.com',
      team_id: 1,
      team_group_id: 1,
      student_id: 1
    }
  end

  around do |example|
    VCR.use_cassette('examination/create') do
      example.run
    end
  end

  it { expect(create).to be_a(described_class) }
  it { expect(create.exam).to be_a(LingutestClient::Exam) }
  it { expect(create.candidate).to be_a(LingutestClient::Candidate) }

  it { expect(create.id).to eq(41) }
  it { expect(create.total_score).to eq(0) }
  it { expect(create.max_score).to eq(2300) }
  it { expect(create.tasks_limit).to eq(23) }
  it { expect(create.total_time_spent).to eq(0) }
  it { expect(create.code).to eq('MAQ11r') }
  it { expect(create.redirect_url).to eq('http://example.com') }
  it { expect(create.price).to eq(2.3e3) }
  it { expect(create.team_id).to eq('1') }
  it { expect(create.team_group_id).to eq('1') }
  it { expect(create.student_id).to eq('1') }
  it { expect(create.status).to eq('pending') }
  it { expect(create.expires_at).to eq(Time.parse('2023-10-09 21:00:00.000000000 +0000')) }
  it { expect(create.created_at).to eq(Time.parse('2023-02-27 13:23:05.452000000 +0000')) }
  it { expect(create.updated_at).to eq(Time.parse('2023-02-27 13:23:05.452000000 +0000')) }
  it { expect(create.url).to eq('https://test.lingu.com/MAQ11r') }
end
