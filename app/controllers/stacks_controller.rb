class StacksController < ApplicationController
  before_action :set_stack, only: [:show, :study, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  # GET /stacks
  # GET /stacks.json
  def index
    @stacks = current_user.stacks.all
  end

  # GET /stacks/1
  # GET /stacks/1.json
  def show
  end
  
  def study
    @cards = Stack.find(params[:id]).cards.page(params[:page]).per_page(1)
  end

  # GET /stacks/new
  def new
    @stack = Stack.new
  end

  # GET /stacks/1/edit
  def edit
  end

  # POST /stacks
  # POST /stacks.json
  def create
    @stack = current_user.stacks.new(stack_params)

    respond_to do |format|
      if @stack.save
        format.html { redirect_to @stack, notice: 'Stack was successfully created.' }
        format.json { render action: 'show', status: :created, location: @stack }
      else
        format.html { render action: 'new' }
        format.json { render json: @stack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stacks/1
  # PATCH/PUT /stacks/1.json
  def update
    @stack = current_user.stacks.find(params[:id])
    respond_to do |format|
      if @stack.update(stack_params)
        format.html { redirect_to @stack, notice: 'Stack was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @stack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stacks/1
  # DELETE /stacks/1.json
  def destroy
    @stack.destroy
    respond_to do |format|
      format.html { redirect_to stacks_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stack
      @stack = Stack.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def stack_params
      params.require(:stack).permit(:title, :subject, cards_attributes: [:front, :back, :id, :_destroy])
    end
end
