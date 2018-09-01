if [ -d "notebooks" ]; then
	zip -r notebooks_$(date +%Y-%m-%d_%H-%M-%S).zip notebooks
fi
if [ -d "notebook" ]; then
	zip -r notebook_$(date +%Y-%m-%d_%H-%M-%S).zip notebook
fi
