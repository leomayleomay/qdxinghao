class BroadcastsController < ApplicationController
  uses_tiny_mce

  load_and_authorize_resource
  before_filter :login_required, :except => [:index, :show, :category]

  add_crumb("新闻中心", "/broadcasts")

  # GET /broadcasts
  # GET /broadcasts.xml
  def index
    @broadcasts = Broadcast.paginate(:page => params[:page], :order => "created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @broadcasts }
    end
  end

  # GET /broadcasts/1
  # GET /broadcasts/1.xml
  def show
    @broadcast = Broadcast.find(params[:id])
    @broadcast.hits.create

    add_crumb(@broadcast.title)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @broadcast }
    end
  end

  # GET /broadcasts/new
  # GET /broadcasts/new.xml
  def new
    @broadcast = Broadcast.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @broadcast }
    end
  end

  # GET /broadcasts/1/edit
  def edit
    @broadcast = Broadcast.find(params[:id])
  end

  # POST /broadcasts
  # POST /broadcasts.xml
  def create
    @broadcast = Broadcast.new(params[:broadcast])

    respond_to do |format|
      if @broadcast.save
        flash[:notice] = '新闻已创建成功！'
        format.html { redirect_to(@broadcast) }
        format.xml  { render :xml => @broadcast, :status => :created, :location => @broadcast }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @broadcast.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /broadcasts/1
  # PUT /broadcasts/1.xml
  def update
    @broadcast = Broadcast.find(params[:id])

    respond_to do |format|
      if @broadcast.update_attributes(params[:broadcast])
        flash[:notice] = '新闻已更新成功！'
        format.html { redirect_to(@broadcast) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @broadcast.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /broadcasts/1
  # DELETE /broadcasts/1.xml
  def destroy
    @broadcast = Broadcast.find(params[:id])
    @broadcast.destroy

    respond_to do |format|
      format.html { redirect_to(broadcasts_url) }
      format.xml  { head :ok }
    end
  end

  def category
    @broadcasts = Broadcast.for_category(params[:category]).paginate(:page => params[:page], :order => "created_at DESC")

    add_crumb(params[:category], "/broadcasts/category/#{params[:category]}") if params[:category]

    render :action => :index
  end
end
