@if exist zork0.z? del zork0.z?
@if exist zork0*.*zap del zork0*.*zap
@echo.
zilf zork0.zil -ip ..\zillib -ip ..\zillib\parser
@echo.
zapf -ab zork0.zap > zork0_freq.xzap
@del zork0_freq.zap
@echo.
zapf zork0.zap
@echo.
