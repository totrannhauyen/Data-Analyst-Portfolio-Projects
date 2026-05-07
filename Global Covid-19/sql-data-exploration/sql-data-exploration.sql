--- SELECT 
SELECT * 
FROM [covid-deaths].[dbo].CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 3,4;

SELECT * 
FROM [covid-deaths].[dbo].CovidVaccinations
ORDER BY 1,3;

--- SELECT DÂT THAT WE'RE GOING TO BE USING
SELECT location, date, total_cases, new_cases, total_deaths, population
FROM [covid-deaths].[dbo].CovidDeaths
WHERE continent IS NOT NULL
ORDER BY 1,2;


--- LOOKING AT TOTAL CASES AND TOTAL DEATHS
SELECT location, date, total_cases, total_deaths, (total_deaths * 100.0 / NULLIF(total_cases, 0)) AS DeathPercentage
FROM [covid-deaths].[dbo].CovidDeaths
WHERE location LIKE '%states%' AND continent IS NOT NULL
ORDER BY 1,2;


--- LOOKING AT TOTAL CASES AND POPULATION
SELECT location, date, total_cases, population, (total_cases * 100.0 / NULLIF(population, 0)) AS PercentagePopulation
FROM [covid-deaths].[dbo].CovidDeaths
WHERE location LIKE '%states%' AND continent IS NOT NULL
ORDER BY 1,2;

--- LOOKING AT COUNTRIES WITH HIGHEST INFECTION RATE COMPARED TO POPULATION
SELECT location, population, MAX(total_cases) AS HighestInfectionCount, MAX( (total_cases * 100.0 / NULLIF(population, 0))) AS PercentagePopulationInfected
FROM [covid-deaths].[dbo].CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location, population
ORDER BY PercentagePopulationInfected DESC;

--- SHOWING COUNTRIES WITH HIGHEST DEATH COUNT PER POPULATION
SELECT location, MAX(cast(total_deaths as int)) AS TotalDeathCount
FROM [covid-deaths].[dbo].CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
ORDER BY TotalDeathCount DESC;

--- SHOWING CONTINENTS WITH THE HIGHEST DEATH COUNT PER POPULATION 
SELECT continent, population, MAX(cast(total_deaths as int)) AS TotalDeathCount
FROM [covid-deaths].[dbo].CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent, population
ORDER BY TotalDeathCount DESC;

--- Global numbers
SELECT date, SUM(new_cases) AS new_cases, SUM(cast(new_deaths as int)) AS new_deaths, SUM(CAST(new_deaths AS INT)) * 100.0 / NULLIF(SUM(new_cases), 0) AS DeathPercentage
FROM [covid-deaths].[dbo].CovidDeaths
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY 1,2;


--- Looking at Total Population vs Vaccinations
SELECT dea.continent, dea.location, dea.date, dea.population, dea.new_vaccinations, SUM(CAST(dea.new_vaccinations AS BIGINT)) OVER (PARTITION BY dea.location ORDER BY dea.date) AS RollingPeopleVaccinated
FROM [covid-deaths].[dbo].CovidDeaths dea
JOIN [covid-deaths].[dbo].CovidVaccinations vac
    ON dea.location = vac.location 
    AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
ORDER BY 2,3;

--- VaccinationPercentage
SELECT *,
       RollingPeopleVaccinated * 100.0 / NULLIF(population, 0) AS VaccinationPercentage
FROM (
    SELECT dea.continent, dea.location, dea.date, dea.population, dea.new_vaccinations, SUM(CAST(dea.new_vaccinations AS BIGINT)) OVER (PARTITION BY dea.location ORDER BY dea.date) AS RollingPeopleVaccinated
    FROM [covid-deaths].[dbo].CovidDeaths dea
    JOIN [covid-deaths].[dbo].CovidVaccinations vac
        ON dea.location = vac.location 
        AND dea.date = vac.date
    WHERE dea.continent IS NOT NULL
) t
ORDER BY location, date;

---  USE CTE
WITH PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
AS
(
SELECT dea.continent, dea.location, dea.date, dea.population, dea.new_vaccinations,
    SUM(CAST(dea.new_vaccinations AS BIGINT)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
FROM [covid-deaths].[dbo].CovidDeaths dea
JOIN [covid-deaths].[dbo].CovidVaccinations vac
    ON dea.location = vac.location
    and dea.date = vac.date
WHERE dea.continent IS NOT NULL
)

SELECT *
FROM PopvsVac
ORDER BY Location, Date;

-- TEMP TABLE
---DROP TABLE IF EXISTS #PercentPopulationVaccinated;
CREATE TABLE #PercentPopulationVaccinated
(
    Continent nvarchar(255),
    Location nvarchar(255),
    Date datetime,
    Population BIGINT,
    New_vaccinations BIGINT,
    RollingPeopleVaccinated BIGINT
);

INSERT INTO #PercentPopulationVaccinated
SELECT 
    dea.continent,
    dea.location,
    dea.date,
    CAST(dea.population AS BIGINT),
    
    CAST(ISNULL(dea.new_vaccinations,0) AS BIGINT),

    SUM(CAST(ISNULL(dea.new_vaccinations,0) AS BIGINT))
        OVER (
            PARTITION BY dea.location 
            ORDER BY dea.date
        ) AS RollingPeopleVaccinated

FROM [covid-deaths].[dbo].CovidDeaths dea
JOIN [covid-deaths].[dbo].CovidVaccinations vac
    ON dea.location = vac.location 
    AND dea.date = vac.date

WHERE dea.continent IS NOT NULL;

SELECT *,
       CAST(RollingPeopleVaccinated AS FLOAT)
       / NULLIF(Population,0) * 100 AS PercentVaccinated
FROM #PercentPopulationVaccinated;

--- Creating view t store data for later visualizations
--- DROP VIEW IF EXISTS PercentPopulationVaccinated;
CREATE VIEW PercentPopulationVaccinated AS
SELECT 
    dea.continent,
    dea.location,
    dea.date,
    CAST(dea.population AS BIGINT) AS population,
    
    CAST(ISNULL(dea.new_vaccinations, 0) AS BIGINT) AS new_vaccinations,

    SUM(CAST(ISNULL(dea.new_vaccinations, 0) AS BIGINT))
        OVER (
            PARTITION BY dea.location 
            ORDER BY dea.date
        ) AS RollingPeopleVaccinated

FROM [covid-deaths].[dbo].CovidDeaths dea
JOIN [covid-deaths].[dbo].CovidVaccinations vac
    ON dea.location = vac.location 
    AND dea.date = vac.date

WHERE dea.continent IS NOT NULL;

SELECT * 
FROM PercentPopulationVaccinated;