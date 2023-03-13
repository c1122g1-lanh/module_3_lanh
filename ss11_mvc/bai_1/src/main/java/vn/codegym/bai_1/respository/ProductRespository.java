package vn.codegym.bai_1.respository;

import vn.codegym.bai_1.model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRespository implements IProductRespository{
    private static List<Product> productList;

    static {
        productList = new ArrayList<>();
        productList.add(new Product(1,"A",10.0,"yes","VN"));
        productList.add(new Product(2,"B",14.0,"no","USA"));
        productList.add(new Product(3,"C",12.0,"no","TQ"));
        productList.add(new Product(4,"D",11.0,"yes","VN"));
        productList.add(new Product(5,"E",15.0,"no","USA"));
        productList.add(new Product(6,"F",13.0,"yes","VN"));
    }

    @Override
    public List<Product> disPlay() {
        return productList;
    }

    @Override
    public void create(Product product) {
        productList.add(product);
    }

    @Override
    public void update(int id,Product product) {
        for (int i =0;i<productList.size();i++){
            if (productList.get(i).getId()==id){
                productList.set(id,product);
            }
        }

    }

    @Override
    public void delete(int id) {
        for (Product product : productList){
            if (product.getId()==id){
                productList.remove(product);
            }
        }

    }

    @Override
    public void disPlayDetail() {

    }

    @Override
    public List<Product> search(String name) {
        List<Product> products = new ArrayList<>();
        for (Product product : productList){
            if (product.getName().equals(name)){
                products.add(product);
            }
        }
        return products;
    }

    @Override
    public Product getProductById(int id) {
        for (Product product : productList){
            if (product.getId()==id){
                return product;
            }
        }
        return null;
    }
}
