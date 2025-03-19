-- Add new columns to the access_menu table if not already added
ALTER TABLE poc.access_menu
ADD COLUMN parent_id INTEGER,  -- Add the parent_id column
ADD COLUMN display_order INTEGER DEFAULT 0,  -- Add display_order column
ADD COLUMN is_visible BOOLEAN DEFAULT TRUE;  -- Add is_visible column

-- Add a foreign key constraint for parent_id
ALTER TABLE poc.access_menu
ADD CONSTRAINT fk_parent
FOREIGN KEY (parent_id)
REFERENCES poc.access_menu (id)
ON DELETE SET NULL;  -- Optionally set parent_id to NULL if the parent is deleted

-- Insert sample roles
INSERT INTO poc.access_role (id, name, created_at, terminated_at)
VALUES 
    (3, 'Worker', CURRENT_TIMESTAMP, NULL),
    (4, 'Staff', CURRENT_TIMESTAMP, NULL);

-- Insert sample menu items
-- Root menu items
INSERT INTO poc.access_menu (code, parent_id, display_order, is_visible)
VALUES 
    ('Dashboard', NULL, 1, TRUE),
    ('Case', NULL, 2, TRUE),
    ('User  Management', NULL, 3, TRUE),
    ('Menu Settings', NULL, 4, TRUE),
    ('Testing Image', NULL, 5, TRUE),  -- New menu item
    ('Prediction Image', NULL, 6, TRUE),  -- New menu item
    ('Realtime Monitoring', NULL, 7, TRUE),  -- New menu item
    ('Worker', NULL, 8, TRUE);  -- New menu item

-- Sub-menu items under Case
INSERT INTO poc.access_menu (code, parent_id, display_order, is_visible)
VALUES 
    ('Case List', (SELECT id FROM poc.access_menu WHERE code = 'Case'), 1, TRUE),
    ('Case Details', (SELECT id FROM poc.access_menu WHERE code = 'Case'), 2, TRUE);

-- Sub-menu items under User Management
INSERT INTO poc.access_menu (code, parent_id, display_order, is_visible)
VALUES 
    ('User  List', (SELECT id FROM poc.access_menu WHERE code = 'User  Management'), 1, TRUE),
    ('User  Roles', (SELECT id FROM poc.access_menu WHERE code = 'User  Management'), 2, TRUE),
    ('User  Permissions', (SELECT id FROM poc.access_menu WHERE code = 'User  Management'), 3, TRUE);

-- Sub-menu items under Menu Settings
INSERT INTO poc.access_menu (code, parent_id, display_order, is_visible)
VALUES 
    ('Add Menu Item', (SELECT id FROM poc.access_menu WHERE code = 'Menu Settings'), 1, TRUE),
    ('Edit Menu Item', (SELECT id FROM poc.access_menu WHERE code = 'Menu Settings'), 2, TRUE),
    ('Delete Menu Item', (SELECT id FROM poc.access_menu WHERE code = 'Menu Settings'), 3, TRUE);

-- Sub-menu items under Worker (example)
INSERT INTO poc.access_menu (code, parent_id, display_order, is_visible)
VALUES 
    ('Worker List', (SELECT id FROM poc.access_menu WHERE code = 'Worker'), 1, TRUE),
    ('Worker Details', (SELECT id FROM poc.access_menu WHERE code = 'Worker'), 2, TRUE);

-- Insert sample access permissions
INSERT INTO poc.access (id, role_id, menu_id, permission, created_at, updated_at)
VALUES 
    (1, 1, (SELECT id FROM poc.access_menu WHERE code = 'Dashboard'), 'view', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (2, 1, (SELECT id FROM poc.access_menu WHERE code = 'Case'), 'view', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (3, 1, (SELECT id FROM poc.access_menu WHERE code = 'Case List'), 'view', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (4, 1, (SELECT id FROM poc.access_menu WHERE code = 'User   List'), 'view', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (5, 1, (SELECT id FROM poc.access_menu WHERE code = 'Add Menu Item'), 'edit', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (6, 2, (SELECT id FROM poc.access_menu WHERE code = 'Case'), 'view', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (7, 2, (SELECT id FROM poc.access_menu WHERE code = 'Case List'), 'edit', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (8, 3, (SELECT id FROM poc.access_menu WHERE code = 'User   List'), 'view', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (9, 3, (SELECT id FROM poc.access_menu WHERE code = 'User   Roles'), 'view', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (10, 3, (SELECT id FROM poc.access_menu WHERE code = 'User   Permissions'), 'view', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (11, 1, (SELECT id FROM poc.access_menu WHERE code = 'Testing Image'), 'view', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (12, 1, (SELECT id FROM poc.access_menu WHERE code = 'Prediction Image'), 'view', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (13, 1, (SELECT id FROM poc.access_menu WHERE code = 'Realtime Monitoring'), 'view', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (14, 1, (SELECT id FROM poc.access_menu WHERE code = 'Worker List'), 'view', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (15, 1, (SELECT id FROM poc.access_menu WHERE code = 'Worker Details'), 'edit', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (16, 2, (SELECT id FROM poc.access_menu WHERE code = 'Testing Image'), 'view', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (17, 2, (SELECT id FROM poc.access_menu WHERE code = 'Prediction Image'), 'view', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (18, 2, (SELECT id FROM poc.access_menu WHERE code = 'Realtime Monitoring'), 'view', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
    (19, 2, (SELECT id FROM poc.access_menu WHERE code = 'Worker List'), 'view', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
	
	
ALTER TABLE poc.users
ADD COLUMN password_reset_token character varying(256),  -- Adjust the size as needed
ADD COLUMN token_expiration timestamp with time zone;