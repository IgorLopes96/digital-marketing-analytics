-- Conversion rate by campaign type and channel
SELECT CampaignType,
       COUNT(*)                         AS customers,
       SUM(Conversion)                  AS converted,
       ROUND(100.0 * AVG(Conversion), 1) AS conversion_rate_pct,
       ROUND(AVG(AdSpend), 0)           AS avg_ad_spend
FROM campaigns
GROUP BY CampaignType
ORDER BY conversion_rate_pct DESC;

-- Channel performance ranked with a window function
SELECT CampaignChannel,
       COUNT(*)                                         AS customers,
       ROUND(100.0 * AVG(Conversion), 1)                AS conversion_rate_pct,
       RANK() OVER (ORDER BY AVG(Conversion) DESC)      AS channel_rank
FROM campaigns
GROUP BY CampaignChannel;

-- Conversion by number of previous purchases (bucketed)
SELECT CASE WHEN PreviousPurchases <= 2 THEN '0-2'
            WHEN PreviousPurchases <= 5 THEN '3-5'
            ELSE '6+' END                   AS previous_purchases,
       COUNT(*)                             AS customers,
       ROUND(100.0 * AVG(Conversion), 1)    AS conversion_rate_pct
FROM campaigns
GROUP BY previous_purchases
ORDER BY previous_purchases;
