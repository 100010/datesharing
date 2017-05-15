class GoodsController < ApplicationController

  def create
    good = Good.new(goods_params)
    good.user_id = current_user.id

    unless good.save
      return render json: {error: 'internal server error'} , status: 500
    end
    return render json: {status: 'success'},status: 200

  end

  def destroy
    unless Good.related_user_and_plan(current_user.id,params[:goods][:plan_id]).delete_all
      return render json: {error: 'internal server error'} , status: 500
    end
    return render json: {status: 'success'},status: 200
  end


  private

  def goods_params
    params.require(:goods).permit(:user_id,:plan_id)
  end
end
