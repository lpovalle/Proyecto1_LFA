MiniPHP:

Mi proyecto funciona de tal forma que reconoce los carácteres más comunes del lenguaje PHP
y crea tokens, el proyecto fue pensado de tal forma que la implementación del análisis sintáctico
sea más sencillo. Se puede notar que algunos token estan definidos de forma muy general, esto
fue por comodidad ya que por el momento no nos importa detallar cada token.

Los errores estan manejados los errores de tal forma que al no coincidir con alguna expresión 
regular el número de token es diferente y, cada vez que aparezca este número de token se mostrará
un mensaje de error. 