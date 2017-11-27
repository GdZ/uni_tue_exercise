package main;

import java.util.ArrayList;

public class ivt {

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

	public ArrayList<Fixation> ivt(Protocol protocol, double threshold){
		ArrayList<Fixation> fixations = new ArrayList<Fixation>();
		double velocity = 0.0;
		double D = 600;
		Fixation f = new Fixation();
		for(int i=0; i<protocol.getProtocol().size(); i++){
			// first do not calc velocity
			if(0 == i) continue;
			Point p0 = protocol.getProtocol().get(i-1);
			Point p1 = protocol.getProtocol().get(i);
			velocity = 2*Math.atan(Math.sqrt((p0.getX()-p1.getX())*(p0.getX()-p1.getX())/(p0.getY()-p1.getY())*(p0.getY()-p1.getY()))/(2*D))/(p1.getTime()-p0.getTime());

			if(velocity < threshold){
				ArrayList<Point> points = f.getPoints();
				points.add(p1);
				f.setPoints(points);
				f.setVelocity(velocity);
				fixations.add(f);
				protocol.getProtocol().get(i).setDel(true);
//			}else{
//				f = new Fixation();
			}
		}
		return fixations;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
