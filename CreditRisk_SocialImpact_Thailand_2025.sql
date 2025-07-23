
-- Sample SQL Script from the original case
-- 1. Default Rate by Occupation
SELECT 
  Occupation,
  COUNT(*) AS total_customers,
  SUM(Default_Flag) AS total_defaults,
  ROUND(SUM(Default_Flag) * 100.0 / COUNT(*), 2) AS default_rate_percent
FROM ThaiLoanRiskDataset
GROUP BY Occupation
ORDER BY default_rate_percent DESC;

-- 2. Over-indebted customers
SELECT 
  Name,
  Occupation,
  Monthly_Income,
  Loan_Amount,
  ROUND(Loan_Amount * 1.0 / Monthly_Income, 2) AS loan_to_income_ratio
FROM ThaiLoanRiskDataset
WHERE Loan_Amount > Monthly_Income * 5
ORDER BY loan_to_income_ratio DESC;
