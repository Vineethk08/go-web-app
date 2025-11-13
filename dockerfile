FROM golang:1.22 as base   

# Use the official Golang image as the base image, if error occurs check go.mod file for version


WORKDIR /app 
 # Set the working directory inside the container


 
COPY go.mod .  
#Copy go.mod file to the working directory similar like requriments.txt in python


RUN go mod download 
# Download the Go module dependencies just like pip install -r requirements.txt in python


COPY . . 
# Copy the entire project directory to the working directory inside the container


RUN go build -o main . 
# Build the Go application and output the binary as 'main'


# now making distorution image and its a final image stage

FROM gcr.io/distroless/base

COPY --from=base /app/main . 
# Copy the built binary from the base stage to the distroless image AND THIS COMMAND like in default


# Static content

COPY --from=base /app/static ./static
# Copy static files from the base stage to the distroless image

EXPOSE 8080
# Expose port 8080 for the application

CMD ["./main"]
# Set the command to run the application binary









