class FundingsController < ApplicationController
  def edit
    @fundings = Funding.all
  end
  
  def update
    # fundings"=>{"1"=>{"amount"=>"20000.0"}, "2"=>{"amount"=>"21000.0"}, "3"=>{"amount"=>"1000.0"}}
    @fundings = Funding.update(params[:fundings].keys, params[:fundings].values).reject { |p| p.errors.empty? }
    if @fundings.empty?
      redirect_to root_path, notice: "Fundings updated"
    else
      render :edit
    end
  end
end
