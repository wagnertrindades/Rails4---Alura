class ProdutosController < ApplicationController
	
	def index
		@produtos_por_nome = Produto.order(:nome).limit 5
		@produtos_por_preco = Produto.order(:preco).limit 2
	end

	def new
  		@produto = Produto.new
  		renderiza_new
	end

	def create
		valores = params.require(:produto).permit :nome, :descricao, :preco, :quantidade, :departamento_id
		@produto = Produto.new valores
		if @produto.save
			flash[:notice] = "Produto salvo com sucesso!"
			redirect_to root_url
		else
			renderiza_new
		end
	end

	def destroy
    	id = params[:id]
    	Produto.destroy id
    	redirect_to root_url
	end

	def edit
		id = params[:id]
		@produto = Produto.find(id)
		renderiza_new
	end

	def update
		id = params[:id]
		@produto = Produto.find(id)
		valores = params.require(:produto).permit :nome, :descricao, :preco, :quantidade, :departamento_id
		if @produto.update valores
			flash[:notice] = "Produto atualizado com sucesso!"
			redirect_to root_url
		else
			renderiza_new
		end

	end

	def busca
		@nome_a_buscar = params[:nome]
		@produtos = Produto.where "nome like ?", "%#{@nome_a_buscar}%"
	end

	private

	def renderiza_new
		@departamentos = Departamento.all
		render :new
	end
end
