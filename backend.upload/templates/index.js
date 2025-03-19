function showNotification(message, isError = false) {
            const notification = document.getElementById('notification');
            notification.innerText = message;
            notification.className = 'notification show' + (isError ? ' error' : '');
            setTimeout(() => {
                notification.className = 'notification';
            }, 3000); // Hide after 3 seconds
        }

        document.getElementById('uploadButton').onclick = async () => {
            const fileInput = document.getElementById('fileInput');
            const folderSelect = document.getElementById('folderSelect');
            const selectedFolder = folderSelect.value;
            const files = fileInput.files;
            const chunkSize = 1024 * 1024; // 1MB chunks
            let totalChunks = 0;
            let uploadedChunks = 0;

            // Check if files are selected
            if (files.length === 0) {
                showNotification("No files selected.", true);
                return;
            }

            // Check if a folder is selected
            if (!selectedFolder) {
                showNotification("Please select a folder.", true);
                return;
            }

            // Calculate total chunks for all files
            for (const file of files) {
                totalChunks += Math.ceil(file.size / chunkSize);
            }

            console.log(`Total chunks to upload: ${totalChunks}`);

            for (const file of files) {
                const fileChunks = Math.ceil(file.size / chunkSize);
                for (let i = 0; i < fileChunks; i++) {
                    const start = i * chunkSize;
                    const end = Math.min(start + chunkSize, file.size);
                    const chunk = file.slice(start, end);

                    const formData = new FormData();
                    formData.append('file', chunk, file.name); // Ensure the original filename is sent
                    formData.append('chunkIndex', i);
                    formData.append('totalChunks', fileChunks); // Send the correct total chunks
                    formData.append('originalFilename', file.name); // Send the original filename
                    formData.append('folder', selectedFolder); // Send the selected folder

                    console.log(`Uploading chunk ${i + 1}/${fileChunks} for ${file.name}`);

                    try {
                        await fetch('/upload/', {
                            method: 'POST',
                            body: formData,
                        });
                        uploadedChunks++;
                        const percentage = Math.round((uploadedChunks / totalChunks) * 100);
                        document.getElementById('progressBar').style.width = percentage + '%';
                        document.getElementById('progress').innerText = `Uploaded ${percentage}%`;
                    } catch (error) {
                        showNotification(`Error uploading ${file.name} chunk ${i + 1}. Retrying...`, true);
                        i--; // Retry the same chunk
                    }
                }
                showNotification(`Uploaded ${file.name} in ${fileChunks} chunks.`);
            }

            showNotification('All uploads complete!');
            loadGallery(); // Load the gallery after upload
        };

        document.getElementById('refreshButton').onclick = () => {
            window.location.reload();
        };

        async function loadGallery() {
            const response = await fetch('/files');
            const data = await response.json();
            const gallery = document.getElementById('gallery');
            gallery.innerHTML = ''; // Clear existing images

            data.files.forEach(file => {
                const img = document.createElement('img');
                img.src = `../uploads/${file}`;
                img.alt = file;
                gallery.appendChild(img);
            });
        }