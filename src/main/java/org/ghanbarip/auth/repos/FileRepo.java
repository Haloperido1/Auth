package org.ghanbarip.auth.repos;

import org.ghanbarip.auth.domain.FileModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface FileRepo extends JpaRepository<FileModel, String> {
}
