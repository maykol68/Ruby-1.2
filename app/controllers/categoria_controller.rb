class CategoriaController < ApplicationController
   before_action :authorize!
  def index
    authorize!
    @categoria = Categorium.all.order(name: :asc)
  end

  def new
    @categorium = Categorium.new
  end

  def edit
    categorium
  end
  def create
    @categorium = Categorium.new(categorium_params)

      if @categorium.save
        redirect_to categoria_url, notice: t('.created') 
      else
         render :new, status: :unprocessable_entity 
      end
  end

  def update
      if categorium.update(categorium_params)
         redirect_to categoria_url, notice: t('.updated') 
      else
        render :edit, status: :unprocessable_entity 
      end
  end

  def destroy
    categorium.destroy
    
    redirect_to categoria_url, notice: t('.destroyed')
  end

  private

    def categorium
      @categorium = Categorium.find(params[:id])
    end

    def categorium_params
      params.require(:categorium).permit(:name)
    end
end
