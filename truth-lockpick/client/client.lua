<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lockpicking Minigame</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div id="settings">
        <label>Circles: <span id="circle-count-display">5</span></label>
        <label>Speed: <span id="circle-speed-display">1</span></label>
    </div>

    <canvas id="gameCanvas"></canvas>

    <script>
        const canvas = document.getElementById('gameCanvas');
        const ctx = canvas.getContext('2d');
        const settings = document.getElementById('settings');

        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;

        let circles = [];
        let score = 0;
        let isGameRunning = false;

        function createCircle(x, y, index) {
            const circle = document.createElement('div');
            circle.className = 'circle';
            circle.style.left = `${x}px`;
            circle.style.top = `${y}px`;

            const text = document.createElement('div');
            text.className = 'circle-text';
            text.innerText = index + 1;

            circle.appendChild(text);
            document.body.appendChild(circle);

            circle.addEventListener('click', () => {
                score++;
                document.body.removeChild(circle);
                circles = circles.filter(c => c !== circle);

                if (circles.length === 0) {
                    alert(`You won! Score: ${score}`);
                    isGameRunning = false;
                    resetGame();
                }
            });

            circles.push(circle);
        }

        function spawnCircles(count, speed) {
            for (let i = 0; i < count; i++) {
                const x = Math.random() * (canvas.width - 100);
                const y = Math.random() * (canvas.height - 100);
                setTimeout(() => {
                    if (isGameRunning) createCircle(x, y, i);
                }, i * speed);
            }
        }

        function resetGame() {
            circles.forEach(circle => document.body.removeChild(circle));
            circles = [];
            score = 0;
        }

        window.addEventListener('message', (event) => {
            const { action, count, speed } = event.data;
            if (action === 'startGame') {
                if (isGameRunning) return;

                isGameRunning = true;
                resetGame();
                document.getElementById('circle-count-display').innerText = count;
                document.getElementById('circle-speed-display').innerText = speed;

                const speedInMs = 2000 - (speed * 200); // Adjust speed dynamically
                spawnCircles(count, speedInMs);
            }
        });

        window.addEventListener('resize', () => {
            canvas.width = window.innerWidth;
            canvas.height = window.innerHeight;
        });

        // Handle TriggerEvent("startLockpickingMinigame", count, speed)
        window.addEventListener('message', (event) => {
            const { action, count, speed } = event.data;
            if (action === 'startGame') {
                isGameRunning = true;
                resetGame();
                const speedInMs = 2000 - (speed * 200); // Adjust speed dynamically
                spawnCircles(count, speedInMs);
            }
        });

        window.startLockpickingMinigame = (count, speed) => {
            window.postMessage({ action: 'startGame', count, speed });
        };

    </script>
</body>
</html>