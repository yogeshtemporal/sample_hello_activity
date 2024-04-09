#FROM openjdk:18 as build
FROM golang:1.19 as build
MAINTAINER yogesh.chouk@temporal.io
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/yogeshtemporal/sample_hello_activity.git

ARG API_KEY
ARG NAMESPACE
RUN mkdir -p /yogesh-gradle-app/app/src/main/resources

# Copy the properties file to the container
COPY app/src/main/resources/* /yogesh-gradle-app/app/src/main/resources/
RUN sed -i "s/temporal_namespace=.*/temporal_namespace=$NAMESPACE/g" /yogesh-gradle-app/app/src/main/resources/temporal.properties

#RUN sed -i "s/temporal_target_endpoint=.*/temporal_target_endpoint=$NAMESPACE/g" /yogesh-gradle-app/app/src/main/resources/temporal.properties
RUN sed -i "s/temporal_target_endpoint=.*/temporal_target_endpoint=$NAMESPACE.tmprl.cloud:7233/g" /yogesh-gradle-app/app/src/main/resources/temporal.properties

RUN git clone https://github.com/temporalio/tcld.git
RUN cd tcld && \
    make && \
    cp tcld /usr/local/bin/tcld

WORKDIR /yogesh-gradle-app/app/src/main/resources

RUN echo "y" | tcld generate-certificates certificate-authority-certificate \
  --org myco \
  -d 1y \
  --ca-cert ca.crt \
  --ca-key ca.key

RUN echo "y" | tcld generate-certificates end-entity-certificate \
  --org myco \
  --ca-cert ca.crt \
  --ca-key ca.key \
  --cert client-and-worker.crt \
  --key client-and-worker.key


#ARG API_KEY

#RUN tcld --api-key $API_KEY  n ca a -n 'yogesh.a2dd6' -f ca.crt
#RUN tcld --api-key $API_KEY n create --region 'us-west-2' -cf ca.crt -n $NAMESPACE
RUN tcld --api-key $API_KEY namespace accepted-client-ca add \
  --namespace $NAMESPACE \
  --ca-certificate-file ca.crt

FROM openjdk:18
 
#COPY app/src/main/resources/* /yogesh-gradle-app/app/src/main/resources/
COPY --from=build /yogesh-gradle-app/app/src/main/resources /yogesh-gradle-app/app/src/main/resources

COPY app/build/libs/app-all.jar app-all.jar

ENTRYPOINT ["java","-jar","app-all.jar"]%     
EXPOSE 8078                                                                    
