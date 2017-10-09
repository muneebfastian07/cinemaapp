class Admin::MoviesController < AdminController
  before_action :set_admin_movie, only: [:show, :edit, :update, :destroy]

  # GET /admin/movies
  # GET /admin/movies.json
  def index
    @admin_movies = Movie.all
  end

  # GET /admin/movies/1
  # GET /admin/movies/1.json
  def show
  end

  # GET /admin/movies/new
  def new
    @admin_movie = Movie.new
  end

  # GET /admin/movies/1/edit
  def edit
  end

  # POST /admin/movies
  # POST /admin/movies.json
  def create
    @admin_movie = Movie.new(admin_movie_params)

    respond_to do |format|
      if @admin_movie.save
        format.html { redirect_to @admin_movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @admin_movie }
      else
        format.html { render :new }
        format.json { render json: @admin_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/movies/1
  # PATCH/PUT /admin/movies/1.json
  def update
    respond_to do |format|
      if @admin_movie.update(admin_movie_params)
        format.html { redirect_to @admin_movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_movie }
      else
        format.html { render :edit }
        format.json { render json: @admin_movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/movies/1
  # DELETE /admin/movies/1.json
  def destroy
    @admin_movie.destroy
    respond_to do |format|
      format.html { redirect_to admin_movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_movie
      @admin_movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_movie_params
      params.require(:movie).permit(:name, :room_name)
    end
end
