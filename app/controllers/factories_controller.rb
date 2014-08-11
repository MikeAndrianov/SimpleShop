class FactoriesController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_filter :check_permissions, except: [:show, :index]
  
  # GET /factories
  # GET /factories.json
  def index
    @factories = Factory.search(params[:query]).order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 9)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @factories }
      format.xml { render xml: @factories }
      format.csv { send_data Factory.to_csv(@factories) }
    end
  end

  # GET /factories/1
  # GET /factories/1.json
  def show
    @factory = Factory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @factory }
    end
  end

  # GET /factories/new
  # GET /factories/new.json
  def new
    @factory = Factory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @factory }
    end
  end

  # GET /factories/1/edit
  def edit
    @factory = Factory.find(params[:id])
  end

  # POST /factories
  # POST /factories.json
  def create
    @factory = Factory.new(params[:factory])

    respond_to do |format|
      if @factory.save
        format.html { redirect_to factories_path, notice: 'Factory was successfully created.' }
        format.json { render json: @factory, status: :created, location: @factory }
      else
        format.html { render action: "new" }
        format.json { render json: @factory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /factories/1
  # PUT /factories/1.json
  def update
    @factory = Factory.find(params[:id])

    respond_to do |format|
      if @factory.update_attributes(params[:factory])
        format.html { redirect_to factories_path, notice: 'Factory was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @factory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /factories/1
  # DELETE /factories/1.json
  def destroy
    @factory = Factory.find(params[:id])
    @factory.destroy

    respond_to do |format|
      format.html { redirect_to factories_url }
      format.json { head :no_content }
    end
  end

  private

  def sort_column
    Factory.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
