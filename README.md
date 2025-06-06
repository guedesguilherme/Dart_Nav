## Explicação Geral do Código

Este projeto é um **Catálogo de Produtos** em Flutter, organizado da seguinte forma:

- **`lib/main.dart`**  
  - Ponto de entrada do app (`void main()`)  
  - Configura `MaterialApp` com rotas nomeadas (`/`, `/detail`, `/add`)  
  - Define `onGenerateRoute` para extrair parâmetros de tipo `Product`  

- **`lib/models/product.dart`**  
  - Classe simples `Product` com `name` e `price`  

- **`lib/screens/home_screen.dart`**  
  - Tela inicial (`StatefulWidget`)  
  - Mantém lista `_products` no estado  
  - Exibe `ListView.builder` de itens  
  - FAB “+” abre `AddProductScreen` e aguarda resultado  

- **`lib/screens/product_detail_screen.dart`**  
  - Tela de detalhes (`StatelessWidget`)  
  - Recebe `Product` via construtor ou `ModalRoute.arguments`  
  - Exibe nome e preço formatado  

- **`lib/screens/add_product_screen.dart`**  
  - Formulário (`StatefulWidget`) com `TextFormField` para nome e preço  
  - Validações mínimas (`validator`)  
  - Ao salvar, retorna o novo `Product` via `Navigator.pop(context, newProduct)`  

---

## Como Rodar no VS Code

1. **Pré-requisitos**  
   - Flutter SDK instalado e variável `PATH` configurada  
   - VS Code com as extensões **Flutter** e **Dart** instaladas  
   - Emulador Android/iOS iniciado ou dispositivo físico conectado  

2. **Abrir o Projeto**  
   - `File → Open Folder…` → selecione a raiz do projeto (onde está o `pubspec.yaml`)  

3. **Carregar Dependências**  
   - No terminal do VS Code:  
     ```bash
     flutter pub get
     ```

4. **Executar o App**  
   - Selecione o dispositivo (ícone de dispositivo na barra inferior)  
   - Pressione **F5** ou clique em **Run → Start Debugging**  
   - O VS Code compilará, instalará e rodará o app no emulador/dispositivo  

5. **Hot Reload / Hot Restart**  
   - **Hot Reload**: pressione **r** no terminal ou clique no raio no painel de Debug  
   - **Hot Restart**: pressione **Shift + R** no terminal de depuração  

---

## Como Rodar no Android Studio

1. **Pré-requisitos**  
   - Flutter SDK e Dart SDK instalados  
   - Android Studio com plugin **Flutter** e **Dart**  
   - AVD (Android Virtual Device) configurado ou dispositivo físico  

2. **Importar o Projeto**  
   - **File → Open** → selecione a pasta do projeto  
   - Aguarde o Android Studio indexar o código e baixar pacotes  

3. **Configurar Dispositivo**  
   - Inicie um **AVD** em **Tools → AVD Manager**, ou conecte um dispositivo USB com **USB Debugging** ativado  

4. **Executar o App**  
   - Selecione o dispositivo alvo no canto superior direito  
   - Clique no **▶️ Run 'main.dart'** ou pressione **Shift + F10**  
   - O Android Studio compilará, instalará e iniciará o app  

5. **Hot Reload / Hot Restart**  
   - **Hot Reload**: clique no botão de raio na barra de ferramentas  
   - **Hot Restart**: clique no botão de “⟳” (Restart)  

---

## Dicas Finais

- Mantenha seu SDK e plugins sempre atualizados para evitar incompatibilidades.  
- Use o **Flutter DevTools** (integração no VS Code/Android Studio) para inspecionar widgets e performance.  
- Se surgir erro de versão, rode `flutter doctor` no terminal para verificar e seguir as recomendações.  


## Explicação Geral Dart

## 1. O que é o Flutter? Como funciona?

Flutter é um SDK de UI multiplataforma criado pelo Google que permite desenvolver apps nativos para Android, iOS, web e desktop a partir de um único código em Dart.
Ele funciona renderizando seus próprios componentes (widgets) em uma engine C++ de baixo nível, garantindo alta performance e consistência visual em todas as plataformas.

```dart
// main.dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

// MyApp é o widget raiz
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App Flutter',
      home: Scaffold(
        appBar: AppBar(title: const Text('Flutter Demo')),
        body: const Center(child: Text('Olá, Flutter!')),
      ),
    );
  }
}
```

---

## 2. Estrutura de diretórios e principais arquivos

```
meu_app/
├── android/           # código nativo Android
├── ios/               # código nativo iOS
├── lib/               # código Dart do aplicativo
│   ├── main.dart      # ponto de entrada
│   ├── models/        # classes de dados
│   ├── screens/       # telas/widgets de tela
│   ├── widgets/       # widgets reutilizáveis
│   └── providers/     # lógica de estado global
├── test/              # testes automatizados
└── pubspec.yaml       # dependências e assets
```

---

## 3. Container de componentes

O **Container** é um widget multifuncional para layout, espaçamento, borda, cor de fundo, etc.

```dart
Container(
  width: 200,
  height: 100,
  padding: const EdgeInsets.all(16),
  margin: const EdgeInsets.symmetric(vertical: 8),
  decoration: BoxDecoration(
    color: Colors.blueAccent,
    borderRadius: BorderRadius.circular(12),
  ),
  child: const Center(child: Text('Conteúdo')),
);
```

---

## 4. Componente de texto e captura de texto

### 4.1 Exibir texto

```dart
const Text(
  'Olá, usuário!',
  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
);
```

### 4.2 Capturar texto do usuário

```dart
final _controller = TextEditingController();

TextField(
  controller: _controller,
  decoration: const InputDecoration(labelText: 'Digite algo'),
);

// Para ler o valor:
// String texto = _controller.text;
```

---

## 5. Estilização de componente

### 5.1 Imagem

```dart
Image.network(
  'https://example.com/imagem.png',
  width: 150,
  height: 150,
  fit: BoxFit.cover,
);
```

### 5.2 Texto

```dart
Text(
  'Título',
  style: TextStyle(
    fontSize: 24,
    color: Colors.deepPurple,
    fontStyle: FontStyle.italic,
  ),
);
```

### 5.3 Captura de texto

(Ver seção 4.2 acima — TextField suporta style em seu parâmetro style.)

---

## 6. Gerenciamento de estado: local vs global

* **Estado local**: vive dentro de um widget (ex.: StatefulWidget + `setState`).
* **Estado global**: compartilhado entre widgets distantes (ex.: Provider, Riverpod).

---

## 7. `setState`, Provider e Riverpod

### 7.1 `setState` (local)

```dart
class ContadorPage extends StatefulWidget {
  @override State<ContadorPage> createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Contador: $_count'),
        ElevatedButton(
          onPressed: () => setState(() => _count++),
          child: const Text('Incrementar'),
        ),
      ],
    );
  }
}
```

### 7.2 Provider (global)

```dart
// provider.dart
class Counter extends ChangeNotifier {
  int value = 0;
  void increment() {
    value++;
    notifyListeners();
  }
}
// main.dart
ChangeNotifierProvider(
  create: (_) => Counter(),
  child: MyApp(),
);

// Em um widget:
final counter = context.watch<Counter>();
Text('Valor: ${counter.value}');
```

### 7.3 Riverpod (global)

```dart
// providers.dart
final counterProvider = StateProvider<int>((ref) => 0);

// Em um widget:
final count = ref.watch(counterProvider).state;
ref.read(counterProvider).state++;
Text('Count: $count');
```

---

## 8. Botões para cálculos e exibição de informações

```dart
ElevatedButton(
  onPressed: () {
    final soma = 2 + 3;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: Text('Resultado: $soma'),
      ),
    );
  },
  child: const Text('Calcular 2+3'),
);
```

---

## 9. Lista de dados

```dart
final items = ['Item A', 'Item B', 'Item C'];

ListView.builder(
  itemCount: items.length,
  itemBuilder: (_, i) => ListTile(title: Text(items[i])),
);
```

---

## 10. Vários containers no app

Basta aninhar múltiplos Containers em colunas, linhas ou stacks:

```dart
Column(
  children: [
    Container(height: 50, color: Colors.red),
    Container(height: 50, color: Colors.green),
    Container(height: 50, color: Colors.blue),
  ],
);
```

---

## 11. Separar “CSS” da aplicação

Flutter não usa CSS; estilização fica em `ThemeData` em `main.dart` ou em classes de tema:

```dart
final appTheme = ThemeData(
  primarySwatch: Colors.teal,
  textTheme: const TextTheme(
    bodyMedium: TextStyle(fontSize: 16),
  ),
);

// Em MaterialApp: theme: appTheme
```

---

## 12. Caixa de marcação (Checkbox)

```dart
bool _check = false;

Checkbox(
  value: _check,
  onChanged: (val) => setState(() => _check = val!),
);
```

---

## 13. Caixa de combinação (Dropdown)

```dart
String _selected = 'A';
DropdownButton<String>(
  value: _selected,
  items: ['A', 'B', 'C']
    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
    .toList(),
  onChanged: (val) => setState(() => _selected = val!),
);
```

---

## 14. Botão de rádio (Radio)

```dart
int _choice = 0;

Column(
  children: [0,1,2].map((val) => Radio<int>(
    value: val,
    groupValue: _choice,
    onChanged: (v) => setState(() => _choice = v!),
  )).toList(),
);
```

---

## 15. Navegação entre telas e passagem de parâmetros

### 15.1 Navegação básica

```dart
Navigator.push(context, MaterialPageRoute(builder: (_) => NextPage()));
Navigator.pop(context);
```

### 15.2 Parâmetros via rotas nomeadas

```dart
// Ao chamar
Navigator.pushNamed(context, '/detail', arguments: 42);

// Em onGenerateRoute
final id = settings.arguments as int;
```

---