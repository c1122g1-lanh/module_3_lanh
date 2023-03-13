package vn.codegym.bai_1.respository;

import vn.codegym.bai_1.model.Product;

import java.util.List;

public interface IProductRespository {
    List<Product> disPlay();
    void create(Product product);
    void update(int id,Product product);
    void delete(int id);
    void disPlayDetail();
    List<Product> search(String name);
    Product getProductById(int id);
}
