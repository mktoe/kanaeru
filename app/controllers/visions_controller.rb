class VisionsController < ApplicationController

    #ログインしていない場合がログインページにリダイレクト
    before_action :authenticate_user!
    
    def index
        @vision = Vision.find_by(user_id: current_user.id)
        @tasks = Task.where(user_id: current_user.id).order('dead_line ASC')
        @task = Task.new
    end

    def new
        @vision = Vision.new

        #ビジョンが登録されていたら一覧画面へリダイレクト
        if Vision.find_by(user_id: current_user.id)
            redirect_to("/visions")
        end
    end

    def create
        paramtheday = params[:vision]['dead_line(1i)']+'-'+params[:vision]['dead_line(2i)']+'-'+params[:vision]['dead_line(3i)']
        @datetheday = Date.parse(paramtheday)

        @vision = Vision.new(
            user_id: params[:vision][:user_id],
            vision: params[:vision][:vision],
            dead_line: @datetheday
        )
        if @vision.save
            redirect_to("/visions")
        else
            render("visions/new")
        end
    end

    def edit
        @vision = Vision.find_by(id: params[:id])
    end

    def update
        @vision = Vision.find_by(id: params[:id])

        paramtheday = params[:vision]['dead_line(1i)']+'-'+params[:vision]['dead_line(2i)']+'-'+params[:vision]['dead_line(3i)']
        @datetheday = Date.parse(paramtheday)
        
        @vision.vision = params[:vision][:vision]
        @vision.dead_line = @datetheday

        if @vision.save
            flash[:notice] = "ビジョンを修正しました。"
            redirect_to("/visions")
        else
            render("visions/edit")
        end
    end
end
