class RecruitmentsController < ApplicationController
  uses_tiny_mce

  load_and_authorize_resource
  before_filter :login_required, :except => [:index, :show]

  add_crumb("招聘信息", "/recruitments")

  # GET /recruitments
  # GET /recruitments.xml
  def index
    @recruitments = Recruitment.paginate(:page => params[:page], :order => "created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @recruitments }
    end
  end

  # GET /recruitments/1
  # GET /recruitments/1.xml
  def show
    @recruitment = Recruitment.find(params[:id])

    add_crumb(@recruitment.title)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @recruitment }
    end
  end

  # GET /recruitments/new
  # GET /recruitments/new.xml
  def new
    @recruitment = Recruitment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @recruitment }
    end
  end

  # GET /recruitments/1/edit
  def edit
    @recruitment = Recruitment.find(params[:id])
  end

  # POST /recruitments
  # POST /recruitments.xml
  def create
    @recruitment = Recruitment.new(params[:recruitment])

    respond_to do |format|
      if @recruitment.save
        flash[:notice] = '招聘信息已成功创建！'
        format.html { redirect_to(@recruitment) }
        format.xml  { render :xml => @recruitment, :status => :created, :location => @recruitment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @recruitment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /recruitments/1
  # PUT /recruitments/1.xml
  def update
    @recruitment = Recruitment.find(params[:id])

    respond_to do |format|
      if @recruitment.update_attributes(params[:recruitment])
        flash[:notice] = '招聘信息已成功更新！'
        format.html { redirect_to(@recruitment) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @recruitment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /recruitments/1
  # DELETE /recruitments/1.xml
  def destroy
    @recruitment = Recruitment.find(params[:id])
    @recruitment.destroy

    respond_to do |format|
      format.html { redirect_to(recruitments_url) }
      format.xml  { head :ok }
    end
  end
end
