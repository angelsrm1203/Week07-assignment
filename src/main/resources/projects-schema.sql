DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS project;

CREATE TABLE project(
project_id INT AUTO_INCREMENT NOT NULL,
project_name VARCHAR(128) NOT NULL,
estimated_hours DECIMAL (7,2),
actual_hours DECIMAL (7,2),
difficulty INT,
notes TEXT,
PRIMARY KEY (project_id)
);

CREATE TABLE material(
material_id INT AUTO_INCREMENT NOT NULL,
project_id INT NOT NULL,
material_name VARCHAR(128),
num_required INT,
cost DECIMAL (7,2),
PRIMARY KEY (material_id),
FOREIGN KEY (project_id) REFERENCES project (project_id)ON DELETE CASCADE
);

CREATE TABLE step(
step_id INT AUTO_INCREMENT NOT NULL,
project_id INT NOT NULL,
step_text TEXT NOT NULL,
step_order INT NOT NULL,
PRIMARY KEY (step_id),
FOREIGN KEY (project_id) REFERENCES project (project_id)ON DELETE CASCADE
);

CREATE TABLE category(
category_id INT AUTO_INCREMENT NOT NULL,
category_name VARCHAR(128),
PRIMARY KEY (category_id)
);

CREATE TABLE project_category(
project_id INT NOT NULL,
category_id INT NOT NULL,
FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
FOREIGN KEY (category_id) REFERENCES category (category_id)
);

INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes) VALUES ('Water plants', 0.25, 0.5, 1, 'Use the green can under the sink.');
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'Watering can', 1, 1.50);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'Water', 8, 0.02);
INSERT INTO step (project_id, step_text, step_order) VALUES (1, 'Get watering can out from under sink and fill with water', 1);
INSERT INTO step (project_id, step_text, step_order) VALUES (1, 'Pour water from watering can onto plants', 2);
INSERT INTO category (category_id, category_name) VALUES (3, 'Gardening');
INSERT INTO project_category (project_id, category_id) VALUES (1, 3);


INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes) VALUES ('Sand bathroom door', 1.25, 1.5, 2, 'Use coarse paper then fine.');
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (2, 'Coarse sandpaper', 3, 2.00);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (2, 'Fine sandpaper', 2, 2.00);
INSERT INTO step (project_id, step_text, step_order) VALUES (2, 'Use coarse sandpaper to get rid of roughness', 1);
INSERT INTO step (project_id, step_text, step_order) VALUES (2, 'Use fine sandpaper to make surface smooth', 2);
INSERT INTO category (category_id, category_name) VALUES (1, 'Doors and Windows');
INSERT INTO project_category (project_id, category_id) VALUES (2, 1);


INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes) VALUES ('Fix ice maker', 2, 1.5, 3, 'Figure it out.');
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (3, 'Screwdriver', 1, 12.00);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (3, 'Patience', 1, 500.00);
INSERT INTO step (project_id, step_text, step_order) VALUES (3, 'I have no idea how to fix an ice maker', 1);
INSERT INTO step (project_id, step_text, step_order) VALUES (3, 'Just put in a step to show that the code works', 2);
INSERT INTO category (category_id, category_name) VALUES (2, 'Repairs');
INSERT INTO project_category (project_id, category_id) VALUES (3, 2);

;

