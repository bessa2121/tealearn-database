CREATE TABLE adapted_materials (
    id BIGSERIAL PRIMARY KEY,
    material_id BIGINT NOT NULL,
    adapted_text TEXT NOT NULL,
    prompt_version VARCHAR(50),

    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_adapted_material
        FOREIGN KEY (material_id)
        REFERENCES materials(id)
        ON DELETE CASCADE
);