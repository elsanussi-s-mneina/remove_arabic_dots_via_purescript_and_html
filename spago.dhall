{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "remove-arabic-dots"
, dependencies =
  [ "console", "effect", "lists", "psci-support", "spec", "strings" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
