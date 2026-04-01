async function loadStatus() {
    const res = await fetch("http://localhost:5000/health/status");
    const data = await res.json();

    console.log(data);
}

setInterval(loadStatus, 5000);