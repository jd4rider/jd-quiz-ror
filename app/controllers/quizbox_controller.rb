class QuizboxController < ApplicationController
  def index
    @data ||= request.request_parameters
    #results = request.body.read
    @data['categoriesname'] = @data['categories'].split('-')[1]
    @data['question_no'] = '0';
    
    difficulty = @data['difficulty'].downcase
    quizType = @data['quiztype'].downcase
    id = @data['categories'].split('-')[0]
    amount = @data['numofquestions'] 

    if difficulty == "any" and quizType == "any" and id != 0
        url = 'https://opentdb.com/api.php?amount=' + amount + '&category=' + id;
    elsif difficulty != "any" and id == 0 and quizType == "any"
        url = 'https://opentdb.com/api.php?amount=' + amount + '&difficulty=' + difficulty;
    elsif difficulty != "any" and id != 0 and quizType == "any"
        url = 'https://opentdb.com/api.php?amount=' + amount + '&category=' + id + '&difficulty=' + difficulty;
    elsif difficulty == "any" and id == 0 and quizType != "any"
        url = 'https://opentdb.com/api.php?amount=' + amount + '&type=' + quizType;
    elsif difficulty == "any" and id != 0 and quizType != "any"
        url = 'https://opentdb.com/api.php?amount=' + amount + '&category=' + id + '&type=' + quizType;
    elsif difficulty != "any" and id == 0 and quizType != "any"
        url = 'https://opentdb.com/api.php?amount=' + amount + '&difficulty=' + difficulty + '&type=' + quizType;
    elsif difficulty != "any" and id != 0 and quizType != "any"
        url = 'https://opentdb.com/api.php?amount=' + amount + '&category=' + id + '&difficulty=' + difficulty + '&type=' + quizType;
    else 
        url = 'https://opentdb.com/api.php?amount=' + amount;
    end

    response = RestClient.get url
  
    questions = JSON.parse response


    @sessid = rand(3000000)
    Session.create(sessid: @sessid, questions: questions['results'])
    #print results['numofquestions']
  end
end
