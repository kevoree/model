package org.kevoree.test;

import org.KevoreeModel;
import org.junit.Test;
import org.kevoree.Node;
import org.kevoree.Model;
import org.kevoree.modeling.KCallback;

/**
 * Created by duke on 14/01/15.
 */
public class SimpleTest {

    @Test
    public void helloTest() {


        KevoreeModel model = new KevoreeModel();
        model.connect(new KCallback() {
            @Override
            public void on(Object o) {

            }
        });
        Model root = model.universe(0).time(0).createModel();
        model.universe(0).time(0).setRoot(root, new KCallback() {
            @Override
            public void on(Object o) {

            }
        });

        Node node = model.universe(0).time(0).createNode();
        node.setName("node0");
        root.addNodes(node);

        model.save(new KCallback() {
            @Override
            public void on(Object o) {

            }
        });

    }

}
