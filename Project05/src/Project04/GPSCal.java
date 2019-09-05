package Project04;

public class GPSCal {
	 public double deg2rad(double deg){ //10진수 각도를 라디안으로 변환해주는 메소드
			return (deg*3.141592653589793/180);
		}
		public double rad2deg(double rad){ //라디안을 각도로 변환해주는 메소드
			return (rad*180/3.141592653589793);
		}
		public int getDistance2(double lat1, double lon1, double lat2, double lon2)
		{
			double deltaPhi, deltaLam, dist;	/*델타파이는 위도차의 라디안값, 
			델타람다는 경도차의 라디안값,디스트는 거리를 받는 변수*/
			deltaPhi = deg2rad(lat2-lat1);
			deltaLam = deg2rad(lon2-lon1);

			dist =	Math.sin(deltaPhi/2) *
						Math.sin(deltaPhi/2) +
						Math.cos(deg2rad(lat1)) *
						Math.cos(deg2rad(lat2)) *
						Math.sin(deltaLam/2) *
						Math.sin(deltaLam/2);
			dist = 2 * Math.atan2(Math.sqrt(dist), Math.sqrt(1-dist));
			dist = rad2deg(dist); //지구라디안을 각도로 바꾸기
			dist = dist * 60 * 1.1515; // 각도를 마일값로 바꾸기
			dist = dist * 1609.344; // 마일값을 미터값으로 바꾸기
			dist = dist / 1000;
			int result = (int)dist;
			return result;
		}	//피타고라스를 이용한 공식
		public GPSDTO getMidpoint1(double lat1, double lon1, double lat2, double lon2)
		{
			double theta, cX, cY, lat3, lon3;
			theta = lon1 - lon2;
			cX = Math.cos(lat2) * Math.cos(deg2rad(theta));
			cY = Math.cos(lat2) * Math.sin(deg2rad(theta));
			lat3 = Math.atan2(Math.sin(lat1)+Math.sin(lat2), Math.sqrt((Math.cos(lat1)+cX)*(Math.cos(lat1)+cX)+cY*cY));
			lon3 = lon1 + Math.atan2(cY, Math.cos(lat1)+cX);
			GPSDTO gpsDto = new GPSDTO();
			gpsDto.setLat(Double.toString(lat3));
			gpsDto.setLng(Double.toString(lon3));
			return gpsDto;
		}
		public GPSDTO getMidpoint2(double lat1, double lon1, double lat2, double lon2)
		{
			double cX, cY, deltaLam, lat3, lon3;
			deltaLam = deg2rad(lon2-lon1);
			cX =	Math.cos(deg2rad(lat2)) * 
					Math.cos(deltaLam);
			cY = Math.cos(deg2rad(lat2)) *
					Math.sin(deltaLam);
			lat3 = Math.atan2(Math.sin(deg2rad(lat1)) + Math.sin(deg2rad(lat2)),
				Math.sqrt((Math.cos(deg2rad(lat1))+cX)*(Math.cos(deg2rad(lat1))+cX) +
				cY * cY));
			lat3 = rad2deg(lat3);
			lon3 = deg2rad(lon1) + Math.atan2(cY, Math.cos(deg2rad(lat1))+ cX);
			lon3 = rad2deg(lon3);
			GPSDTO gpsDto = new GPSDTO();
			gpsDto.setLat(Double.toString(lat3));
			gpsDto.setLng(Double.toString(lon3));
			return gpsDto;
		}
		public GPSDTO getMidpoint3(double lat1, double lon1, double lat2, double lon2)
		{
			double lat3, lon3;
			lat3 = (lat1+lat2)*0.5;
			lon3 = (lon1+lon2)*0.5;
			GPSDTO gpsDto = new GPSDTO();
			gpsDto.setLat(Double.toString(lat3));
			gpsDto.setLng(Double.toString(lon3));
			return gpsDto;
		}
}
