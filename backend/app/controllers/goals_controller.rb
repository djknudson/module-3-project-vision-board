class GoalsController < ApplicationController

    def index
        goals = Goal.all
        render json: GoalSerializer.new(goals)
    end

    def show
        goal = Goal.find(params[:id])
        render json: GoalSerializer.new(goal)
    end

    def create
        goal = Goal.create(goal_params)
        if goal.valid?
            render json: GoalSerializer.new(goal)
        else
            # error
        end
    end

    def update
        goal = Goal.find(params[:id])
        goal.update(goal_params)
        if goal.valid?
            render json: GoalSerializer.new(board)
        else
            #error
        end
    end

    def destroy
        goal = Goal.find(params[:id])
        goal.destroy
        render json: GoalSerializer.new(goal)
    end

    private

    def board_params
        params.require(:board).permit(:title, :content, :status)
    end

end
