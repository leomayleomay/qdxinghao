class CategoriesController < ApplicationController
  load_and_authorize_resource
  before_filter :login_required
  before_filter :set_category_model, :only => [:new, :edit, :create, :update]
  before_filter :set_parents_for_select, :only => [:new, :edit, :create, :update]

  # GET /categories
  # GET /categories.xml
  def index
    @categories = Category.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @categories }
    end
  end

  # GET /categories/new
  # GET /categories/new.xml
  def new
    @category = Category.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @category = Category.find(params[:id])
  end

  # POST /categories
  # POST /categories.xml
  def create
    @category = Category.new(params[:category])

    respond_to do |format|
      if @category.save
        flash[:notice] = '类别已创建成功！'
        format.html { redirect_to categories_path }
        format.xml  { render :xml => @category, :status => :created, :location => @category }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.xml
  def update
    @category = Category.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        flash[:notice] = '类别已更新成功！'
        format.html { redirect_to categories_path }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @category.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.xml
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to(categories_url) }
      format.xml  { head :ok }
    end
  end

  protected

  def set_parents_for_select
    all_categories = Category.for(@category_model)
    @parents_for_select ||= all_categories.map{|c| [c.name, c.id]}.unshift(['-请选择父类别-', nil])
  end

  def set_category_model
    @category_model = params[:model] || params[:category][:model]
  end
end
