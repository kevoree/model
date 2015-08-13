with version "6.0.0-SNAPSHOT"
with kmfVersion "4.19.1-SNAPSHOT"

class org.kevoree.NamedElement {
// id
    att name: String
}

class org.kevoree.Model {
    ref* nodes:      org.kevoree.Node
    ref* groups:     org.kevoree.Group
    ref* channels:   org.kevoree.Channel
    ref* namespaces: org.kevoree.Namespace
}

class org.kevoree.Instance extends org.kevoree.NamedElement {
    att started : Bool

    ref dictionary:     org.kevoree.Dictionary
    ref typeDefinition: org.kevoree.TypeDefinition

    ref* metaData:           org.kevoree.Value
    ref* fragmentDictionary: org.kevoree.FragmentDictionary
}

class org.kevoree.Node extends org.kevoree.Instance {
    ref* host:       org.kevoree.Node  with opposite "children"
    ref* groups:     org.kevoree.Group with opposite "nodes"
    ref* children:   org.kevoree.Node  with opposite "host"
    ref* networks:   org.kevoree.NetworkInfo
    ref* components: org.kevoree.Component
}

class org.kevoree.Component extends org.kevoree.Instance {
    ref* inputs:  org.kevoree.Port
    ref* outputs: org.kevoree.Port
}

class org.kevoree.Group extends org.kevoree.Instance {
    ref* nodes: org.kevoree.Node with opposite "groups"
}

class org.kevoree.Channel extends org.kevoree.Instance {
    ref* ports: org.kevoree.Port with opposite "channels"
}

class org.kevoree.Namespace extends org.kevoree.NamedElement {
    ref* typeDefinitions: org.kevoree.TypeDefinition
}

class org.kevoree.TypeDefinition extends org.kevoree.NamedElement {
// id
    att version:  String
    att abstract: Bool

    ref dictionaryType: org.kevoree.DictionaryType

    ref* metaData:    org.kevoree.Value
    ref* deployUnits: org.kevoree.DeployUnit
}

class org.kevoree.PortType extends org.kevoree.NamedElement {}

class org.kevoree.ComponentType extends org.kevoree.TypeDefinition {
    ref* inputs:  org.kevoree.PortType
    ref* outputs: org.kevoree.PortType
}

class org.kevoree.GroupType extends org.kevoree.TypeDefinition {}

class org.kevoree.NodeType extends org.kevoree.TypeDefinition {}

class org.kevoree.ChannelType extends org.kevoree.TypeDefinition {}

class org.kevoree.Port extends org.kevoree.NamedElement {
    ref* channels: org.kevoree.Channel with opposite "ports"
}

class org.kevoree.Dictionary {
    ref* values : org.kevoree.Value
}

class org.kevoree.FragmentDictionary extends org.kevoree.Dictionary, org.kevoree.NamedElement {}

class org.kevoree.Value extends org.kevoree.NamedElement {
    att value: String
}

class org.kevoree.DictionaryType {
    ref* attributes: org.kevoree.DictionaryAttribute
}

enum org.kevoree.DataType {
    list, byte, short, bool, int, button, decimal, string
}

class org.kevoree.DictionaryAttribute extends org.kevoree.TypedElement {
    att optional:          Bool
    att datatype:          org.kevoree.DataType
    att defaultValue:      String
    att fragmentDependant: Bool
}

class org.kevoree.TypedElement extends org.kevoree.NamedElement {
    ref* genericTypes: org.kevoree.TypedElement
}

class org.kevoree.DeployUnit extends org.kevoree.NamedElement {
// id
    att version: String
// id
    att hashcode: String

    ref metaData: org.kevoree.Value

    ref* requiredLibs: org.kevoree.DeployUnit
}

class org.kevoree.NetworkInfo extends org.kevoree.NamedElement {
    ref* values: org.kevoree.Value
}
