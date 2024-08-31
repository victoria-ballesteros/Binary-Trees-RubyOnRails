require_relative "../helpers/arbol_binario"

class HomeController < ApplicationController
    def index
    end

    def solution
        @input_strings = params[:strings].split("\r\n").map(&:strip)
        @collected_vectors = []

        while @input_strings.any?
            temp_vector = []
            while @input_strings.any?
              current_string = @input_strings.shift
              if current_string.end_with?("*")
                current_string.chomp!("*")
                temp_vector << current_string
                @collected_vectors << temp_vector
                break
              elsif current_string.end_with?("$")
                current_string.chomp!("$")
                temp_vector << current_string
                @collected_vectors << temp_vector
                @input_strings.clear
                break
              end
              temp_vector << current_string
            end
        end

        @result = []
        @binary_trees = @collected_vectors.map do |vector|
          arbol = ArbolBinario.new
          vector.reverse_each do |value|
            value.each_char { |char| arbol.insertar(char) } # Inserta cada carácter en el árbol
          end
          arbol
        end

        @result = @binary_trees.map do |arbol|
          arbol.recorrido_en_preorden
        end
    end
end
