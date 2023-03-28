package com.laptrinhjavaweb.repository.custom.impl;

import java.lang.reflect.Field;
import java.util.List;

import javax.persistence.*;

import com.laptrinhjavaweb.builder.BuildingSearchBuilder;
import com.laptrinhjavaweb.repository.custom.BuildingRepositoryCustom;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.utils.ObjectUtils;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

@Repository
public class BuildingRepositoryImpl implements BuildingRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;


    @Override
    public List<BuildingEntity> listAll(Pageable pageable) {
        StringBuilder finalSql = buildQueryFindAllFilter().append(" LIMIT ").append(pageable.getPageSize()).append("\n")
                .append(" OFFSET ").append(pageable.getOffset());
        Query query = entityManager.createNativeQuery(finalSql.toString(), BuildingEntity.class);
        return query.getResultList();
    }

    private StringBuilder buildQueryFindAllFilter() {
        StringBuilder sql = new StringBuilder("select*from building b ");
        return sql;
    }


    private StringBuilder buildQueryFindConditionFilter(BuildingSearchBuilder buildingDTO) {
        StringBuilder finalSql = new StringBuilder("select distinct b.* from building b ");
        StringBuilder joinQuery = new StringBuilder();
        StringBuilder whereQuery = new StringBuilder();
        buildQueryWithJoin(buildingDTO, joinQuery, whereQuery);
        buildQueryWithoutJoin(buildingDTO, whereQuery);
        finalSql.append(joinQuery);
        finalSql.append(" where 1=1 ");
        finalSql.append(whereQuery);
        return finalSql;
    }

    @Override
    public List<BuildingEntity> findByCondition(BuildingSearchBuilder buildingDTO, Pageable pageable) {
        StringBuilder finalSql = buildQueryFindConditionFilter(buildingDTO).append(" LIMIT ").append(pageable.getPageSize()).append("\n")
                .append(" OFFSET ").append(pageable.getOffset());
        Query query = entityManager.createNativeQuery(finalSql.toString(), BuildingEntity.class);
        return query.getResultList();
    }


    @Override
    public int countTotalItemFindAllBuilding() {
        StringBuilder sql = buildQueryFindAllFilter();
        Query query = entityManager.createNativeQuery(sql.toString());
        return query.getResultList().size();
    }


    @Override
    public int countTotalItemFindConditionBuilding(BuildingSearchBuilder buildingDTO) {
        StringBuilder sql = buildQueryFindConditionFilter(buildingDTO);
        Query query = entityManager.createNativeQuery(sql.toString());
        return query.getResultList().size();
    }


    private void buildQueryWithJoin(BuildingSearchBuilder buildingDTO, StringBuilder joinQuery,
                                    StringBuilder whereQuery) {
        Integer areaFrom = ObjectUtils.getObject(buildingDTO.getAreaFrom(), Integer.class);
        Integer areaTo = ObjectUtils.getObject(buildingDTO.getAreaTo(), Integer.class);
        String staffInCharge = ObjectUtils.getObject(buildingDTO.getStaffInCharge(), String.class);

        if (areaTo != null || areaFrom != null) {
            joinQuery.append("  join rentarea ra on b.id=ra.buildingid ");
            if (areaFrom != null) {
                whereQuery.append(" and ra.value>= " + areaFrom);
            }
            if (areaTo != null) {
                whereQuery.append(" and ra.value<= " + areaTo);
            }

        }
        if (staffInCharge != null) {
            joinQuery.append(" join assignmentbuilding ab on ab.buildingid=b.id ");
            whereQuery.append(" and ab.staffid=" + staffInCharge);
        }

    }

    public StringBuilder buildSqlUsingReflection(StringBuilder whereQuery, BuildingSearchBuilder buildingDTO) {
        try {
            Field[] fields = BuildingSearchBuilder.class.getDeclaredFields();
            for (Field field : fields) {
                field.setAccessible(true);
                String fieldName = field.getName();
                Object objectValue = field.get(buildingDTO);
                if (!fieldName.startsWith("price") && !fieldName.startsWith("area") && !fieldName.equals("staffInCharge")
                        && !fieldName.equals("manageOfPhone")) {
                    if (field.getType().getName().equals("java.lang.String")) {
                        if (ObjectUtils.getObject(objectValue, String.class) != null) {
                            whereQuery.append(" and b." + fieldName.toLowerCase() + " like '%" + objectValue + "%' ");
                        }
                    } else if (field.getType().getName().equals("java.lang.Integer")) {
                        if (ObjectUtils.getObject(objectValue, Integer.class) != null) {
                            whereQuery.append(" and b." + fieldName.toLowerCase() + " = " + objectValue);
                        }
                    }
                }
                //xet price
                else if (fieldName.startsWith("price")) {
                    if (fieldName.equals("priceTo")) {
                        if (field.getType().getName().equals("java.lang.Integer")) {
                            if (ObjectUtils.getObject(objectValue, Integer.class) != null) {
                                whereQuery.append(" and b.rentprice" + " >= " + objectValue);
                            }
                        }
                    } else if (fieldName.equals("priceFrom")) {
                        if (field.getType().getName().equals("java.lang.Integer")) {
                            if (ObjectUtils.getObject(objectValue, Integer.class) != null) {
                                whereQuery.append(" and b.rentprice" + " <= " + objectValue);
                            }
                        }
                    }
                }
            }

        } catch (Exception e) {

        }
        return whereQuery;
    }

    private void buildQueryWithoutJoin(BuildingSearchBuilder buildingDTO, StringBuilder whereQuery) {
        whereQuery = buildSqlUsingReflection(whereQuery, buildingDTO);
    }
}
