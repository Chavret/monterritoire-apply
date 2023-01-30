class CommunesController < ApplicationController
  before_action :ensure_json_request, only: %i{index}
  before_action :find_commune, :commune_not_found, only: %i{show update}

  def index
    @communes = Commune.all

    respond_to do |format|
      format.json { render json: @communes }
      format.csv do
        response.headers['Content-Disposition'] = "attachment; filename=export_communes.csv"
        send_data @communes.to_csv, filename: "export_communes.csv"
      end
    end
  end

  def create
    head 403, content_type: "text/html"
  end

  def show;end

  def update
    @commune.update(commune_params)
    head 204, content_type: "text/html"
  end

  private

  def find_commune
    @commune = Commune.find_by(code_insee: params[:code_insee])
  end

  def commune_not_found
    head 404, content_type: "text/html" unless @commune
  end

  def ensure_json_request
    return if request.format == :json
    return if request.format == :csv
    head 406, content_type: "text/html"  
  end

  def commune_params
    params.require(:commune).permit(:name)
  end
end