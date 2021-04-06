class UsersController < ApplicationController
  def index
    # Return un-archived users only
    render jsonapi: User.where(archived: false)
  end

  def update
    user = User.find(params[:id])
    archived = user_params[:archived]

    # Users can't archive themselves
    if current_user.id == user.id && archived
      render json: { message: I18n.t('errors.user.archive') } , status: :unauthorized
    else
      user.attributes = user_params

      if user.valid?
        user.save
      end
    end
  end

  def user_activities
    user = User.find(params[:id])
    activities = user.audits.order('created_at desc')
    #TODO: Add activities serializer
    render json: activities
  end

  def user_params
    params.require(:user).permit(:email, :archived)
  end

end
