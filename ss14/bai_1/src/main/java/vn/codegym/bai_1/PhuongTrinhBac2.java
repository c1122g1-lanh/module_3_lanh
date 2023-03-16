package vn.codegym.bai_1;

public class PhuongTrinhBac2 {
    public static void calculate(double a,double b,double c){
        double delta = 0.0;
        delta =b*b - 4*a*c;
        double x1;
        double x2;
        if(delta < 0){
            System.out.println("phuong trinh vo nghiem");
        }else if (delta == 0){
            x1 = x2 = -(b/(2*a));
            System.out.println("phuong trinh co nghiem kep"+ x1);
        }else if (delta>0){
            x1 = (-b + Math.sqrt(delta))/2*a;
            x2 = (b + Math.sqrt(delta))/2*a;
            System.out.println("phuong trinh co 2 nghiem"+ " x1 ="+x1 +" va" + " x2 ="+x2  );
        }
    }

    public static void main(String[] args) {
        calculate(2,5,3);
    }
}
