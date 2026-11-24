
-- =====================================================
-- PROJECT: MARKETING CAMPAIGN PERFORMANCE ANALYSIS
-- DATABASE: marketing_analytics
-- TABLE: marketing_campaign_interview_practice
-- TOOLS: MySQL, DBeaver, Power BI
-- =====================================================


-- =====================================================
-- QUERY 1: TOTAL REVENUE BY ADVERTISING CHANNEL
-- Business Question:
-- Which advertising channel generates the most revenue?
-- =====================================================

SELECT
    channel,
    ROUND(SUM(revenue_usd), 2) AS total_revenue
FROM marketing_analytics.marketing_campaign_interview_practice
GROUP BY channel
ORDER BY total_revenue DESC;


-- =====================================================
-- QUERY 2: TOTAL CONVERSIONS BY CHANNEL
-- Business Question:
-- Which advertising channel generates the most conversions?
-- =====================================================

SELECT
    channel,
    SUM(conversions) AS total_conversions
FROM marketing_analytics.marketing_campaign_interview_practice
GROUP BY channel
ORDER BY total_conversions DESC;


-- =====================================================
-- QUERY 3: RETURN ON AD SPEND (ROAS)
-- Business Question:
-- Which channel generates the most revenue per dollar spent?
-- Formula: Total Revenue / Total Advertising Spend
-- =====================================================

SELECT
    channel,
    ROUND(SUM(revenue_usd), 2) AS total_revenue,
    ROUND(SUM(spend_usd), 2) AS total_spend,
    ROUND(
        SUM(revenue_usd) / NULLIF(SUM(spend_usd), 0),
        2
    ) AS roas
FROM marketing_analytics.marketing_campaign_interview_practice
GROUP BY channel
ORDER BY roas DESC;


-- =====================================================
-- QUERY 4: AVERAGE ADVERTISING SPEND BY CHANNEL
-- Business Question:
-- Which channel has the highest average spend per record?
-- =====================================================

SELECT
    channel,
    ROUND(AVG(spend_usd), 2) AS average_spend
FROM marketing_analytics.marketing_campaign_interview_practice
GROUP BY channel
ORDER BY average_spend DESC;


-- =====================================================
-- QUERY 5: CAMPAIGNS WITH OVER 100 CONVERSIONS
-- Business Question:
-- Which campaigns generated more than 100 conversions?
-- SQL Concept: HAVING filters grouped results
-- =====================================================

SELECT
    campaign,
    SUM(conversions) AS total_conversions
FROM marketing_analytics.marketing_campaign_interview_practice
GROUP BY campaign
HAVING SUM(conversions) > 100
ORDER BY total_conversions DESC;


-- =====================================================
-- QUERY 6: COST PER CONVERSION BY CHANNEL
-- Business Question:
-- Which advertising channel has the lowest
-- cost per conversion?
-- Formula: Total Spend / Total Conversions
-- =====================================================

SELECT
    channel,
    ROUND(SUM(spend_usd), 2) AS total_spend,
    SUM(conversions) AS total_conversions,
    ROUND(
        SUM(spend_usd) / NULLIF(SUM(conversions), 0),
        2
    ) AS cost_per_conversion
FROM marketing_analytics.marketing_campaign_interview_practice
GROUP BY channel
ORDER BY cost_per_conversion ASC;
