class BasicInfosController < ApplicationController
  load_and_authorize_resource
  before_filter :login_required

  # GET /basic_infos/1/edit
  def edit
    @basic_info = BasicInfo.find(params[:id])
  end

  # PUT /basic_infos/1
  # PUT /basic_infos/1.xml
  def update
    @basic_info = BasicInfo.find(params[:id])

    respond_to do |format|
      if @basic_info.update_attributes(params[:basic_info])
        flash[:notice] = '基本信息设置成功！'
        format.html { redirect_to(edit_basic_info_path(@basic_info)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @basic_info.errors, :status => :unprocessable_entity }
      end
    end
  end
end
