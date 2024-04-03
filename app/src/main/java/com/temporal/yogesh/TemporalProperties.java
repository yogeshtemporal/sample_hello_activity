//package io.temporal.samples.hello;
package com.temporal.yogesh;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class TemporalProperties {

  public String temporal_key_location;
  public String temporal_cert_location;
  public String temporal_namespace;
  public String temporal_target_endpoint;

  public TemporalProperties() {
    this.read();
  }

  private void read() {
/*
    try (InputStream input = new FileInputStream("/Users/yogeshchouk/new_Project/samples-java/new_Java/temporal/yogesh-gradle-app/app/src/main/resources/temporal.properties")) { */
    try (InputStream input = new FileInputStream("/yogesh-gradle-app/app/src/main/resources/temporal.properties")) {
    
      Properties prop = new Properties();

      // load a properties file
      prop.load(input);

      this.temporal_key_location = prop.getProperty("temporal_key_location");
      this.temporal_cert_location = prop.getProperty("temporal_cert_location");
      this.temporal_namespace = prop.getProperty("temporal_namespace");
      this.temporal_target_endpoint = prop.getProperty("temporal_target_endpoint");

    } catch (IOException ex) {

      throw new RuntimeException(ex);
    }
  }
}

