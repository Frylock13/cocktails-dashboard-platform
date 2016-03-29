class ChefsController < ApplicationController

  def index
    sql = "SELECT r.id, r.name, r.chef_id, r.summary, r.created_at, COUNT(r.id) as recipes_count, 
                                                                    COUNT(l.id) as likes_count, 
                                                                    COUNT(d.id) as dislikes_count
           FROM recipes AS r
           LEFT JOIN chefs    as c ON r.chef_id   = c.id
           LEFT JOIN likes    as l ON l.recipe_id = r.id
           LEFT JOIN dislikes as d ON d.recipe_id = r.id
           GROUP BY r.id"
    @chefs = Kaminari.paginate_array(Chef.find_by_sql(sql)).page(params[:page])
  end

  def show
    @chef = Chef.find(params[:id])
  end

  def update
    current_user.chef.update(chef_params)
    redirect_to profile_path
    flash[:success] = 'You have updated your profile'
  end

  private

  def chef_params
    params.require(:chef).permit(:name, :avatar)
  end
end
