class FuncionariosController < ApplicationController
  before_action :set_funcionario, only: %i[ show edit update destroy contratos_por_funcionario ]

  # GET /funcionarios or /funcionarios.json
  def index
    @funcionarios = Funcionario.all
  end

  def atuacao
    @funcionario_atuacao = Funcionario.find(params[:id])
    @contratos = @funcionario_atuacao.contratos
    @musicas = @funcionario_atuacao.musicas
    @albuns = @funcionario_atuacao.albums

    @total_contratos = @contratos.count
    @total_musicas = @musicas.count
    @total_albuns = @albuns.count
  end

  # GET /funcionarios/1 or /funcionarios/1.json
  def show
  end

  def contratos_por_funcionario
    @funcionario = Funcionario.find(params[:id])
    @contratos = @funcionario.contratos
  end

  # GET /funcionarios/new
  def new
    @funcionario = Funcionario.new
  end

  # GET /funcionarios/1/edit
  def edit
  end

  # POST /funcionarios or /funcionarios.json
  def create
    @funcionario = Funcionario.new(funcionario_params)

    respond_to do |format|
      if @funcionario.save
        format.html { redirect_to funcionario_url(@funcionario), notice: "Funcionario was successfully created." }
        format.json { render :show, status: :created, location: @funcionario }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /funcionarios/1 or /funcionarios/1.json
  def update
    respond_to do |format|
      if @funcionario.update(funcionario_params)
        format.html { redirect_to funcionario_url(@funcionario), notice: "Funcionario was successfully updated." }
        format.json { render :show, status: :ok, location: @funcionario }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @funcionario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /funcionarios/1 or /funcionarios/1.json
  def destroy
    @funcionario.destroy

    respond_to do |format|
      format.html { redirect_to funcionarios_url, notice: "Funcionario was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_funcionario
      @funcionario = Funcionario.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def funcionario_params
      params.require(:funcionario).permit(:nome, :cpf, :salario, :cargo)
    end
end
