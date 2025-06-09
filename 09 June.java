package connection;

import java.util.ArrayList;
import java.util.List;

import org.bson.Document;

import com.mongodb.client.FindIterable;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Updates;

public class MongoDB {
    public static void main(String[] args) {
        MongoClient mongoClient = MongoClients.create("mongodb://localhost:27017");
        MongoDatabase database = mongoClient.getDatabase("myDb");
        MongoCollection<Document> collection = database.getCollection("sampleCollection");

        // Insert one document
        Document document = new Document("First_Name", "Mahesh")
            .append("Last_Name", "Parashar")
            .append("Date_Of_Birth", "1990-08-21")
            .append("e_mail", "mahesh_parashar.123@gmail.com")
            .append("phone", "9034343345");

        collection.insertOne(document);

        // Insert many documents
        List<Document> documents = new ArrayList<>();
        documents.add(new Document("First_Name", "Radhika")
            .append("Last_Name", "Sharma")
            .append("Date_Of_Birth", "1995-09-26")
            .append("e_mail", "radhika_sharma.123@gmail.com")
            .append("phone", "9000012345"));

        documents.add(new Document("First_Name", "Rachel")
            .append("Last_Name", "Christopher")
            .append("Date_Of_Birth", "1990-02-16")
            .append("e_mail", "Rachel_Christopher.123@gmail.com")
            .append("phone", "9000054321"));

        documents.add(new Document("First_Name", "Fathima")
            .append("Last_Name", "Sheik")
            .append("Date_Of_Birth", "1990-02-16")
            .append("e_mail", "Fathima_Sheik.123@gmail.com")
            .append("phone", "9000054321"));

        collection.insertMany(documents);

        System.out.println("Documents inserted.");

        // Update email of Mahesh
        collection.updateOne(
            Filters.eq("First_Name", "Mahesh"),
            Updates.set("e_mail", "maheshprasha@gmail.com")
        );

        System.out.println("Document updated.");

        // Find and print updated document
        FindIterable<Document> updatedDocs = collection.find(Filters.eq("First_Name", "Mahesh"));
        for (Document doc : updatedDocs) {
            System.out.println(doc.toJson());
        }

        // Close the connection
        mongoClient.close();
    }
}
