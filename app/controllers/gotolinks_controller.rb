class GotolinksController < ApplicationController
  def index
    @gotolinks = Gotolink.all
  end

  def goto
    # GotoLink is the Model
    @gotolink = Gotolink.find_by(slug: params[:slug])
    redirect_to @gotolink.url, allow_other_host: true
  end

  def new
    @gotolink = Gotolink.new
  end

  def create
    @gotolink = Gotolink.new(gotolink_params)
    if @gotolink.save
      # run validation
      # save to db, it won't save if the validation fails
      redirect_to gotolinks_path
      # redirect update the status code to 302
      # and make another request to the new location
      # and go to the index action where the @gotolinks is refresh with updated data
    else
      render :new, status: :unprocessable_entity
      # only apply to post request
      # render :new # turbo will not bother the error message tox DOM
    end
  end

  private

  def gotolink_params
    params.require(:gotolink).permit(:title, :url, :slug)
  end

end
