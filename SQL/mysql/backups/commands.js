// ==========================
// Parsing de argumentos
// ==========================
var args = (sys.argv || []).slice(1); // remove nome do script

if (args[0] === "--") {
    args.shift();
}

if (args.length < 2) {
    throw new Error("Uso: <outputDir> <version>");
}

var outputDir = args[0];
var targetVersion = args[1];

print(`OutputDir: ${outputDir}`);
print(`Version: ${targetVersion}`);

// ==========================
// Schemas alvo
// ==========================
var schemas = [
    "SIPV3",
    "SEIV3",
    "ANSIBLE_DB"
];

// ==========================
// Compatibilidade inteligente
// ==========================
var compatibilityOptions = [
    "strip_definers",
    "strip_restricted_grants",
    "force_innodb"
];

// ajuste baseado na versão alvo
if (targetVersion.startsWith("8")) {
    compatibilityOptions.push("create_invisible_pks");
} else {
    compatibilityOptions.push("ignore_missing_pks");
}

// ==========================
// Execução do dump
// ==========================
var dumpPath = `/backup/${outputDir}`;

print(`Iniciando dump em: ${dumpPath}`);

util.dumpSchemas(schemas, dumpPath, {
    threads: 4,
    //consistency: "consistent",
    compatibility: compatibilityOptions
});

print("Dump finalizado com sucesso.");
