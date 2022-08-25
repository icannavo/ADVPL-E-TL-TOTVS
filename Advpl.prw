Tipos Nativos de Variávies

A = Array            :: Arrays Vazios => {}, [0] , array(0)
B = Bloco de Código  :: { || } , {|<variavel>| variavel } => Eval({|<variavel>| variavel } ,<variavel) => Eval({|<a,b,c>| a+b+c } ,1,2,3)
C = Caracter         :: "", "A", "ABCDEF..."   
D = Data             :: CToD("") ou CToD("01/01/2021") => Depende de Set( _SET_DATEFORMAT, "dd/mm/yyyy" ) => _SET_DATEFORMAT => set.ch
L = Logico           :: .T. (Verdadeiro) ou AllWaysTrue() ou .F. (Falso) ou AllWaysFalse()
N = Numerico         :: Ponto Flutuante 
O = Objeto          

T = TimeStamp 
H = Hash

Criação de Variaveis usando Notação Humgara simplificada (Baseada no Clipper 5.2 Livro de (*)Rick Spence)

local aArray
local bBloco
local cCaracter
local dData
local lLogico
local nNumeric

Criação de Variaveis usando definição de tipo

local aArray        as array
local bBloco        as block
local cCaracter     as character
local dData         as date
local lLogico       as logical
local nNumeric      as numeric
lcoal oObject       as object

Valores iniciais de uma variavel (tipada ou não) => nil 

Escopo das Variávies (Duração)

Public
Private
Static
Local

Global 

Para maiores detalhes : http://www.blacktdn.com.br/2008/11/protheus-variveis-globais-threads-e.html 

Tamanho das variaveis/nome de funções em AdvPL (Podem ser modificados usando SetVarNameLen(nSize) :: exemplos em http://www.blacktdn.com.br/2012/04/blacktdn-advpl-games-game15.html

(*)
Spence, Rick
    CLIPPER 5.2 / Rick Spence ; tradução Teresa Cristina Félix
de Sousa ; revisão técnica Mario Magyar Franco. - São Paulo : Makron Books, 1994

---------------------------------------------------------------------
Variavel do tipo object em AdvPL

#include "totvs.ch"
class myObject 
    
    data nData1
    data cData2
    data lData3
    
    method New()
    method Soma(nVal1,nVal2)

end class

method new() class myObject
    ::data:=1
    self:data:=1
    return(self)
    
method Soma(nVal1,nVal2) class myObject
    return(nVal1+nVal2)


class myObject 
    
    data nData1
    data cData2
    data lData3
    
    method New()
    method Soma(nVal1,nVal2)

end class

class myObject1 from myobject

    method New()

end class

method new() class myObject1
    self:data    
    return(self)

---------------------------------------------------------------------
Variavel do tipo object em TLPP

#include "totvs.ch"
#include "parmtype.ch"

class MyObjectTLPP
    
    private dDate as date 
    public  cVar as character
    
    public method new() as object
    
    private method MeuMetodoPrivado(nVar1 as numeric,nVar2 as numeric) as logical
    
end class

public method new() class MyObjectTLPP
    return(self)

private method MeuMetodoPrivado(nVar1,nVar2) class MyObjectTLPP
    DEFAULT nVar1:=1
    paramtype nVar1 as numeric 
    paramtype nVar2 as numeric optional
    DEFAULT nVar2:=0
    return(nVar1+nVar2)
    
-------------------------------------------------
