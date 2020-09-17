class FormulasController < ApplicationController
  def index
    @formulas = policy_scope(Formula)

    @formula = Formula.new
    # authorize @formula

    @users = User.all
    @user = current_user
        # authorize @user

  end

  def show


  end

  def new
    @formula = Formula.new
    authorize @formula
    @users = User.all
    # @user = current_user
  end

  def create
    @formula = Formula.create!(formula_params)
    authorize @formula
    user_id = @formula.user_id
      @user = User.find(user_id)

    if @formula.save
        formula_calculation
        redirect_to formulas_path
    end


  end



  # GET /formulas/:id/edit
  def edit
    @formula = Formula.find(params[:id])
    authorize @formula
  end

  # PUT formulas/:id/edit
  def update
  @formula = Formula.find(params[:id])
    authorize @formula

    if @formula.update(formula_params)
      formula_calculation
      flash[:success] = "Update Formula Success!"
           redirect_to event_path(@event.id)
    else
      @formula.errors.full_messages.each do |message|
      flash[:error] = message
      end
      render :show
    end
  end

  def destroy
    @formula = Formula.find(params[:id])
    authorize @formula
    @formula.destroy
    redirect_to formulas_path

  end

private

  def formula_params
    params.require(:formula).permit(:user_id, :offer, :validation, :start_at, :end_at)
  end

  def formula_calculation
    # Ajoutez une colonne training number à User et ajouter 4 ou 8 à chaque nouvelle
    # validation de formules.
    if @formula.offer == "Silver"
        @user.training_number = "4"
    elsif @formula.offer == "Gold"
        @user.training_number = "8"
    end
    @user.save
# lorsque Date.now = end_at => training number =0
# lorsque DailyEmotion est crée pour un user dans event, training number -=1
  end




end
