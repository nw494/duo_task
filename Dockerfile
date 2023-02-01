# Use Python 3.6 or later as a base image
FROM python:3.7
# Copy contents into image
 WORKDIR /duotaskimage

 COPY . .
# Install pip dependencies from requirements
RUN pip install Flask
# Set YOUR_NAME environment variable
ENV YOUR_NAME="Nikki123"
# Expose the correct port
EXPOSE 5500
# Create an entrypoint
ENTRYPOINT [ "python3", "app.py" ]
