package main;

import java.util.ArrayList;

import main.ivt.Fixation;
import main.ivt.Point;
import main.ivt.Protocol;

public class idt {

	class Point{
		private double x;
		private double y;
		private int time;
		private boolean del;
		public int getTime() {
			return time;
		}
		public void setTime(int time) {
			this.time = time;
		}
		public boolean isDel() {
			return del;
		}
		public void setDel(boolean del) {
			this.del = del;
		}
		public double getX() {
			return x;
		}
		public void setX(double x) {
			x = x;
		}
		public double getY() {
			return y;
		}
		public void setY(double y) {
			y = y;
		}
	}
	class Protocol{
		private ArrayList<Point>protocol;

		public ArrayList<Point> getProtocol() {
			return protocol;
		}
		public void setProtocol(ArrayList<Point> protocol) {
			this.protocol = protocol;
		}
	}

	class Fixation{
		private ArrayList<Point> points;
		private double velocity;
		public ArrayList<Point> getPoints() {
			return points;
		}
		public void setPoints(ArrayList<Point> points) {
			this.points = points;
		}
		public double getVelocity() {
			return velocity;
		}
		public void setVelocity(double velocity) {
			this.velocity = velocity;
		}
	}

	public ArrayList<Fixation> idt(Protocol protocol, double threshold_dispersion, double threshold_duration){
		ArrayList<Fixation> fixations = new ArrayList<Fixation>();
		double velocity = 0.0;
//		double D = 600;
		Fixation f = new Fixation();
		double thrduration_duration = 0.0;
		double max_x=0, min_x=0, max_y=0, min_y=0;

		for(Point item:protocol.getProtocol()){
			if(max_x < item.getX()){
				max_x = item.getX();
			}
			if(min_x > item.getX()){
				min_x = item.getX();
			}
			if(max_y < item.getY()){
				max_y = item.getY();
			}
			if(min_y > item.getY()){
				min_y = item.getY();
			}
		}
		threshold_dispersion = max_x - min_x + max_y - min_y;

		for(int i=0; i<protocol.getProtocol().size(); i++){
			// first do not calc velocity
			if(0 == i) {
				thrduration_duration = protocol.getProtocol().get(i).getTime() + 100;
			}else{
				Point p0 = protocol.getProtocol().get(i-1);
				Point p = protocol.getProtocol().get(i);
				double dispersion = p.getX();
				if(threshold_dispersion >= dispersion){
					//
				}
			}

		}
		return fixations;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
