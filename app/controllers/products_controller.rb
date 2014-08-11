class ProductsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_filter :check_permissions, except: [:show, :index]

  # GET /products
  # GET /products.json
  def index
    @products = Product.search(params[:query]).order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 9)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
      format.xml { render xml: @products }
      format.csv { send_data Product.to_csv(@products, :updated_at) }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
    @factory = @product.factory
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to products_path, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  def get_factories
    @company = Company.find(params[:company]) || Company.first
    @factories = @company.factories

    respond_to do |format|
      format.js
    end
  end

  def get_image
    @img_src = params[:img_src]

    respond_to do |format|
      format.js
    end
  end

  private

  def sort_column
    Product.column_names.include?(params[:sort]) ? params[:sort] : "updated_at"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
end
