class Nodo
  attr_accessor :valor, :izquierdo, :derecho

  def initialize(valor)
    @valor = valor
    @izquierdo = nil
    @derecho = nil
  end
end

class ArbolBinario
  def initialize
    @raiz = nil
  end

  def insertar(valor)
    @raiz = insertar_recursivamente(@raiz, valor)
  end

  def recorrido_en_preorden
    recorrido_en_preorden_recursivo(@raiz)
  end

  private

  def insertar_recursivamente(nodo, valor)
    return Nodo.new(valor) if nodo.nil?

    if valor < nodo.valor
      nodo.izquierdo = insertar_recursivamente(nodo.izquierdo, valor)
    else
      nodo.derecho = insertar_recursivamente(nodo.derecho, valor)
    end

    nodo
  end

  def recorrido_en_preorden_recursivo(nodo)
    return [] if nodo.nil?

    [ nodo.valor ] + recorrido_en_preorden_recursivo(nodo.izquierdo) + recorrido_en_preorden_recursivo(nodo.derecho)
  end
end
