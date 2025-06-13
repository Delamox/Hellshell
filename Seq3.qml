import QtQuick

SeqNode {
    a: "u"
    r: 0
    SeqNode {
        a: "r"
        r: 90
        SeqNode {
            a: "d"
            r: 180
            SeqNode {
                a: "d"
                r: 180
                SeqNode {
                    a: "d"
                    r: 180
                }
            }
        }
    }
}
