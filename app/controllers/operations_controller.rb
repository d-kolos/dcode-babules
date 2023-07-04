class OperationsController < ApplicationController
  before_action :set_operation, only: %i[ show edit update destroy ]
  before_action :set_categories, only: %i[ new edit update create ]

  # GET /operations or /operations.json
  def index
    @title = 'All operations'
    # @operations = Operation.all.order(odate: :desc)
    @operations = Operation.order(odate: :desc, id: :desc).page params[:page]
  end

  # GET /operations/1 or /operations/1.json
  def show
    @title = 'View operation'
  end

  # GET /operations/new
  def new
    @title = 'New operation'
    @operation = Operation.new
  end

  # GET /operations/1/edit
  def edit
    @title = 'Edit operation'
  end

  # POST /operations or /operations.json
  def create
    @title = 'Create operation'
    @operation = Operation.new(operation_params)

    respond_to do |format|
      if @operation.save
        #noinspection RubyResolve
        format.html { redirect_to operation_url(@operation), notice: "Operation was successfully created." }
        format.json { render :show, status: :created, location: @operation }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operations/1 or /operations/1.json
  def update
    respond_to do |format|
      if @operation.update(operation_params)
        #noinspection RubyResolve
        format.html { redirect_to operation_url(@operation), notice: "Operation was successfully updated." }
        format.json { render :show, status: :ok, location: @operation }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @operation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operations/1 or /operations/1.json
  def destroy
    @operation.destroy

    respond_to do |format|
      #noinspection RubyResolve
      format.html { redirect_to operations_url, notice: "Operation was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operation
      @operation = Operation.find(params[:id])
    end

    def set_categories
      @categories = Category.all.order(:name).map { |c| [c.name, c.id] }
    end

    # Only allow a list of trusted parameters through.
    def operation_params
      params.require(:operation).permit(:odate, :amount, :description, :category_id)
    end
end
