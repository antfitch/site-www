---
title: Tools
description: The tools that support the Dart language.
---

When you're ready to create an app, get the SDK and tools for your app
type. If you aren't sure which tools you need, **get the Flutter SDK.**

| App type                  | Get started instructions                                     | Tool information                                           |
|---------------------------|--------------------------------------------------------------|------------------------------------------------------------|
| Flutter (mobile and more) | [Install Flutter]({{site.flutter-docs}}/get-started/install) | [Flutter tools]({{site.flutter-docs}}/using-ide)           |
| Web app (non-Flutter)     | [Install the Dart SDK](/tools/sdk)                           | [General-purpose tools][] and [web tools](#web)            |
| Server or command line    | [Install the Dart SDK](/tools/sdk)                           | [General-purpose tools][] and [specialized tools](#server) |

{:.table .table-striped}

[General-purpose tools]: #general-purpose-tools

:::note
  The Flutter SDK includes the full Dart SDK.
:::

## General-purpose tools

The following tools support the Dart language on all platforms.

* [DartPad](#dartpad)
* [IDEs and editors](#editors)
* [Command-line tools](#cli)


### DartPad

<img src="/assets/img/dartpad-hello.png" alt="DartPad Hello World" width="200px" align="right" />

[DartPad](/tools/dartpad) is
a great, no-download-required way to learn Dart syntax
and to experiment with Dart language features.
It supports Dart's core libraries,
except for VM libraries such as `dart:io`.


<a id="ides-and-editors"></a>
### IDEs and editors {:#editors}

Dart plugins exist for these commonly used IDEs.

<ul class="cols2">
<li>
<img src="/assets/img/tools/android_studio.svg" class="list-image" alt="Android Studio logo">
<a href="/tools/jetbrains-plugin"><b>Android Studio</b></a>
</li>
<li>
<img src="/assets/img/tools/intellij-idea.svg" class="list-image" alt="IntelliJ logo">
<a href="/tools/jetbrains-plugin"><b>IntelliJ IDEA<br>
(and other JetBrains IDEs)</b></a>
</li>
<li>
<img src="/assets/img/tools/vscode.svg" class="list-image" alt="Visual Studio Code logo">
<a href="/tools/vs-code"><b>Visual Studio Code</b></a>
</li>
</ul>

The following Dart plugins are also available,
thanks to the Dart community.

<ul class="cols2">
<li>
<img src="/assets/img/tools/emacs.png" alt="Emacs logo" class="list-image">
<a href="https://github.com/nex3/dart-mode"><b>Emacs</b></a>
</li>
<li>
<img src="/assets/img/tools/vim.png" alt="Vim logo" class="list-image">
<a href="{{site.repo.dart.org}}/dart-vim-plugin"><b>Vim</b></a>
</li>
<li>
<img src="/assets/img/tools/eclipse-logo.png" alt="Eclipse logo" class="list-image">
<a href="https://github.com/dart4e/dart4e"><b>Eclipse</b></a>
</li>
</ul>

A [Language Server Protocol implementation][LSP] is also available for
[LSP-capable editors][] that don't have specific Dart extensions.

[LSP]: {{site.repo.dart.sdk}}/blob/main/pkg/analysis_server/tool/lsp_spec/README.md
[LSP-capable editors]: https://microsoft.github.io/language-server-protocol/implementors/tools/

### Command-line tools {:#cli}

The Dart SDK includes the following general-purpose `dart` tool:

[`dart`](/tools/dart-tool)
: A command-line interface (CLI) for creating, formatting, analyzing,
  testing, documenting, compiling, and running Dart code,
  as well as working with the [pub package manager](/tools/pub/packages).


### Debugging

[Dart DevTools](/tools/dart-devtools)
: A suite of debugging and performance tools.


## Tool for developing web apps {:#web}

The following tool supports developing web apps:

[`webdev`](/tools/webdev)
: A CLI to build and serve Dart web apps.

## Tools for developing command-line apps and servers {:#server}

The following tools support developing or running
command-line apps and servers:

[`dart run`](/tools/dart-run)
: Use the `dart run` command to run uncompiled Dart command-line apps
  and some kinds of snapshots.

[`dartaotruntime`](/tools/dartaotruntime)
: Use this Dart runtime to run AOT snapshots.
