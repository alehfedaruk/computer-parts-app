package springapp.dao;

import org.hibernate.query.Query;
import springapp.model.ComputerPart;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public class PartDAOImpl implements PartDAO {
    private SessionFactory sessionFactory;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<ComputerPart> allParts(int page) {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("from ComputerPart order by title asc").setFirstResult(10 * (page - 1)).setMaxResults(10).list();
    }

    @Override
    public void add(ComputerPart part) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(part);
    }

    @Override
    public void delete(ComputerPart part) {
        Session session = sessionFactory.getCurrentSession();
        session.delete(part);
    }

    @Override
    public void update(ComputerPart part) {
        Session session = sessionFactory.getCurrentSession();
        session.update(part);
    }

    @Override
    public ComputerPart getPartById(int id) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(ComputerPart.class, id);
    }

    @Override
    public int partsCount() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("select count (*) from ComputerPart ", Number.class).getSingleResult().intValue();
    }

    @Override
    public int availability() {
        Session session = sessionFactory.getCurrentSession();
        return session.createQuery("select min (quantity) from ComputerPart where required = true", Number.class).getSingleResult().intValue();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<ComputerPart> searchByName(String name) {
        Session session = sessionFactory.getCurrentSession();
        if (name != null && name.length() > 0) {
            Query query = session.createQuery("from ComputerPart where title like '%" + name + "%'");
            return query.list();
        }
        return session.createQuery("from ComputerPart ").list();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<ComputerPart> filtered(String option) {
        Session session = sessionFactory.getCurrentSession();
        switch (option) {
            case "required":
                return session.createQuery("from ComputerPart where required = true ").list();

            case "non-required":
                return session.createQuery("from ComputerPart where required = false ").list();

            default:
                return session.createQuery("from ComputerPart").list();
        }
    }
}