ActiveAdmin.register Category do
  menu label: "Категории"
  permit_params :name, :description

  controller do

    def create
      @category = Category.create(category_params)
      redirect_to admin_categories_url
    end

    def destroy
      @category = Category.find(params[:id])
      @category.destroy
      redirect_to admin_categories_url
    end

    def update
      @category = Category.find(params[:id])
      @category.update_attributes(category_params)
      redirect_to admin_categories_url
    end

    def category_params
      params.require(:category).permit!
    end
  end
end
