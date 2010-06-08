class MessagesController < ApplicationController
  uses_tiny_mce

  load_and_authorize_resource
  before_filter :login_required, :except => [:index, :show]

  add_crumb("留言反馈", "/messages")

  # GET /messages
  # GET /messages.xml
  def index
    @messages = Message.paginate(:page => params[:page], :order => "created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.xml
  def show
    @message = Message.find(params[:id])

    add_crumb(@message.title)

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.xml
  def new
    @message = current_user.messages.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @message }
    end
  end

  # POST /messages
  # POST /messages.xml
  def create
    @message = current_user.messages.new(params[:message])

    respond_to do |format|
      if @message.save
        flash[:notice] = '留言已成功！'
        format.html { redirect_to(@message) }
        format.xml  { render :xml => @message, :status => :created, :location => @message }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end
end
