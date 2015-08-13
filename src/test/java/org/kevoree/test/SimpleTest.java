package org.kevoree.test;

import org.KevoreeModel;
import org.junit.Test;
import org.kevoree.Model;
import org.kevoree.Node;
import org.kevoree.modeling.memory.manager.DataManagerBuilder;

/**
 * Created by duke on 14/01/15.
 */
public class SimpleTest {

    @Test
    public void helloTest() {
        KevoreeModel model = new KevoreeModel(DataManagerBuilder.buildDefault());
        model.connect(null);
        Model root = model.universe(0).time(0).createModel();
        model.universe(0).time(0).setRoot(root, null);

        Node node = model.universe(0).time(0).createNode();
        node.setName("node0");

        root.addNodes(node);

        model.save(null);


    }

}
