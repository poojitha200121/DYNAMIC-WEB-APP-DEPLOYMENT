<!DOCTYPE html>
<html>
<head>
    <title>DataFetch</title>
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #cadff2c3, #a4cae6);
            user-select: none;
        }
        .container {
            text-align: center;
        }
        .button {
            display: inline-block;
            padding: 20px 40px;
            margin: 20px;
            font-size: 20px;
            color: white;
            background: linear-gradient(to right, #0077b6, #005691);
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s ease;
        }
        .button:hover {
            background: linear-gradient(to right, #005691, #003d5c);
        }
        .button:active {
            background: linear-gradient(to right, #003d5c, #00264a);
        }
        #result {
            margin-top: 20px;
            font-size: 20px;
            color: black; /* Default text color */
        }
        #result.error {
            color: red; /* Red color for error message */
        }
    </style>
</head>
<body>
    <div class="container">
        <button class="button" onclick="fetchData('/my-servlet-project/hello')">Hello World</button>
        <button class="button" onclick="fetchData('/my-servlet-project/hello-v2')">Hello World Version 2</button>
        <div id="result"></div>
    </div>

    <script>
        async function fetchData(endpoint) {
            try {
                const response = await fetch(endpoint);
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                const data = await response.json();
                document.getElementById('result').innerText = data.content;
                document.getElementById('result').style.color = 'rgb(2 83 126)'; // Set text color to white
                document.getElementById('result').classList.remove('error'); // Remove error class if present
            } catch (error) {
                document.getElementById('result').innerText = 'Error fetching data';
                document.getElementById('result').style.color = 'red'; // Set text color to red for error message
                document.getElementById('result').classList.add('error'); // Apply error class for red color
            }
        }
    </script>
</body>
</html>
