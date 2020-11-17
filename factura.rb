class Factura
    def initialize(entries)
        
        if(entries.length < 3)
            puts "Favor de proporcionar todos los parámetros para la facturación. \nUsage: Cantidad, Precio Unitario y Estado."
            exit
        end
    end
end

facturacion = Factura.new(ARGV)