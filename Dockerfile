# BUILD PHASE
# tag this phase with name / as
# the point of this phase is to build the shit
FROM node:alpine as builder

WORKDIR /app

COPY package.json .
RUN npm install
# straight copy no need for all that fancy volume shit
COPY . . 
RUN npm run build

# all the stuff we want will be in 
# /app/build

# RUN PASE
FROM nginx
# copy from a different phase (builder)
# the incude the nginx default
COPY --from=builder /app/build /usr/share/nginx/html
