-- 1. View Data
SELECT *
FROM digital_marketing_campaign_dataset
LIMIT 10;

-- 2. Count Conversions
SELECT Conversion,
       COUNT(*) AS Total_Customers
FROM digital_marketing_campaign_dataset
GROUP BY Conversion;

-- 3. Conversion by Channel
SELECT CampaignChannel,
       AVG(Conversion) AS ConversionRate
FROM digital_marketing_campaign_dataset
GROUP BY CampaignChannel
ORDER BY ConversionRate DESC;

-- 4. Conversion by Campaign Type
SELECT CampaignType,
       AVG(Conversion) AS ConversionRate
FROM digital_marketing_campaign_dataset
GROUP BY CampaignType
ORDER BY ConversionRate DESC;

-- 5. Conversion by Gender
SELECT Gender,
       AVG(Conversion) AS ConversionRate
FROM digital_marketing_campaign_dataset
GROUP BY Gender
ORDER BY ConversionRate DESC;

-- 6. Converted Customers from Email Campaigns
SELECT *
FROM digital_marketing_campaign_dataset
WHERE Conversion = 1
  AND CampaignChannel = 'Email';

-- 7. Customer Distribution by Gender
SELECT Gender,
       COUNT(*) AS Total_Customers
FROM digital_marketing_campaign_dataset
GROUP BY Gender;
