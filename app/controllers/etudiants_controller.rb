class EtudiantsController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  def index
    @etudiants = Etudiant.order(sort_column + " " + sort_direction).paginate(:page => params[:page],:per_page=>2)
	respond_to do |format|
      format.html
      format.js
    end
  end

  # GET /etudiants/1
  # GET /etudiants/1.json
  def show
    @etudiant = Etudiant.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @etudiant }
    end
  end

  # GET /etudiants/new
  # GET /etudiants/new.json
  def new
    @etudiant = Etudiant.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @etudiant }
    end
  end

  # GET /etudiants/1/edit
  def edit
    @etudiant = Etudiant.find(params[:id])
  end

  # POST /etudiants
  # POST /etudiants.json
  def create
    @etudiant = Etudiant.new(params[:etudiant])

    respond_to do |format|
      if @etudiant.save
        format.html { redirect_to @etudiant, notice: 'Etudiant was successfully created.' }
        format.json { render json: @etudiant, status: :created, location: @etudiant }
      else
        format.html { render action: "new" }
        format.json { render json: @etudiant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /etudiants/1
  # PUT /etudiants/1.json
  def update
    @etudiant = Etudiant.find(params[:id])

    respond_to do |format|
      if @etudiant.update_attributes(params[:etudiant])
        format.html { redirect_to @etudiant, notice: 'Etudiant was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @etudiant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /etudiants/1
  # DELETE /etudiants/1.json
  def destroy
    @etudiant = Etudiant.find(params[:id])
    @etudiant.destroy

    respond_to do |format|
      format.html { redirect_to etudiants_url }
      format.json { head :ok }
    end
  end
  private
  
  def sort_column
    Etudiant.column_names.include?(params[:sort]) ? params[:sort] : "first_name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
end
