class ProfilesController < ApplicationController
  before_action :set_profile, only: %i[ show edit update destroy ]
  # Authenticate users before a user can edit or create a profile
  before_action :authenticate_user!, only: %i[new edit ]
  before_action :current_user 

  # GET /profiles or /profiles.json
  def index
    # Setting the instance variable for @profiles to come back with all profiles in the database
    @profiles = Profile.eager_load(:user)
    # Setting a instance variable @result that will bring back just the results of the search
    @result = Profile.eager_load(:user).search(params[:search])
  end

  # GET /profiles/1 or /profiles/1.json
  def show
    # routes to the show.html.erb for profiles
  end

  # GET /profiles/new
  def new
    # Creates a new profile in the Profile model
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
    # Authenticates whether the current user is editting a profile that beongs to them, if not then they are redirected to the error
    if current_user != @profile.user
      redirect_to error_path
    end
  end

  # POST /profiles or /profiles.json
  def create
    # Raise an error if the user is trying to create a profile when they already have one
    if Profile.find_by(user_id: current_user.id)
      redirect_to error_path
    else

    @profile = Profile.new(profile_params)
    # Set the user_id foreign key in the Profile model to be the current user
    @profile.user_id = current_user.id
    # Allows a photo to be attached in the create/edit profiles
    @profile.photo.attach(params[:profile][:photo])

    respond_to do |format|
      # Scaffold code that will save and alert the user if there are any errors.
      if @profile.save
        format.html { redirect_to @profile, notice: "Profile was successfully created." }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end
  end
  
  def error
  end

  # PATCH/PUT /profiles/1 or /profiles/1.json
  def update
    # Scaffold code that will save any edits to a users profile
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: "Profile was successfully updated." }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1 or /profiles/1.json
  def destroy
    # Code to restrict a user from deleting a profile that doesn't belong to themselves
    if current_user != @profile.user
      redirect_to error_path
    else
      # Scaffold code to destroy a profile and alert the user when complete
      @profile.destroy
      respond_to do |format|
        format.html { redirect_to profiles_url, notice: "Profile was successfully destroyed." }
        format.json { head :no_content }
      end
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      # Code to set/find the profile query
      @profile = Profile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def profile_params
      # Setting the permitted params in profile controller
      params.require(:profile).permit(:first_name, :last_name, :sex, :city, :biography, :user_id, :photo, specialty_ids:[])
    end
end
