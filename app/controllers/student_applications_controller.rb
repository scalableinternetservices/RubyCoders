class StudentApplicationsController < ApplicationController
  include StudentApplicationsHelper
  before_filter :set_cache_control_headers, only: [:index, :show]
  before_action :set_student_application, only: [:show, :edit, :update, :destroy]
  #etag { current_student.try :id }
  # Removing the next line because if not removed it always redirects to the student login page in case of reviewer too
  #before_action :authenticate_student!
  # GET /student_applications
  # GET /student_applications.json
  def index
    @student_applications = StudentApplication.all.paginate(page: params[:page], per_page: 5).order('id ASC')
  end

  # GET /student_applications/1
  # GET /student_applications/1.json
  def show
    fresh_when([@student_application, @student_application.name, @student_application.dob, @student_application.phone, @student_application.email_id, @student_application.gpa, @student_application.address, @student_application.city, @student_application.state, @student_application.country, @student_application.resume, @student_application.sop, @student_application.lor])
    #fresh_when(@student_application)
  end

  # GET /student_applications/new
  def new
    #@student_application = StudentApplication.new
    #@profile = current_user.build_profile(params[:id])
    if student_signed_in?
      @student_application = current_student.build_student_application
    end
  end

  # GET /student_applications/1/edit
  def edit
  end

  def delete
  end

  # POST /student_applications
  # POST /student_applications.json
  def create
    #@student_application = StudentApplication.new(student_application_params)
    #@new_student = Student.find(params[:id])
    @student_application = current_student.create_student_application(student_application_params)

    respond_to do |format|
      if @student_application.save
        format.html { redirect_to @student_application, notice: 'Student application was successfully created.' }
        format.json { render :show, status: :created, location: @student_application }
        AppStatus.create(student_application_id: @student_application.id, student_name: @student_application.name)
      else
        format.html { render :new }
        format.json { render json: @student_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_applications/1
  # PATCH/PUT /student_applications/1.json
  def update
    respond_to do |format|
      if @student_application.update(student_application_params)
        format.html { redirect_to @student_application, notice: 'Student application was successfully updated.' }
        format.json { render :show, status: :ok, location: @student_application }
        #AppStatus.create(student_application_id: "@student_application.id")
      else
        format.html { render :edit }
        format.json { render json: @student_application.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_applications/1
  # DELETE /student_applications/1.json
  def destroy
    #if :delete_app_status
      @student_application.destroy
      respond_to do |format|
        format.html { redirect_to welcome_index_path, notice: 'Student application was successfully destroyed.' }
        format.json { head :no_content }
      end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_application
      if student_signed_in?
        if StudentApplication.exists?(:student_id => current_student.id)
          @student_application = StudentApplication.find_by student_id: current_student.id
        else
          @student_application = StudentApplication.find(params[:id])
        end
      else
        @student_application = StudentApplication.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def student_application_params
      #params.require(:student_application).permit(:student_id, :name, :phone, :email_id, :gpa, :address, :resume_file_name, :sop_file_name, :lor_file_name)
      params.require(:student_application).permit(:student_id, :name, :phone, :email_id, :gpa, :address, :resume, :sop, :lor, :city, :state, :country, :dob)
    end

    # check if an application already exists for current_student
    def check_application_existence
      if StudentApplication.exists?(:student_id => current_student.id)
        @no_appln = false
      else
        @no_appln = true
      end
    end
    helper_method :check_application_existence

  end
