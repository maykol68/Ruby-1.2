class CategoriaController < ApplicationController
  # GET /categoria or /categoria.json
  def index
    @categoria = Categorium.all
  end



  # GET /categoria/new
  def new
    @categorium = Categorium.new
  end

  # GET /categoria/1/edit
  def edit
    categorium
  end
  def create
    @categorium = Categorium.new(categorium_params)

      if @categorium.save
        redirect_to categorium_url, notice: t('.created') 
      else
         render :new, status: :unprocessable_entity 
      end
  end

  # PATCH/PUT /categoria/1 or /categoria/1.json
  def update

      if categorium.update(categorium_params)
         redirect_to categoria_url, notice: t('.updated') 
      else
        render :edit, status: :unprocessable_entity 
      end
    end
  end

  # DELETE /categoria/1 or /categoria/1.json
  def destroy
    categorium.destroy
       redirect_to categoria_url, notice: "Categorium was successfully destroyed." 
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def categorium
      @categorium = Categorium.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def categorium_params
      params.require(:categorium).permit(:name)
    end
end
