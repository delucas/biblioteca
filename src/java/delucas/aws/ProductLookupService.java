package delucas.aws;

import org.codehaus.groovy.grails.commons.ApplicationHolder;
import org.codehaus.groovy.grails.commons.GrailsApplication;

import com.ECS.client.jax.AWSECommerceService;
import com.ECS.client.jax.AWSECommerceServicePortType;
import com.ECS.client.jax.Item;
import com.ECS.client.jax.ItemLookup;
import com.ECS.client.jax.ItemLookupRequest;
import com.ECS.client.jax.ItemLookupResponse;
import com.ECS.client.jax.Items;

import delucas.Libro;

public class ProductLookupService {

	private String awsAccessKeyID;
	private String awsSecretKey;

	public ProductLookupService() {
		GrailsApplication application = ApplicationHolder.getApplication();
		awsAccessKeyID = application.getFlatConfig().get("grails.awsAccessKeyID").toString();
		awsSecretKey = application.getFlatConfig().get("grails.awsSecretKey").toString();
	}
	
	public Libro buscarPorISBN(String isbn) {

		Libro retorno = new Libro();
		retorno.setIsbn(isbn);

		try {

			AWSECommerceService service = new AWSECommerceService();
			service.setHandlerResolver(new AwsHandlerResolver(awsSecretKey)); // important
			AWSECommerceServicePortType port = service
					.getAWSECommerceServicePort();

			ItemLookupRequest itemLookup = new ItemLookupRequest();
			itemLookup.setIdType("ISBN");
			itemLookup.setSearchIndex("Books");
			itemLookup.getItemId().add(isbn);

			ItemLookup lookup = new ItemLookup();
			lookup.setAWSAccessKeyId(awsAccessKeyID); // important
			lookup.getRequest().add(itemLookup);

			ItemLookupResponse response = port.itemLookup(lookup);

			for (Items items : response.getItems()) {
				for (Item item : items.getItem()) {

					// procesamos los autores
					String autores = item.getItemAttributes().getAuthor()
							.toString();
					autores = autores.replaceAll("\\[", "");
					autores = autores.replaceAll("\\]", "");

					// creamos el Libro
					retorno.setTitulo(item.getItemAttributes().getTitle());
					retorno.setAutores(autores);
					retorno.setEditorial(item.getItemAttributes()
							.getManufacturer());
					retorno.setAmazonURL(item.getDetailPageURL());

					return retorno;

				}
			}
		} catch (Exception e) {
			return null;
		}

		return retorno;

	}

	public void completarReview(Libro libro) {
		try {

			AWSECommerceService service = new AWSECommerceService();
			service.setHandlerResolver(new AwsHandlerResolver(awsSecretKey)); // important
			AWSECommerceServicePortType port = service
					.getAWSECommerceServicePort();

			ItemLookupRequest itemLookup = new ItemLookupRequest();
			itemLookup.setIdType("ISBN");
			itemLookup.setSearchIndex("Books");
			itemLookup.getItemId().add(libro.getIsbn());

			itemLookup.getResponseGroup().add("EditorialReview");

			ItemLookup lookup = new ItemLookup();
			lookup.setAWSAccessKeyId(awsAccessKeyID); // important
			lookup.getRequest().add(itemLookup);

			ItemLookupResponse response = port.itemLookup(lookup);

			for (Items items : response.getItems()) {
				for (Item item : items.getItem()) {
					libro.setReview(item.getEditorialReviews()
							.getEditorialReview().get(0).getContent());
					return;
				}
			}
		} catch (Exception e) {

		}
	}

	public void completarImageURL(Libro libro) {
		try {

			AWSECommerceService service = new AWSECommerceService();
			service.setHandlerResolver(new AwsHandlerResolver(awsSecretKey)); // important
			AWSECommerceServicePortType port = service
					.getAWSECommerceServicePort();

			ItemLookupRequest itemLookup = new ItemLookupRequest();
			itemLookup.setIdType("ISBN");
			itemLookup.setSearchIndex("Books");
			itemLookup.getItemId().add(libro.getIsbn());

			itemLookup.getResponseGroup().add("Images");

			ItemLookup lookup = new ItemLookup();
			lookup.setAWSAccessKeyId(awsAccessKeyID); // important
			lookup.getRequest().add(itemLookup);

			ItemLookupResponse response = port.itemLookup(lookup);

			for (Items items : response.getItems()) {
				for (Item item : items.getItem()) {
					libro.setImageURL(item.getMediumImage().getURL());
					return;
				}
			}
		} catch (Exception e) {

		}
	}

}
