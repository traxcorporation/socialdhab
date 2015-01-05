class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  

  def create
  respond_to do |format|
	@users = User.paginate(page: params[:page])
      format.html {@microposts}
      format.json { render json: @microposts }
	   @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Commentaires crée!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end
  
  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end
end