document.getElementById('search-input').addEventListener('input', function() {
    const filter = this.value.toLowerCase();
    const projects = document.querySelectorAll('.project');

    projects.forEach(function(project) {
        const projectName = project.querySelector('.name').textContent.toLowerCase();
        if (projectName.includes(filter)) {
            project.style.display = '';
        } else {
            project.style.display = 'none';
        }
    });
});

document.querySelectorAll('.delete-button').forEach(button => {
    button.addEventListener('click', function() {
        const project = this.closest('.project');
        project.remove();
    });
});
