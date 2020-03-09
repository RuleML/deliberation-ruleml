<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron">
    <pattern id="PsoaExpressionConstraint1">
        <rule context="Expr">
            <report test="oid">Constraint violation: A psoa expression cannot have an OID.</report>
        </rule>
    </pattern>
    <pattern id="PsoaExpressionConstraint2">
        <rule context="Expr">
            <report test="slot">Constraint violation: A psoa expression cannot have any independent slots.</report>
        </rule>
    </pattern>
    <pattern id="PsoaExpressionConstraint3">
        <rule context="Expr">
            <report test="tup">Constraint violation: A psoa expression cannot have any independent tuples.</report>
        </rule>
    </pattern>
</schema>
