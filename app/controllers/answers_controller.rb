class AnswersController < ApplicationController
  def create
    @correct = false
    user = current_user
    temple_id = params[:temple_id]
    @temple = Temple.new({:name => 'Already guessed'})
    unless session[:quiz_temple_id].nil?
      begin
        @temple = Temple.find(session[:quiz_temple_id])
        if session[:quiz_temple_id].to_s == temple_id.to_s
          @correct = true
        end
        Answer.create({user_id: (current_user.nil?)? nil : current_user.id, temple_id: @temple.id, guess_id: temple_id, correct: @correct})
      rescue ActiveRecord::RecordNotFound
        @temple = Temple.new({:name => 'Already guessed'})
      end
      session.delete(:quiz_temple_id)
    end
    @correct_answers = (current_user.nil?)? 0 : current_user.answers.correct_answers.count
    @total_answers = (current_user.nil?)? 0 : current_user.answers.count
  end
end
