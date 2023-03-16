# frozen_string_literal: true

RSpec.describe LingutestClient::Examination, '.find' do
  subject(:find) { described_class.find(38) }

  around do |example|
    VCR.use_cassette('examination/find') do
      example.run
    end
  end

  it { expect(find).to be_a(described_class) }
  it { expect(find.exam).to be_a(LingutestClient::Exam) }
  it { expect(find.candidate).to be_a(LingutestClient::Candidate) }

  it { expect(find.id).to eq(38) }
  it { expect(find.total_score).to eq(0) }
  it { expect(find.max_score).to eq(500) }
  it { expect(find.tasks_limit).to eq(5) }
  it { expect(find.total_time_spent).to eq(0) }
  it { expect(find.code).to eq('rMefoe') }
  it { expect(find.redirect_url).to be_nil }
  it { expect(find.price).to eq(2.334e3) }
  it { expect(find.team_id).to eq('989952716') }
  it { expect(find.team_group_id).to eq('1059638631') }
  it { expect(find.student_id).to eq('56831960') }
  it { expect(find.status).to eq('pending') }
  it { expect(find.expires_at).to eq(Time.parse('2023-03-28 18:32:55.543000000 +0000')) }
  it { expect(find.created_at).to eq(Time.parse('2023-02-26 18:33:04.892000000 +0000')) }
  it { expect(find.updated_at).to eq(Time.parse('2023-02-26 18:33:04.892000000 +0000')) }
  it { expect(find.url).to eq('https://test.lingu.com/rMefoe') }
  it { expect(find.result_url).to eq('https://test.lingu.com/examinations/rMefoe') }
end
