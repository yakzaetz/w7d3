class GoalsController < ApplicationController
    def create
        @goal = Goal.new(goal_params)
        @goal.user_id = params[:user_id]

        if @goal.save
        else
            flash[:errors] = @goal.errors.full_messages
        end 

        redirect_to user_url(@goal.user)

    end

    def destroy
        @goal = current_user.goals.find(params[:id])
        @goal.destroy
        redirect_to user_url(@goal.user)
    end
end 