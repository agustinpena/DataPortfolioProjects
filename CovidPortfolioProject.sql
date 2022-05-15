-- COVID DATA EXPLORATION PROJECT
-- BY Agustín Peña

-- SELECT THE DATA TO BE USED.
SELECT location, date, total_cases, new_cases, total_deaths, population
FROM CovidPortfolioProject.dbo.CovidDeaths
ORDER BY 1,2

-- TOTAL DEATHS VS TOTAL CASES.
-- SHOWS THE CHANCE OF CONTRACTING COVID
-- IN YOUR COUNTRY.
SELECT
    location,
    date,
    total_cases,
    total_deaths,
    (total_deaths/total_cases)*100 AS 'Death Percentage'
FROM CovidPortfolioProject.dbo.CovidDeaths
WHERE location = 'Mexico'
ORDER BY 1,2

-- TOTAL CASES VS POPULATION.
-- SHOWS PERCENTAGE OF POPULATION INFECTED
-- WITH COVID IN YOUR COUNTRY.
SELECT
    location,
    date,
    population,
    total_cases,
    (total_cases/population)*100 AS '% of Population Infected'
FROM CovidPortfolioProject.dbo.CovidDeaths
WHERE location = 'Mexico'
ORDER BY 1,2

-- HIGHEST INFECTION RATE BY COUNTRIES
-- COMPARED TO POPULATION
SELECT
    location,
    population,
    MAX(total_cases) as 'Max of Total Cases',
    MAX((total_cases/population))*100 AS '% of Population Infected'
FROM CovidPortfolioProject.dbo.CovidDeaths
GROUP BY location, population
ORDER BY 4 DESC

-- HIGHEST DEATH COUNT BY COUNTRY
SELECT
    location,
    MAX(total_deaths) as 'Total Fatality Count'
FROM CovidPortfolioProject.dbo.CovidDeaths
GROUP BY location, population
ORDER BY 2 DESC

--  HIGHEST FATALITY COUNT PER POPULATION BY CONTINENT
SELECT continent, MAX(total_deaths) as 'Total Death Count'
FROM CovidPortfolioProject.dbo.CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY 'Total Death Count' DESC


--  GLOBAL NUMBERS

-- TOTAL DEATHS VS TOTAL CASES.
-- SHOWS THE CHANCE OF CONTRACTING COVID
-- IN ALL CONTINENTS
SELECT
    date,
    SUM(new_cases),
    SUM(new_deaths)
FROM CovidPortfolioProject.dbo.CovidDeaths
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY 1,2
