<?xml version="1.0" encoding="UTF-8"?>
<schema xmlns="http://purl.oclc.org/dsdl/schematron">
    <ns uri="http://ruleml.org/spec" prefix="ruleml"/>
    <pattern id="PsoaExpressionConstraint1">
        <rule context="ruleml:Expr">
            <report test="ruleml:oid">Constraint violation: A psoa expression cannot have an OID.</report>
        </rule>
    </pattern>
    <pattern id="PsoaExpressionConstraint2">
        <rule context="ruleml:Expr">
            <report test="ruleml:slot">Constraint violation: A psoa expression cannot have any independent slots.</report>
        </rule>
    </pattern>
    <pattern id="PsoaExpressionConstraint3">
        <rule context="ruleml:Expr">
            <report test="ruleml:tup">Constraint violation: A psoa expression cannot have any independent tuples.</report>
        </rule>
    </pattern>
</schema>
