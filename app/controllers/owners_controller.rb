class OwnersController < ApplicationController
  def index
    @owners = Owner.all
  end

  def show
    respond_to do |format|
      format.html
      format.json{render json: @owner}
    end
  end

  def new
    @owner = Owner.new
  end

  def edit
    @owner
  end

  def create
    respond_to do |format|
      if @owner.save
        format.html {redirect_to @owner, notice: 'Owner was successfully created'}
        format.json {redirect action: 'show', status: :created, location: @owner }
      else
        format.html {render action: 'new'}
        format.json {render json: @owner.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @owner.update(owner_params)
        format.html {redirect_to @owner, notice: 'Owner successfully updated.'}
        format.json {header :no_content}
      else
        format.html {render action: 'edit'}
        format.json {render json: @owner.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @owner.destroy
    respond_to do |format|
      format.html {redirect_to owners_url}
      format.json {header :no_content}
    end
  end

  private

  def set_owner
    @owner = Owner.find(params[:id])
  end

  def owner_params
    params.require(:owner).permit(:name, :email, :password, :password_confirmation, :remember_me)
  end
end