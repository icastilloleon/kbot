class Factura
    def initialize(entries)
        if(entries.length < 3)
            puts "Favor de proporcionar todos los parámetros para la facturación. \nParámetros: Cantidad, Precio Unitario y Estado."
            exit
        end
        @cantidad = entries[0]
        @precio = entries[1]
        @estado = entries[2]
    end

    //
    def inputValidation()
        @cantidad = validateCantidad()
        @precio = validatePrecio()
        @estado = validateEstado()

        puts "Cantidad: #{@cantidad}, Precio: #{@precio}, Estado: #{@estado}"
    end
    
    def validateCantidad()
        if (!isNumeric?(@cantidad) | !isInteger?(@cantidad))
            puts "Favor de proporcionar el parámetro Cantidad en formato numérico entero."
            exit
        end
        if (Integer(@cantidad) <= 0)
            puts "Favor de proporcionar el parámetro Cantidad con valor mayor a cero."
            exit
        end
        return Integer(@cantidad)
    end

    def validatePrecio()
        if (!isNumeric?(@precio))
            puts "Favor de proporcionar el parámetro Precio en formato numérico."
            exit
        end
        if (Float(@precio) <= 0)
            puts "Favor de proporcionar el parámetro Precio con valor mayor a cero."
            exit
        end
        return Float(@precio)
    end

    def validateEstado()
        if (isNumeric?(@estado))
            puts "Favor de proporcionar el parámetro Estado en formato string."
            exit
        end
        if (@estado.length != 2 )
            puts "Favor de proporcionaro el parametro Estado con valor de dos caracteres."
            exit
        end
        return String(@estado)
    end

    def isNumeric?(value)
        Float(value) != nil rescue false
    end
    def isInteger?(value)
        Integer(value) != nil rescue false
    end
    

end

facturacion = Factura.new(ARGV)
facturacion.inputValidation()
