class ExperiencesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_experience, only: %i[ show edit update destroy ]
  before_action :current_user 

  # GET /experiences or /experiences.json
  def index
    # Set the index to be all experiences
    @experiences = Experience.order(:description).eager_load(:profile)
  end

  # GET /experiences/1 or /experiences/1.json
  def show
    # route to show.html.erb for experiences
  end

  # GET /experiences/new
  def new
    # Instance variable for the new Experience being created
    @experience = Experience.new
  end

  # GET /experiences/1/edit
  def edit
    # Set the user_id to be the current user id
    @user_id = current_user.id.to_i
    # Find the profile that has the current user id as its user_id
    @profile = Profile.find_by_user_id(@user_id)
    # Set the profile_id for the found profile so that the foreign key can be set
    @experience.profile_id = @profile.id
    # Restrict access for someone to edit an experience listing that isn't their own
    if current_user.id != @profile.user_id
      redirect_to error_path
    end
  end

  # POST /experiences or /experiences.json
  def create
    @experience = Experience.new(experience_params)
    # Set the user_id to be the current user id
    @user_id = current_user.id.to_i
    # Find the profile that has the current user id as its user_id
    @profile = Profile.find_by_user_id(@user_id)
    # Restrict access for someone to edit an experience listing that isn't their own
    @experience.profile_id = @profile.id

    respond_to do |format|
      if @experience.save
        format.html { redirect_to @experience, notice: "Experience was successfully created." }
        format.json { render :show, status: :created, location: @experience }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /experiences/1 or /experiences/1.json
  def update
    respond_to do |format|
      if @experience.update(experience_params)
        format.html { redirect_to @experience, notice: "Experience was successfully updated." }
        format.json { render :show, status: :ok, location: @experience }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @experience.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experiences/1 or /experiences/1.json
  def destroy
    @experience.destroy
    respond_to do |format|
      format.html { redirect_to experiences_url, notice: "Experience was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_experience
      @experience = Experience.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def experience_params
      # set permitted params for the experiences controller
      params.require(:experience).permit(:description, :profile_id)
    end
end
