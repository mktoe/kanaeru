class TasksController < ApplicationController

    #ログインしていない場合がログインページにリダイレクト
    before_action :authenticate_user!
    
    def new
        @task = Task.new
    end

    def create

        paramtheday = params[:task]['dead_line(1i)']+'-'+params[:task]['dead_line(2i)']+'-'+params[:task]['dead_line(3i)']
        @datetheday = Date.parse(paramtheday)

        @task = Task.new(
            user_id: params[:task][:user_id],
            task: params[:task][:task],
            dead_line: @datetheday
        )
        if @task.save
            redirect_to("/visions")
        else
            redirect_to("/visions")
        end
    end

    def edit
        @task = Task.find_by(id: params[:id])
    end

    def update
        paramtheday = params[:task]['dead_line(1i)']+'-'+params[:task]['dead_line(2i)']+'-'+params[:task]['dead_line(3i)']
        @datetheday = Date.parse(paramtheday)

        @task = Task.find_by(id: params[:id])
        @task.task = params[:task][:task]
        @task.dead_line = @datetheday
        if @task.save
            flash[:notice] = "タスクを修正しました。"
            redirect_to("/visions")
        else
            render("tasks/edit")
        end
    end


    def destroy
        @task = Task.find_by(id: params[:id])
        @task.destroy
        flash[:notice] = "タスクを削除しました"
        redirect_to("/visions")
    end


    def finished_change
        @task = Task.find_by(id: params[:id])
        @task.finished = true
        if @task.save
            flash[:notice] = "タスク完了おめでとうございます！"
            redirect_to("/visions")
        end

    end

    def unfinished_change
        @task = Task.find_by(id: params[:id])
        @task.finished = false
        if @task.save
            flash[:notice] = "タスクを戻しました。"
            redirect_to("/visions")
        end

    end


    

end
