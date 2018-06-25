--1. What are all projects that use JavaScript?
SELECT project.id AS project_id, project.name AS project_name, tech.name AS tech_name FROM project 
INNER JOIN project_uses_tech ON project.id = project_uses_tech.project_id
INNER JOIN tech ON project_uses_tech.tech_id = tech.id WHERE tech.name = 'JavaScript'
--2. What are all technologies used by the Personal Website?
SELECT project.id AS project_id, project.name AS project_name, tech.name AS tech_name FROM project 
INNER JOIN project_uses_tech ON project.id = project_uses_tech.project_id
INNER JOIN tech ON project_uses_tech.tech_id = tech.id WHERE project.name = 'Personal Website'
--3. Perform a left outer join from the tech table to the project_uses_tech table - which techs has no associated project?
SELECT tech.id AS tech_id, tech.name AS tech_name, project_uses_tech.project_id FROM tech 
LEFT OUTER JOIN project_uses_tech ON tech.id = project_uses_tech.tech_id ORDER BY tech.id, project_uses_tech.project_id
--4. Based on the previous query (#5), get the count of the number of techs used by each project.
SELECT project.id AS project_id, project.name AS project_name, COUNT(project_id) AS count_tech_id FROM project 
LEFT OUTER JOIN project_uses_tech ON project.id = project_uses_tech.project_id GROUP BY project.id ORDER BY project.id
--5. Perform a left outer join from the project table to the project_users_tech table - which projects has no associated tech?
SELECT project.id AS project_id, project.name AS project_name, project_uses_tech.tech_id FROM project 
LEFT OUTER JOIN project_uses_tech ON project.id = project_uses_tech.project_id ORDER BY project.id, project_uses_tech.tech_id
--6. Based on the previous query (#3), get the count of the number of projects that use each tech.
SELECT tech.id AS tech_id, tech.name AS tech_name, COUNT(tech_id) AS count_project_id FROM tech 
LEFT OUTER JOIN project_uses_tech ON tech.id = project_uses_tech.tech_id GROUP BY tech.id ORDER BY tech.id
--7. List all projects along with each technology used by it. You will need to do a three-way join.
SELECT project.id AS project_id, project.name AS project_name, tech.name AS tech_name FROM project
INNER JOIN project_uses_tech ON project.id = project_uses_tech.project_id
INNER JOIN tech ON tech.id = project_uses_tech.tech_id ORDER BY project.id
--8. List all the distinct techs that are used by at least one project.
SELECT DISTINCT(tech.id) AS distinct_tech_id, tech.name AS tech_name FROM tech 
INNER JOIN project_uses_tech ON tech.id = project_uses_tech.tech_id ORDER BY tech.id
--9. List all the distinct techs that are not used by any projects.
SELECT DISTINCT(tech.id) AS distinct_tech_id, tech.name AS tech_name FROM tech 
LEFT JOIN project_uses_tech ON tech.id = project_uses_tech.tech_id WHERE project_uses_tech.tech_id IS NULL ORDER BY tech.id
--10. List all the distinct projects that use at least one tech.
SELECT DISTINCT(project.id) AS distinct_project_id, project.name AS project_name FROM project 
INNER JOIN project_uses_tech ON project.id = project_uses_tech.project_id ORDER BY project.id
--11. List all the distinct projects that use no tech.
SELECT DISTINCT(project.id) AS distinct_project_id, project.name AS project_name FROM project 
LEFT JOIN project_uses_tech ON project.id = project_uses_tech.project_id WHERE project_uses_tech.project_id IS NULL ORDER BY project.id
--12. Order the projects by how many tech it uses.
SELECT project.id AS project_id, project.name AS project_name, COUNT(project_id) AS count_tech_id FROM project 
LEFT OUTER JOIN project_uses_tech ON project.id = project_uses_tech.project_id GROUP BY project.id ORDER BY count_tech_id DESC, project_id
--13. Order the tech by how many projects use it.
SELECT tech.id AS tech_id, tech.name AS tech_name, COUNT(tech_id) AS count_project_id FROM tech 
LEFT OUTER JOIN project_uses_tech ON tech.id = project_uses_tech.tech_id GROUP BY tech.id ORDER BY count_project_id DESC, tech_id
--14. What is the average number of techs used by a project?
SELECT project.id AS project_id, project.name AS project_name, ROUND(AVG(count_tech_id), 1) AS avg_count_tech_id FROM (SELECT COUNT(project_id) AS count_tech_id FROM project 
LEFT OUTER JOIN project_uses_tech ON project.id = project_uses_tech.project_id GROUP BY project.id ORDER BY count_tech_id DESC) AS subtable
--ERROR: pq: missing FROM-clause entry for table "project"