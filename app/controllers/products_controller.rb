class ProductsController < ApplicationController

    def index
        @categoria = Categorium.order(name: :asc).load_async
        @products = Product.all.with_attached_photo.order(created_at: :desc).load_async

        if params[:categorium_id]
            @products = @products.where(categorium_id: params[:categorium_id])
        end

        if params[:min_price].present?
            @products = @products.where("price >= ?", params[:min_price])
        end
        if params[:max_price].present?
            @products = @products.where("price <= ?", params[:max_price])
        end
    end
    
    def show
        product
    end

    def new
        @product = Product.new 
    end

    def create
        @product = Product.new(product_params)

        if @product.save
            redirect_to products_path, notice: t('.created') 
        else
            render :new, status: :unprocessable_entity 
        
       end
       #para mostrar en consola
        #pp @product
    end

    def edit
        product
    end

    def update

        if product.update(product_params)
            redirect_to product_path, notice: t('.updated') 
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        product.destroy
        redirect_to product_path, notice:  t('.destroyed') , status: :see_other
    end

    private
    def product_params
        params.require(:product).permit(:title, :description, :price, :photo, :categorium_id)
    end
    
    def product
        @product = Product.find(params[:id])
    end

end