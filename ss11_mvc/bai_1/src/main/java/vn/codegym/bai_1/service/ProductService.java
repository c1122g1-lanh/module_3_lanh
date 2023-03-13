package vn.codegym.bai_1.service;

import vn.codegym.bai_1.model.Product;
import vn.codegym.bai_1.respository.IProductRespository;
import vn.codegym.bai_1.respository.ProductRespository;

import java.util.List;

public class ProductService implements IProductService{
    private IProductRespository productRespository = new ProductRespository();

    @Override
    public List<Product> disPlay() {
        return productRespository.disPlay();
    }

    @Override
    public void create(Product product) {
        productRespository.create(product);
    }

    @Override
    public void update(int id, Product product) {
        productRespository.update(id,product);
    }

    @Override
    public void delete(int id) {
        productRespository.delete(id);

    }

    @Override
    public void search(String name) {
        productRespository.search(name);
    }

    @Override
    public Product getProductById(int id) {
        for (Product product : productRespository.disPlay()){
            if (product.getId()==id){
                return product;
            }
        }
        return null;
    }
}
