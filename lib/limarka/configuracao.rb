# coding: utf-8
require "thor"
require 'pdf_forms'
require 'yaml'
require 'colorize'
require 'open3'


module Limarka

  class Configuracao < Thor

    desc "exporta", "Exporta configuração para YAML. Ler configuracao.pdf e salva em configuracao.yaml"
    def exporta
      configuracao_pdf  = "configuracao.pdf"
      configuracao_yaml = "configuracao.yaml"
      
      raise IOError, 'Arquivo não encontrado: ' + configuracao_pdf unless File.exist? (configuracao_pdf)
      pdf = PdfForms::Pdf.new configuracao_pdf, (PdfForms.new 'pdftk'), utf8_fields: true
      pdfconf = Limarka::Pdfconf.new(pdf: pdf)
      puts pdfconf.exporta
    end


    method_option :pdf_antigo, :aliases => "-p", :required => true
    desc "upgrade", "Após atualização de versão, atualiza os valores do novo arquivo configuracao.pdf a partir do antigo (que precisa ser especificado)"
    def upgrade
      puts "Ainda falta implementar".red
    end
    

  end
end


