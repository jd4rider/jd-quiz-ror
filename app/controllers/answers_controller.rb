class AnswersController < ApplicationController
  def index
    @data ||= request.request_parameters
    @questions ||= Session.find_by sessid: @data['sessid'].to_i
    #@questions ||= JSON.parse @questions.questions
    @answers = @questions.questions[@data['question_no'].to_i]['incorrect_answers'].concat([@questions.questions[@data['question_no'].to_i]['correct_answer']])
    @answers.shuffle!
  end
end
