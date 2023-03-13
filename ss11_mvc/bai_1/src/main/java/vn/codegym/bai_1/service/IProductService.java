package vn.codegym.bai_1.service;

import vn.codegym.bai_1.model.Product;
import vn.codegym.bai_1.respository.ProductRespository;

import java.util.List;

public interface IProductService {
    List<Product> disPlay();
    void create(Product product);
    void update(int id,Product product);
    void delete(int id);
    void search(String name);
    public Product getProductById(int id);
}
