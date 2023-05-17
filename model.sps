* Encoding: UTF-8.
LOGISTIC REGRESSION VARIABLES Comorbidity
  /METHOD=ENTER sex Age_group2 edu2 Division location income 
  /CONTRAST (sex)=Indicator (1)
  /CONTRAST (Age_group2)=Indicator (1)
  /CONTRAST (edu2)=Indicator (1)
  /CONTRAST (Division)=Indicator (6)
  /CONTRAST (location)=Indicator (1)
  /CONTRAST (income)=Indicator (1)
  /PRINT=CI(95)
  /CRITERIA=PIN(0.05) POUT(0.10) ITERATE(20) CUT(0.5).
