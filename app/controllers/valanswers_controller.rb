class ValanswersController < ApplicationController
  def index
    @data ||= request.request_parameters
    print @data
    @questions ||= Session.find_by sessid: @data['sessid'].to_i
    #@questions ||= @questions.questions
    @correctAnsChosen = false

    print @questions.questions
    @finish = @questions.questions.length == @data['question_no'].to_i + 1

    @answers = @data['answers'].split('&%&#')

    @correctAnsChosen = @answers[@data['selectedAns'].to_i] == @questions.questions[@data['question_no'].to_i]['correct_answer']


  end
end
