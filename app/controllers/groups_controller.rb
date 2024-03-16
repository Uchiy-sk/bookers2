class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_user, only: [:edit, :update]

  def index
    @book = Book.new
    @groups = Group.all
    @user = current_user
  end

  def show
    @book = Book.new
    @group = Group.find(params[:id])
    @user = current_user
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    @group = Group.new(group_params)
    @group.owner_id = current_user.id
    if @group.save!
      current_user.group_users.create(group_id: @group.id)
      redirect_to groups_path
    else
      render 'new'
    end
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to group_path(@group.id)
    else
      render 'edit'
    end
  end

  def new_mail
    @group = Group.find(params[:group_id])
  end

  def send_event_mail
    group = Group.find(params[:group_id])
    @mail_title = params[:mail_title]
    @mail_content = params[:mail_content]
    # binding.pry
    EventerMailer.send_mail(@mail_title, @mail_content, group).deliver!
  end

  private

  def group_params
    params.require(:group).permit(:name, :introduction, :group_image)
  end

  def ensure_user
    @group = Group.find(params[:id])
    unless @group.owner_id == current_user.id
      redirect_to groups_path
    end
  end
end
