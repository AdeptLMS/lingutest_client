# frozen_string_literal: true

$LOAD_PATH.unshift File.dirname(__FILE__)

module LingutestClient
  VERSION = '0.1.2'

  autoload :API, 'lingutest_client/api'
  autoload :Base, 'lingutest_client/base'
  autoload :Candidate, 'lingutest_client/candidate'
  autoload :Configuration, 'lingutest_client/configuration'
  autoload :Connection, 'lingutest_client/connection'
  autoload :CandidateList, 'lingutest_client/candidate_list'
  autoload :Exam, 'lingutest_client/exam'
  autoload :ExamList, 'lingutest_client/exam_list'
  autoload :Examination, 'lingutest_client/examination'
  autoload :ExaminationList, 'lingutest_client/examination_list'
  autoload :Types, 'lingutest_client/types'

  include Configuration

  class ValidationError < StandardError; end

  class Client
    include LingutestClient::Connection
  end
end
