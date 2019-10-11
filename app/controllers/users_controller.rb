class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  #edit, :update, :destroyの時は ensure_correct_userを呼び出す。別のユーザーが編集できない様にする。
  before_action :ensure_correct_user,{only:[:edit, :update, :destroy]}
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(session[:user_id])
    else
      render 'new'
    end
  end

  def update
    if @user.update(user_params)
      redirect_to user_path, notice: "画像を登録しました"
    else
      render 'edit'
    end
  end

  def edit
  end

  def show
  end
#ユーザidとログイン中のユーザーが異なる場合、権限がありませんとnoticeに出力させる
  def ensure_correct_user
    if @user.id != current_user.id 
      flash[:notice] = "権限がありません"
      redirect_to pictures_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :user_image, :user_image_cache)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
