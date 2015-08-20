package org.kevoree.test;

import org.KevoreeModel;
import org.KevoreeView;
import org.junit.Test;
import org.kevoree.*;
import org.kevoree.meta.MetaDictionaryType;
import org.kevoree.meta.MetaModel;
import org.kevoree.meta.MetaNamespace;
import org.kevoree.meta.MetaTypeDefinition;
import org.kevoree.modeling.KCallback;
import org.kevoree.modeling.KObject;
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

    @Test
    public void loadModel() {
        final String str = "[\n" +
                "  {\"@class\":\"org.kevoree.Model\",\"@uuid\":1,\"namespaces\":[5]},\n" +
                "  {\"@class\":\"org.kevoree.Namespace\",\"@uuid\":5,\"name\":\"kevoree\",\"typeDefinitions\":[2],\"op_Model_namespaces\":[1]},\n" +
                "  {\"@class\":\"org.kevoree.ComponentType\",\"@uuid\":2,\"name\":\"Ticker\",\"outputs\":[10],\"metaData\":[6],\"deployUnits\":[3],\"op_Namespace_typeDefinitions\":[5],\"dictionaryType\":[7]},\n" +
                "  {\"@class\":\"org.kevoree.PortType\",\"@uuid\":10,\"name\":\"tick\",\"metaData\":[11],\"op_ComponentType_outputs\":[2]},\n" +
                "  {\"@class\":\"org.kevoree.Value\",\"@uuid\":6,\"name\":\"description\",\"value\":\"By default, the ticker will send the current timestamp in milliseconds once every 3000ms. This can be tweaked using the <strong>delay</strong> parameter. You can also change the output to a random number between [0, 100[ by setting the attribute <strong>random</strong> to <strong>true </strong>\",\"op_TypeDefinition_metaData\":[2]},\n" +
                "  {\"@class\":\"org.kevoree.DeployUnit\",\"@uuid\":3,\"name\":\"kevoree-comp-ticker\",\"version\":\"6.0.0-alpha\",\"metaData\":[4],\"op_TypeDefinition_deployUnits\":[2]},\n" +
                "  {\"@class\":\"org.kevoree.DictionaryType\",\"@uuid\":7,\"attributes\":[8,9],\"op_TypeDefinition_dictionaryType\":[2]},\n" +
                "  {\"@class\":\"org.kevoree.Value\",\"@uuid\":11,\"name\":\"schema\",\"value\":\"{\\\"type\\\":\\\"string\\\"}\",\"op_PortType_metaData\":[10]},\n" +
                "  {\"@class\":\"org.kevoree.Value\",\"@uuid\":4,\"name\":\"platform\",\"value\":\"javascript\",\"op_DeployUnit_metaData\":[3]},\n" +
                "  {\"@class\":\"org.kevoree.AttributeType\",\"@uuid\":8,\"datatype\":\"3\",\"defaultValue\":\"3000\",\"fragmentDependant\":\"false\",\"name\":\"delay\",\"optional\":\"true\",\"op_DictionaryType_attributes\":[7]},\n" +
                "  {\"@class\":\"org.kevoree.AttributeType\",\"@uuid\":9,\"datatype\":\"0\",\"defaultValue\":\"false\",\"fragmentDependant\":\"false\",\"name\":\"random\",\"optional\":\"true\",\"op_DictionaryType_attributes\":[7]}\n" +
                "]\n";
        final KevoreeModel model = new KevoreeModel(DataManagerBuilder.buildDefault());
        model.connect(new KCallback() {
            public void on(Object o) {
                final KevoreeView view = model.universe(0).time(1);
                view.json().load(str, new KCallback<Model>() {
                    public void on(Model model) {
                        System.out.println("Model loaded");
                        KevoreeView view = (KevoreeView) model.manager().model().universe(0).time(1);
                        view.json().save(model, new KCallback<String>() {
                            public void on(String s) {
                                System.out.println(s);
                            }
                        });
                    }
                });
            }
        });
    }

}
