class Travel{
  //model variables
  final String name;
  final String description;
  final int duration;
  final String location;
  final double rating;
  final int distance;
  final double cost;
  final List<String> imageUrl;

  //model constuctor
  Travel(this.name, this.duration, this.description, this.location, this.rating, this.distance, this.imageUrl, this.cost);

  //List of travel items
static List<Travel> getTravelItems(){
  final List<Travel> _travelList = [
    Travel('Keraton Kanoman Cirebon',4, '', 'Jl.Kanoman No.40,Lemahwungkuk,Kec.Lemahwungkuk,Kota Cirebon', 4.6, 3, ['images/Keraton.jpg', 'images/Keraton.jpg'], 230),
    Travel('Goa Sunyaragi',5, '', 'Sunyaragi,Kec.Kesambi,Kota Cirebon,Jawa Barat', 4.3, 6, ['images/ragi.jpg', 'images/ragi.jpg'], 432),
    Travel('Pantai Kejawanan',3, '', 'Pegambiran,Kec.Lemahwungkuk,Kota Cirebon', 4.5, 8, ['images/jawan.jpg', 'images/jawan.jpg'], 283),
    Travel('Cirebon Waterland Ade Irma Suryani',3, '', 'Jl.Yos.Sudarso No.1,Lemahwungkuk,Kec.Lemahwungkuk,Kota Cirebon', 4.2, 16, ['images/irma.jpg', 'images/irma.jpg'], 389),
    Travel('Batu Lawang',2, '', 'Cupang,Kec.Gempol,Kabupaten Cirebon', 4.8, 21, ['images/lawang.jpg', 'images/lawang.jpg'], 534),
    Travel('Bukit Grongrong',2, '', 'Patapan,Kec.Beber,Kabupaten Cirebon,Jawa Barat', 4.8, 21, ['images/Bukit Grongrong.jpg', 'images/Bukit Grongrong.jpg'], 534),
    Travel('Hutan Kera Plangon',2, '', 'Babakan,Kec.Sumber,Kabupaten Cirebon,Jawa Barat', 4.8, 21, ['images/langon.jpg', 'images/langon.jpg'], 534),
    Travel('Setu Sedong',2, '', 'Sedong Lor,Sedong,Cirebon,Jawa Barat', 4.8, 21, ['images/setu.jpg', 'images/setu.jpg'], 534),
  ];
  return _travelList;
}

//Get the nearest list items (Those whose distance is less than 10kms
static List<Travel> getNearestItems(){
  List<Travel> _travelList = Travel.getTravelItems();
  return _travelList.where((element) => element.distance < 10).toList();
}

}