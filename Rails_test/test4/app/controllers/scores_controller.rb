class ScoresController < ApplicationController

    def index 
        @scores = Score.all
    end

    def show 
    end

    def new 
        @score = Score.new
    end
    
    def edit 
    end

    def create 
        @score = Score.new
        if @score.save 
            redirect_to index_path
        else
            render :new
        end
    end

    def destroy 
    end

    @private

    def score_params 
        params.require(:score).permit(:name, :composer, :arranger, :grade)
    end


end
