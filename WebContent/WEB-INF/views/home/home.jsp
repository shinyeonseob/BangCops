<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/layout/header.jsp" />

<script
	src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js">
    </script>
<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCphNLUHRtOMojdg0FPMyj2F0xEkYHeyMo&callback=initMap">
    </script>

<style type="text/css">
#jb-container {
	width: 940px;
	margin: 0px auto;
	padding: 20px;
	border: 1px solid #bcbcbc;
}

#map {
	width: 580px;
	padding: 20px;
	margin-bottom: 20px;
	float: left;
	border: 1px solid #bcbcbc;
}

#jb-sidebar {
	width: 260px;
	padding: 20px;
	margin-bottom: 20px;
	float: right;
	border: 1px solid #bcbcbc;
}

#servicecenter {
	clear: both;
	padding: 20px;
	border: 1px solid #bcbcbc;
}

.new {
	width: 260px;
	padding: 20px;
	margin-bottom: 20px;
	float: right;
	border: 1px solid #bcbcbc;
}

#board {
	clear: both;
	padding: 20px;
	border: 1px solid #bcbcbc;
}
</style>

<div id="jb-container">

	<div id="map" style="height: 473px; width: 70%;"></div>
	<script>
function initMap() {

        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 11,
          center: {lat: 37.553226, lng: 126.980885}
        });

        var labels = '';

        var markers = locations.map(function(location, i) {
          return new google.maps.Marker({
            position: location,
            label: labels[i % labels.length]
          });
        });

        var markerCluster = new MarkerClusterer(map, markers,
            {imagePath: 'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m'});
      }
      var locations = [
    	  {lat: 37.575195, lng: 126.9799525},
    	  {lat: 37.5849071, lng: 126.9724098},
    	  {lat: 37.5926842, lng: 126.9257987},
    	  {lat: 37.5695052, lng: 126.9984624},
    	  {lat: 37.5846181, lng: 126.9991755},
    	  {lat: 37.5752459, lng: 126.9864011},
    	  {lat: 37.5713261, lng: 126.9832337},
    	  {lat: 37.5715373, lng: 126.9802941},
    	  {lat: 37.5124878, lng: 126.9551134},
    	  {lat: 37.5798178, lng: 126.9700653},
    	  {lat: 37.6463131, lng: 127.0433803},
    	  {lat: 37.5883148, lng: 127.0460902},
    	  {lat: 37.5802851, lng: 127.0556712},
    	  {lat: 37.5994013, lng: 127.0624711},
    	  {lat: 37.5881848, lng: 127.0643275},
    	  {lat: 37.4996854, lng: 126.9455507},
    	  {lat: 37.4663645, lng: 126.8975781},
    	  {lat: 37.4497033, lng: 126.9106968},
    	  {lat: 37.4946532, lng: 126.8517614},
    	  {lat: 37.4937929, lng: 126.8853184},
    	  {lat: 37.556819, lng: 127.0154307},
    	  {lat: 37.6219876, lng: 127.023568},
    	  {lat: 37.575276, lng: 126.9718272},
    	  {lat: 37.5674664, lng: 126.9894374},
    	  {lat: 37.6102524, lng: 127.1011554},
    	  {lat: 37.5773667, lng: 126.8147523},
    	  {lat: 37.4630314, lng: 126.9347748},
    	  {lat: 37.4750363, lng: 126.9490877},
    	  {lat: 37.5797855, lng: 126.9810122},
    	  {lat: 37.5802364, lng: 126.9623726},
    	  {lat: 37.5827295, lng: 126.9805798},
    	  {lat: 37.5752845, lng: 126.9739372},
    	  {lat: 37.5138347, lng: 127.0317065},
    	  {lat: 37.5835524, lng: 126.9641937},
    	  {lat: 37.6210985, lng: 126.9132644},
    	  {lat: 37.569505, lng: 126.9803081},
    	  {lat: 37.5720312, lng: 126.990647},
    	  {lat: 37.5662169, lng: 126.7883552},
    	  {lat: 37.5528356, lng: 126.8112165},
    	  {lat: 37.5067515, lng: 126.9277457},
    	  {lat: 37.5733668, lng: 126.9721018},
    	  {lat: 37.5052783, lng: 126.9638235},
    	  {lat: 37.6525541, lng: 127.027372},
    	  {lat: 37.6646494, lng: 127.033485},
    	  {lat: 37.580573, lng: 126.9723678},
    	  {lat: 37.6852416, lng: 127.0298659},
    	  {lat: 37.5847824, lng: 127.0368408},
    	  {lat: 37.6122006, lng: 126.9088195},
    	  {lat: 37.5699332, lng: 127.0551219},
    	  {lat: 37.5762335, lng: 127.0348719},
    	  {lat: 37.5774765, lng: 126.9838448},
    	  {lat: 37.594437, lng: 127.0521254},
    	  {lat: 37.4810222, lng: 126.8236565},
    	  {lat: 37.5794898, lng: 126.9770088},
    	  {lat: 37.5710316, lng: 126.9692512},
    	  {lat: 37.5898785, lng: 126.9813801},
    	  {lat: 37.5748049, lng: 127.0255932},
    	  {lat: 37.5809142, lng: 126.9927446},
    	  {lat: 37.5829045, lng: 126.9868775},
    	  {lat: 37.5827038, lng: 126.9718984},
    	  {lat: 37.5706982, lng: 126.9803342},
    	  {lat: 37.5711171, lng: 127.0674268},
    	  {lat: 37.4851779, lng: 126.9717962},
    	  {lat: 37.4754693, lng: 126.884239},
    	  {lat: 37.4830168, lng: 126.8882519},
    	  {lat: 37.561147, lng: 126.9924131},
    	  {lat: 37.5024055, lng: 126.8586175},
    	  {lat: 37.5105874, lng: 126.8830737},
    	  {lat: 37.4922507, lng: 126.8372032},
    	  {lat: 37.6125348, lng: 127.0803391},
    	  {lat: 37.6041196, lng: 126.9344915},
    	  {lat: 37.5753838, lng: 126.9658266},
    	  {lat: 37.5849864, lng: 126.8928479},
    	  {lat: 37.5890286, lng: 126.968516},
    	  {lat: 37.6191932, lng: 126.9351343},
    	  {lat: 37.5715788, lng: 126.9738254},
    	  {lat: 37.60508, lng: 126.9121449},
    	  {lat: 37.5959208, lng: 126.9074635},
    	  {lat: 37.5778624, lng: 126.9710384},
    	  {lat: 37.583179, lng: 126.9061071},
    	  {lat: 37.5032399, lng: 126.9498624},
    	  {lat: 37.4921384, lng: 126.9166602},
    	  {lat: 37.6422519, lng: 126.9340853},
    	  {lat: 37.5676493, lng: 127.0160094},
    	  {lat: 37.5703825, lng: 126.9923931},
    	  {lat: 37.566416, lng: 127.0095184},
    	  {lat: 37.575484, lng: 126.9976457},
    	  {lat: 37.5642292, lng: 127.0152231},
    	  {lat: 37.5691978, lng: 126.9859068},
    	  {lat: 37.5600001, lng: 126.9873838},
    	  {lat: 37.574232, lng: 126.9897105},
    	  {lat: 37.5781586, lng: 126.9852531},
    	  {lat: 37.5606513, lng: 126.9893973},
    	  {lat: 37.5388869, lng: 126.9396829},
    	  {lat: 37.5690609, lng: 126.9904498},
    	  {lat: 37.5725522, lng: 126.9918441},
    	  {lat: 37.5692358, lng: 126.9942546},
    	  {lat: 37.560059, lng: 126.9840944},
    	  {lat: 37.5625808, lng: 126.999591},
    	  {lat: 37.576392, lng: 126.9883162},
    	  {lat: 37.6126506, lng: 126.9243915},
    	  {lat: 37.4936808, lng: 126.8204195},
    	  {lat: 37.5768799, lng: 126.9677042},
    	  {lat: 37.5873096, lng: 126.993071},
    	  {lat: 37.6001601, lng: 127.0832215},
    	  {lat: 37.6292269, lng: 127.0363793},
    	  {lat: 37.4766387, lng: 127.1001172},
    	  {lat: 37.5741579, lng: 126.9847962},
    	  {lat: 37.5760033, lng: 127.0135248},
    	  {lat: 37.5766752, lng: 127.0190654},
    	  {lat: 37.5685483, lng: 127.0031306},
    	  {lat: 37.5605244, lng: 126.9909108},
    	  {lat: 37.5622482, lng: 126.9919615},
    	  {lat: 37.5674834, lng: 126.9870581},
    	  {lat: 37.5819253, lng: 127.0902098},
    	  {lat: 37.5733424, lng: 127.0034709},
    	  {lat: 37.574112, lng: 126.8309814},
    	  {lat: 37.5534112, lng: 126.7831645},
    	  {lat: 37.6304774, lng: 127.0884819},
    	  {lat: 37.5971818, lng: 127.0178327},
    	  {lat: 37.5682735, lng: 126.9989423},
    	  {lat: 37.5779984, lng: 126.9727227},
    	  {lat: 37.5706899, lng: 126.9979795},
    	  {lat: 37.572373, lng: 126.9930164},
    	  {lat: 37.5772363, lng: 126.9805782},
    	  {lat: 37.600464, lng: 127.078447},
    	  {lat: 37.6003767, lng: 127.1056494},
    	  {lat: 37.5009522, lng: 126.8286616},
    	  {lat: 37.4801779, lng: 126.8394455},
    	  {lat: 37.5421699, lng: 126.8468434},
    	  {lat: 37.5676122, lng: 126.9961712},
    	  {lat: 37.5684349, lng: 126.9644742},
    	  {lat: 37.5629167, lng: 126.9739585},
    	  {lat: 37.5784882, lng: 126.9996745},
    	  {lat: 37.587822, lng: 127.0023231},
    	  {lat: 37.5737459, lng: 127.0001197},
    	  {lat: 37.5591789, lng: 126.9847191},
    	  {lat: 37.5674173, lng: 126.9846423},
    	  {lat: 37.5591646, lng: 126.965563},
    	  {lat: 37.4998676, lng: 127.0386903},
    	  {lat: 37.5395606, lng: 126.9506257},
    	  {lat: 37.5624854, lng: 126.9782512},
    	  {lat: 37.574766, lng: 127.0059177},
    	  {lat: 37.5701811, lng: 126.9653069},
    	  {lat: 37.5722418, lng: 127.0072742},
    	  {lat: 37.5773254, lng: 127.0054708},
    	  {lat: 37.5567475, lng: 126.9713415},
    	  {lat: 37.5737344, lng: 126.983095},
    	  {lat: 37.5725546, lng: 126.9886249},
    	  {lat: 37.5707645, lng: 126.9863064},
    	  {lat: 37.576109, lng: 126.9917567},
    	  {lat: 37.5577553, lng: 126.9973741},
    	  {lat: 37.5571575, lng: 126.9816996},
    	  {lat: 37.5770464, lng: 126.9819272},
    	  {lat: 37.5707296, lng: 127.0033505},
    	  {lat: 37.5676735, lng: 126.9668356},
    	  {lat: 37.5638976, lng: 126.9799894},
    	  {lat: 37.5889535, lng: 126.9974082},
    	  {lat: 37.5726289, lng: 126.9980207},
    	  {lat: 37.5806863, lng: 126.9826104},
    	  {lat: 37.5644525, lng: 126.9844716},
    	  {lat: 37.5679302, lng: 126.9847935},
    	  {lat: 37.5580671, lng: 126.9775971},
    	  {lat: 37.6139675, lng: 126.9743019},
    	  {lat: 37.6632405, lng: 126.9992184},
    	  {lat: 37.5655385, lng: 127.1576826},
    	  {lat: 37.5614488, lng: 127.0005455},
    	  {lat: 37.5828064, lng: 126.984865},
    	  {lat: 37.5841834, lng: 126.9880869},
    	  {lat: 37.5720605, lng: 126.9859557},
    	  {lat: 37.5703732, lng: 126.9740725},
    	  {lat: 37.5677264, lng: 126.9927713},
    	  {lat: 37.5589096, lng: 126.9729617},
    	  {lat: 37.5610267, lng: 126.9826401},
    	  {lat: 37.5563671, lng: 126.9763019},
    	  {lat: 37.5640814, lng: 126.998038},
    	  {lat: 37.5793623, lng: 126.9680058},
    	  {lat: 37.5738606, lng: 126.98058},
    	  {lat: 37.5742191, lng: 126.994071},
    	  {lat: 37.58161, lng: 127.0051706},
    	  {lat: 37.5675948, lng: 126.9831124},
    	  {lat: 37.5623459, lng: 126.9708091},
    	  {lat: 37.5680651, lng: 126.9788677},
    	  {lat: 37.5685914, lng: 127.0204708},
    	  {lat: 37.5617555, lng: 126.9877462},
    	  {lat: 37.5511329, lng: 127.0818924},
    	  {lat: 37.5559718, lng: 126.8712411},
    	  {lat: 37.5643088, lng: 126.9899009},
    	  {lat: 37.5668186, lng: 127.0021804},
    	  {lat: 37.52883, lng: 127.0295048},
    	  {lat: 37.5558883, lng: 126.9669835},
    	  {lat: 37.5585169, lng: 126.9827614},
    	  {lat: 37.5823905, lng: 126.9998063},
    	  {lat: 37.5447269, lng: 126.9194339},
    	  {lat: 37.4989487, lng: 127.0646585},
    	  {lat: 37.5577912, lng: 127.1295094},
    	  {lat: 37.5532424, lng: 127.0734926},
    	  {lat: 37.5665987, lng: 126.9924035},
    	  {lat: 37.5632359, lng: 126.9764071},
    	  {lat: 37.566393, lng: 126.9977072},
    	  {lat: 37.5637065, lng: 126.9684918},
    	  {lat: 37.567505, lng: 127.0070798},
    	  {lat: 37.5147968, lng: 127.0550898},
    	  {lat: 37.558812, lng: 126.9341472},
    	  {lat: 37.5606655, lng: 126.9695135},
    	  {lat: 37.4717408, lng: 127.1114704},
    	  {lat: 37.596525, lng: 127.0332814},
    	  {lat: 37.5606911, lng: 126.9755028},
    	  {lat: 37.543806, lng: 126.927945},
    	  {lat: 37.4660631, lng: 127.0178631},
    	  {lat: 37.5255867, lng: 127.0522749},
    	  {lat: 37.5638636, lng: 126.98204},
    	  {lat: 37.5583248, lng: 126.9858851},
    	  {lat: 37.5642498, lng: 126.9878916},
    	  {lat: 37.5650378, lng: 127.0051839},
    	  {lat: 37.5639442, lng: 127.0083469},
    	  {lat: 37.5610374, lng: 127.0076401},
    	  {lat: 37.5676689, lng: 127.1720394},
    	  {lat: 37.5865739, lng: 126.8031384},
    	  {lat: 37.5679849, lng: 126.8444363},
    	  {lat: 37.5552599, lng: 127.0003344},
    	  {lat: 37.5791085, lng: 126.911718},
    	  {lat: 37.5678826, lng: 126.9811939},
    	  {lat: 37.4881299, lng: 127.0440336},
    	  {lat: 37.5508013, lng: 127.1698692},
    	  {lat: 37.5726345, lng: 126.9472296},
    	  {lat: 37.6179518, lng: 126.9621627},
    	  {lat: 37.5577913, lng: 126.9949769},
    	  {lat: 37.5661453, lng: 126.9733065},
    	  {lat: 37.5623108, lng: 126.9959752},
    	  {lat: 37.5289353, lng: 127.1469441},
    	  {lat: 37.5630636, lng: 127.0883255},
    	  {lat: 37.5551793, lng: 126.9897764},
    	  {lat: 37.6030533, lng: 126.9618057},
    	  {lat: 37.4824461, lng: 127.0627324},
    	  {lat: 37.5616684, lng: 126.9794388},
    	  {lat: 37.5495179, lng: 126.8203069},
    	  {lat: 37.6371315, lng: 127.0075443},
    	  {lat: 37.5744857, lng: 126.9626524},
    	  {lat: 37.5519877, lng: 126.8527944},
    	  {lat: 37.5668791, lng: 126.9680887},
    	  {lat: 37.487919, lng: 127.0852159},
    	  {lat: 37.4644483, lng: 127.1066382},
    	  {lat: 37.522901, lng: 127.0246551},
    	  {lat: 37.5725293, lng: 126.9312651},
    	  {lat: 37.5431857, lng: 127.1265646},
    	  {lat: 37.5492254, lng: 126.9472148},
    	  {lat: 37.468455, lng: 127.0362469},
    	  {lat: 37.5622877, lng: 126.9621682},
    	  {lat: 37.5485893, lng: 127.1517553},
    	  {lat: 37.5662175, lng: 126.9039251},
    	  {lat: 37.5934957, lng: 126.9672855},
    	  {lat: 37.5873266, lng: 126.9472803},
    	  {lat: 37.5304064, lng: 127.1288445},
    	  {lat: 37.5470257, lng: 126.9243738},
    	  {lat: 37.6295557, lng: 127.0562535},
    	  {lat: 37.5473874, lng: 126.9555578},
    	  {lat: 37.4855136, lng: 127.0984645},
    	  {lat: 37.5435569, lng: 126.7978766},
    	  {lat: 37.5659055, lng: 126.980572},
    	  {lat: 37.554422, lng: 126.9559629},
    	  {lat: 37.4451504, lng: 127.0596524},
    	  {lat: 37.5933419, lng: 126.9395754},
    	  {lat: 37.5715459, lng: 126.8778772},
    	  {lat: 37.5674955, lng: 126.9620155},
    	  {lat: 37.5651557, lng: 126.9433454},
    	  {lat: 37.5766943, lng: 126.9185077},
    	  {lat: 37.5536496, lng: 126.9200806},
    	  {lat: 37.4449934, lng: 127.0495943},
    	  {lat: 37.5637681, lng: 127.0045499},
    	  {lat: 37.5657158, lng: 126.9862633},
    	  {lat: 37.5645365, lng: 126.9945524},
    	  {lat: 37.6005798, lng: 126.9567853},
    	  {lat: 37.5498968, lng: 126.9427936},
    	  {lat: 37.5675677, lng: 126.9773829},
    	  {lat: 37.5649689, lng: 126.9639848},
    	  {lat: 37.564601, lng: 126.992348},
    	  {lat: 37.4630565, lng: 126.9776247},
    	  {lat: 37.5630105, lng: 126.9852883},
    	  {lat: 37.5711594, lng: 126.9641517},
    	  {lat: 37.5613992, lng: 126.9453107},
    	  {lat: 37.5542553, lng: 126.9643234},
    	  {lat: 37.5045831, lng: 127.002177},
    	  {lat: 37.5626693, lng: 126.9223736},
    	  {lat: 37.4885178, lng: 127.0171251},
    	  {lat: 37.5903924, lng: 127.0116172},
    	  {lat: 37.5824037, lng: 127.0201561},
    	  {lat: 37.5037347, lng: 127.1339178},
    	  {lat: 37.5432645, lng: 126.9306675},
    	  {lat: 37.5624296, lng: 127.0550854},
    	  {lat: 37.5898185, lng: 127.0133533},
    	  {lat: 37.5796096, lng: 127.0223215},
    	  {lat: 37.5936325, lng: 127.0140289},
    	  {lat: 37.6160358, lng: 127.0503368},
    	  {lat: 37.5489947, lng: 126.8900755},
    	  {lat: 37.5163358, lng: 126.853025},
    	  {lat: 37.5367323, lng: 126.8764168},
    	  {lat: 37.5888166, lng: 127.0081301},
    	  {lat: 37.5291366, lng: 126.8991346},
    	  {lat: 37.5443996, lng: 126.9556066},
    	  {lat: 37.5805404, lng: 127.0246074},
    	  {lat: 37.5716735, lng: 126.9067459},
    	  {lat: 37.5741171, lng: 126.954731},
    	  {lat: 37.5692019, lng: 126.9591259},
    	  {lat: 37.584334, lng: 127.0165173},
    	  {lat: 37.5895393, lng: 127.004033},
    	  {lat: 37.5839528, lng: 127.0236731},
    	  {lat: 37.5900467, lng: 127.0197109},
    	  {lat: 37.5460069, lng: 126.9323383},
    	  {lat: 37.4631455, lng: 127.0527371},
    	  {lat: 37.5641432, lng: 126.9962714},
    	  {lat: 37.5397058, lng: 127.1470069},
    	  {lat: 37.638495, lng: 127.0715073},
    	  {lat: 37.5422601, lng: 126.9345409},
    	  {lat: 37.5678141, lng: 126.9597567},
    	  {lat: 37.5168611, lng: 126.9842131},
    	  {lat: 37.6508772, lng: 127.0775079},
    	  {lat: 37.5498986, lng: 126.9290711},
    	  {lat: 37.5767914, lng: 126.9582278},
    	  {lat: 37.5646453, lng: 126.9439075},
    	  {lat: 37.5436014, lng: 127.093166},
    	  {lat: 37.5643661, lng: 127.0285936},
    	  {lat: 37.6167753, lng: 126.9983572},
    	  {lat: 37.4785724, lng: 127.1320172},
    	  {lat: 37.5058261, lng: 126.9126517},
    	  {lat: 37.5326108, lng: 126.8899611},
    	  {lat: 37.534892, lng: 126.9024682},
    	  {lat: 37.5829039, lng: 127.0213823},
    	  {lat: 37.5941547, lng: 127.0204851},
    	  {lat: 37.5858495, lng: 127.018301},
    	  {lat: 37.5049182, lng: 127.1138537},
    	  {lat: 37.5901376, lng: 127.0072562},
    	  {lat: 37.5420259, lng: 127.0219998},
    	  {lat: 37.5670762, lng: 127.0407448},
    	  {lat: 37.5864995, lng: 127.0196092},
    	  {lat: 37.5082421, lng: 126.90154},
    	  {lat: 37.5462385, lng: 126.9666853},
    	  {lat: 37.532933, lng: 126.9506459},
    	  {lat: 37.5134157, lng: 126.9067838},
    	  {lat: 37.543576, lng: 126.9607224},
    	  {lat: 37.5503851, lng: 126.9805052},
    	  {lat: 37.5478042, lng: 126.9079932},
    	  {lat: 37.4893748, lng: 127.147023},
    	  {lat: 37.6079392, lng: 127.0611742},
    	  {lat: 37.5388621, lng: 126.9922784},
    	  {lat: 37.5280447, lng: 126.9632302},
    	  {lat: 37.5530419, lng: 127.0213785},
    	  {lat: 37.5407489, lng: 127.0571066},
    	  {lat: 37.5540256, lng: 126.938245},
    	  {lat: 37.5591737, lng: 127.03525},
    	  {lat: 37.4856663, lng: 127.1237435},
    	  {lat: 37.5559402, lng: 126.8999197},
    	  {lat: 37.5296813, lng: 126.8897891},
    	  {lat: 37.5488937, lng: 126.9671724},
    	  {lat: 37.5312807, lng: 126.9686038},
    	  {lat: 37.5430767, lng: 126.9858634},
    	  {lat: 37.5214443, lng: 126.8985373},
    	  {lat: 37.5433004, lng: 126.9666029},
    	  {lat: 37.5525166, lng: 127.0217887},
    	  {lat: 37.5163579, lng: 127.1260691},
    	  {lat: 37.5477291, lng: 127.1042144},
    	  {lat: 37.4942803, lng: 127.1176314},
    	  {lat: 37.5427197, lng: 126.889431},
    	  {lat: 37.5589469, lng: 127.0467523},
    	  {lat: 37.6084879, lng: 127.0223926},
    	  {lat: 37.5290519, lng: 126.837064},
    	  {lat: 37.5188354, lng: 126.9651355},
    	  {lat: 37.526885, lng: 127.0017006},
    	  {lat: 37.5374384, lng: 127.0060974},
    	  {lat: 37.5963264, lng: 127.0168846},
    	  {lat: 37.5806329, lng: 127.0192952},
    	  {lat: 37.5335451, lng: 127.1132244},
    	  {lat: 37.5111559, lng: 127.0858095},
    	  {lat: 37.5963137, lng: 127.0142975},
    	  {lat: 37.5499287, lng: 127.0195555},
    	  {lat: 37.5153035, lng: 127.0093895},
    	  {lat: 37.5358426, lng: 126.9730994},
    	  {lat: 37.5435023, lng: 127.0736984},
    	  {lat: 37.5634228, lng: 127.0332234},
    	  {lat: 37.5321286, lng: 126.9010103},
    	  {lat: 37.502828, lng: 127.1041072},
    	  {lat: 37.5181304, lng: 126.9084001},
    	  {lat: 37.5242607, lng: 126.9071887},
    	  {lat: 37.538784, lng: 126.9562612},
    	  {lat: 37.5480088, lng: 126.9372621},
    	  {lat: 37.5701581, lng: 126.9583202},
    	  {lat: 37.5915119, lng: 127.0150678},
    	  {lat: 37.5412913, lng: 126.9404517},
    	  {lat: 37.5224645, lng: 126.8938154},
    	  {lat: 37.5885476, lng: 127.0160023},
    	  {lat: 37.5867502, lng: 127.0134422},
    	  {lat: 37.5918678, lng: 127.0106032},
    	  {lat: 37.5515203, lng: 126.9729157},
    	  {lat: 37.5377219, lng: 126.9597101},
    	  {lat: 37.5290851, lng: 126.9050152},
    	  {lat: 37.5231837, lng: 126.8886738},
    	  {lat: 37.5210399, lng: 126.9068178},
    	  {lat: 37.5399032, lng: 126.967552},
    	  {lat: 37.5671038, lng: 127.0327206},
    	  {lat: 37.5428503, lng: 126.9733902},
    	  {lat: 37.5018103, lng: 127.0897701},
    	  {lat: 37.5163676, lng: 126.88352},
    	  {lat: 37.536882, lng: 126.9436223},
    	  {lat: 37.5613616, lng: 126.9662488},
    	  {lat: 37.5635697, lng: 126.9673975},
    	  {lat: 37.5580953, lng: 126.9258052},
    	  {lat: 37.5343201, lng: 126.9577325},
    	  {lat: 37.5235803, lng: 126.9951773},
    	  {lat: 37.5951321, lng: 127.018831},
    	  {lat: 37.6060556, lng: 127.0475391},
    	  {lat: 37.5884384, lng: 127.0295871},
    	  {lat: 37.5452026, lng: 127.0229979},
    	  {lat: 37.5449357, lng: 126.9730567},
    	  {lat: 37.4583407, lng: 127.0770854},
    	  {lat: 37.5636974, lng: 126.9549005},
    	  {lat: 37.6041679, lng: 127.0378888},
    	  {lat: 37.5431193, lng: 127.0416557},
    	  {lat: 37.5323755, lng: 127.0744813},
    	  {lat: 37.5963213, lng: 126.9925434},
    	  {lat: 37.5402662, lng: 126.9769712},
    	  {lat: 37.5357088, lng: 126.9515063},
    	  {lat: 37.5363505, lng: 126.9634641},
    	  {lat: 37.5200428, lng: 126.8841715},
    	  {lat: 37.5843841, lng: 127.0075168},
    	  {lat: 37.526241, lng: 126.8974286},
    	  {lat: 37.5358397, lng: 126.9549629},
    	  {lat: 37.517729, lng: 126.912671},
    	  {lat: 37.5887176, lng: 127.02229},
    	  {lat: 37.5868415, lng: 127.0232698},
    	  {lat: 37.5144685, lng: 126.890154},
    	  {lat: 37.5233387, lng: 126.8839348},
    	  {lat: 37.5127162, lng: 126.8935378},
    	  {lat: 37.5684665, lng: 127.0255502},
    	  {lat: 37.5222528, lng: 126.9030391},
    	  {lat: 37.5848587, lng: 127.0118859},
    	  {lat: 37.5250784, lng: 127.0921993},
    	  {lat: 37.517862, lng: 126.9038988},
    	  {lat: 37.5256032, lng: 126.9740052},
    	  {lat: 37.5389197, lng: 126.8929397},
    	  {lat: 37.5118742, lng: 126.8975741},
    	  {lat: 37.5284328, lng: 126.9273756},
    	  {lat: 37.536431, lng: 126.8962335},
    	  {lat: 37.5505366, lng: 127.0348589},
    	  {lat: 37.497466, lng: 127.1515613},
    	  {lat: 37.5541037, lng: 127.0621617},
    	  {lat: 37.535453, lng: 126.9646997},
    	  {lat: 37.5191265, lng: 126.9914013},
    	  {lat: 37.584442, lng: 126.9676999},
    	  {lat: 37.5727248, lng: 126.9746765},
    	  {lat: 37.5115, lng: 126.9415121},
    	  {lat: 37.4999089, lng: 126.973677},
    	  {lat: 37.5644435, lng: 127.0010471},
    	  {lat: 37.5714262, lng: 126.9613044},
    	  {lat: 37.5536081, lng: 126.8346846},
    	  {lat: 37.5215716, lng: 127.0002871},
    	  {lat: 37.5371288, lng: 126.9690036},
    	  {lat: 37.5305892, lng: 126.9858837},
    	  {lat: 37.4970578, lng: 126.9009238},
    	  {lat: 37.5924569, lng: 127.0182089},
    	  {lat: 37.5321655, lng: 126.97629},
    	  {lat: 37.5342588, lng: 126.9468781},
    	  {lat: 37.5208906, lng: 126.91267},
    	  {lat: 37.5171092, lng: 126.8959578},
    	  {lat: 37.5526054, lng: 126.9665242},
    	  {lat: 37.4790075, lng: 126.9959106},
    	  {lat: 37.5347504, lng: 126.9031696},
    	  {lat: 37.6664734, lng: 127.0723256}
      ]
    </script>

	<div id="jb-sidebar" style="width: 30%">
		<form class="form-inline" action="" method="post">
			<div class="form-group">
				<label class="sr-only" for="city"></label> <input type="text"
					id="city" name="city" class="form-control" size="10"
					list="listcity" />
				<datalist id="listcity">
					<option>서울시</option>
				</datalist>
			</div>

			<div class="form-group">
				<label class="sr-only" for="gu"></label> <input type="text" id="gu"
					name="gu" class="form-control" size="10" list="listgu" />
				<datalist id="listgu">
				<option>종로구</option>
				<option>중구</option>
				<option>용산구</option>
				<option>성동구</option>
				<option>광진구</option>
				<option>동대문구</option>
				<option>중랑구</option>
				<option>성북구</option>
				<option>강북구</option>
				<option>도봉구</option>
				<option>노원구</option>
				<option>은평구</option>
				<option>서대문구</option>
				<option>마포구</option>
				<option>양천구</option>
				<option>강서구</option>
				<option>구로구</option>
				<option>금천구</option>
				<option>영등포구</option>
				<option>동작구</option>
				<option>관악구</option>
				<option>서초구</option>
				<option>강남구</option>
				<option>송파구</option>
				<option>강동구</option>
				</datalist>
			</div>

			<div class="form-group">
				<label class="sr-only" for="search"></label> <input type="text"
					id="search" class="form-control" name="search" size="70"
					placeholder="상세 정보" style="width: 200px;" />
			</div>
			<div class="form-group">
				<button type="submit" id="btnSearch" class="btn btn-default">검색</button>
				<hr>
				<button type="submit" id="btnAccuse" class="btn btn-default">해당매물
					신고하기</button>
			</div>
		</form>
	</div>

	<div id="news">
		<div
			style="border: 1px solid black; float: left; width: 30%; height: 200px;">
			뉴스기사
			<hr>
			<table>
			<c:forEach items="${ Newslist }" var="i">
			<tr>
				<td>1{i}</td>
			</tr>
			</c:forEach>
			</table>
		</div>
	</div>

	<div style="clear: both;"></div>
	<div id="board">
		<div id="noticeboard"
			style="border: 1px solid black; width: 33%; height: 100px; display: inline-block;">
			<p>공지사항</p>
		</div>
		<div id="freeboard"
			style="border: 1px solid black; width: 33%; height: 100px; display: inline-block;">
			<p>자유게시판</p>
		</div>
		<div id="reviewboard"
			style="border: 1px solid black; width: 33%; height: 100px; display: inline-block;">
			<p>이용후기 게시판</p>
		</div>
	</div>

	<br>
	<br>

	<div id="servicecenter">
		<img src="/resources/img/servicecenter.png">
	</div>
</div>

<jsp:include page="/WEB-INF/views/layout/footer.jsp" />