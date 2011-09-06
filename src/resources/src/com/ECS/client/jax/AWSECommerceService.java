
package com.ECS.client.jax;

import java.net.MalformedURLException;
import java.net.URL;
import java.util.logging.Logger;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import javax.xml.ws.WebEndpoint;
import javax.xml.ws.WebServiceClient;
import javax.xml.ws.WebServiceFeature;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.1.6 in JDK 6
 * Generated source version: 2.1
 * 
 */
@WebServiceClient(name = "AWSECommerceService", targetNamespace = "http://webservices.amazon.com/AWSECommerceService/2011-04-01", wsdlLocation = "file:/home/lucas/workspace-grails/biblioteca/src/resources/AWSECommerceService.wsdl")
public class AWSECommerceService
    extends Service
{

    private final static URL AWSECOMMERCESERVICE_WSDL_LOCATION;
    private final static Logger logger = Logger.getLogger(com.ECS.client.jax.AWSECommerceService.class.getName());

    static {
        URL url = null;
        try {
            URL baseUrl;
            baseUrl = com.ECS.client.jax.AWSECommerceService.class.getResource(".");
            url = new URL(baseUrl, "file:/home/lucas/workspace-grails/biblioteca/src/resources/AWSECommerceService.wsdl");
        } catch (MalformedURLException e) {
            logger.warning("Failed to create URL for the wsdl Location: 'file:/home/lucas/workspace-grails/biblioteca/src/resources/AWSECommerceService.wsdl', retrying as a local file");
            logger.warning(e.getMessage());
        }
        AWSECOMMERCESERVICE_WSDL_LOCATION = url;
    }

    public AWSECommerceService(URL wsdlLocation, QName serviceName) {
        super(wsdlLocation, serviceName);
    }

    public AWSECommerceService() {
        super(AWSECOMMERCESERVICE_WSDL_LOCATION, new QName("http://webservices.amazon.com/AWSECommerceService/2011-04-01", "AWSECommerceService"));
    }

    /**
     * 
     * @return
     *     returns AWSECommerceServicePortType
     */
    @WebEndpoint(name = "AWSECommerceServicePort")
    public AWSECommerceServicePortType getAWSECommerceServicePort() {
        return super.getPort(new QName("http://webservices.amazon.com/AWSECommerceService/2011-04-01", "AWSECommerceServicePort"), AWSECommerceServicePortType.class);
    }

    /**
     * 
     * @param features
     *     A list of {@link javax.xml.ws.WebServiceFeature} to configure on the proxy.  Supported features not in the <code>features</code> parameter will have their default values.
     * @return
     *     returns AWSECommerceServicePortType
     */
    @WebEndpoint(name = "AWSECommerceServicePort")
    public AWSECommerceServicePortType getAWSECommerceServicePort(WebServiceFeature... features) {
        return super.getPort(new QName("http://webservices.amazon.com/AWSECommerceService/2011-04-01", "AWSECommerceServicePort"), AWSECommerceServicePortType.class, features);
    }

}
