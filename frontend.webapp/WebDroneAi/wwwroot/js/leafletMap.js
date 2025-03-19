window.initializeLeafletMap = (longti, lat) => {
    var map = L.map('map').setView([lat,longti], 20);

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: '© OpenStreetMap contributors'
    }).addTo(map);
    var latlong = [lat, longti]
    L.polygon([
        latlong
    ], {
        weight:5,
        lineCap: 'square',
        lineJoin:'bevel'
    }).addTo(map);

};