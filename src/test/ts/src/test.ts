import { org } from 'kevoree-model';

var model: org.KevoreeModel = new org.KevoreeModel(org.kevoree.modeling.memory.manager.DataManagerBuilder.buildDefault());
var view: org.KevoreeView = model.universe(0).time(0);

model.connect(null);
var root: org.kevoree.Model = view.createModel();

view.setRoot(root, null);

var node = view.createNode();
node.setName("node0");

var jsNode = view.createNodeType();
jsNode.setName('JavascriptNode');
jsNode.setVersion('6.0.0-alpha');
var meta = view.createValue();
meta.setName('fooMeta');
meta.setValue('barValue');
jsNode.addMetaData(meta);



console.log(node.toJSON());
root.addNodes(node);
