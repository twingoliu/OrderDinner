/**
 * @author (c) 2018, Chen_9g 陈刚 (80588183@qq.com).
 * @date 2018-09-28  下午5:20
 *
 * <p>
 * Find a way for success and not make excuses for failure.
 * </p>
 */

package org.jleopard.ihotel.dao;

import org.jleopard.exception.SqlSessionException;
import org.jleopard.ihotel.core.annotation.Bean;
import org.jleopard.ihotel.entity.DinnerTable;
import org.jleopard.session.SqlSession;

import java.util.List;

@Bean
public class DinnerTableDao extends BaseDao<DinnerTable> {

    public int deleteById(Integer id){
        SqlSession session = sessionFactory.openSession();
        try {
            int temp = session.delete(DinnerTable.class,id);
            session.commit();
            session.close();
            return temp;
        } catch (SqlSessionException e) {
            try {
                session.rollback();
            } catch (SqlSessionException e1) {
                e1.printStackTrace();
            }
        }
        return -1;
    }

    public List<DinnerTable> select(){
        SqlSession session = sessionFactory.openSession();
        try {
            List<DinnerTable> tables = (List<DinnerTable>) session.get(DinnerTable.class);
            session.close();
            return tables;
        } catch (SqlSessionException e) {
            e.printStackTrace();
        }
        return null;
    }
}
