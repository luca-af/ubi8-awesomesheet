FROM registry.access.redhat.com/ubi8/ubi-minimal
RUN microdnf install npm git python3
RUN git clone https://github.com/zombieFox/awesomeSheet.git && adduser pathfinder && chown -R pathfinder:pathfinder awesomeSheet
WORKDIR awesomeSheet
USER pathfinder
RUN npm install yarn grunt && ./node_modules/yarn/bin/yarn install && ./node_modules/grunt/bin/grunt build
EXPOSE 8000
WORKDIR build
CMD python3 -m http.server 8000 
