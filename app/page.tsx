export default function Page() {
  return (
    <main className="min-h-screen bg-background text-foreground p-8 md:p-16">
      <div className="max-w-3xl mx-auto">
        <div className="flex items-center gap-3 mb-8">
          <div className="w-12 h-12 bg-primary rounded-lg flex items-center justify-center">
            <span className="text-primary-foreground text-2xl font-bold">A</span>
          </div>
          <h1 className="text-3xl font-bold tracking-wider">ARKA</h1>
        </div>

        <div className="bg-card border border-border rounded-xl p-6 mb-8">
          <h2 className="text-xl font-semibold mb-4 text-primary">Flutter Web Project Ready</h2>
          <p className="text-muted-foreground mb-4">
            Your ARKA website Flutter code has been generated. Since Flutter apps cannot run directly in this preview, 
            follow the instructions below to use the code in your Flutter project.
          </p>
        </div>

        <div className="space-y-6">
          <section className="bg-card border border-border rounded-xl p-6">
            <h3 className="text-lg font-semibold mb-4">Project Structure</h3>
            <pre className="bg-secondary/50 rounded-lg p-4 text-sm overflow-x-auto text-muted-foreground">
{`flutter_arka/
├── lib/
│   ├── main.dart
│   ├── theme/
│   │   └── app_theme.dart
│   ├── pages/
│   │   └── home_page.dart
│   ├── sections/
│   │   ├── hero_section.dart
│   │   ├── services_section.dart
│   │   ├── about_section.dart
│   │   ├── portfolio_section.dart
│   │   ├── process_section.dart
│   │   ├── testimonials_section.dart
│   │   └── contact_section.dart
│   └── widgets/
│       ├── navigation_bar.dart
│       └── footer.dart
└── pubspec.yaml`}
            </pre>
          </section>

          <section className="bg-card border border-border rounded-xl p-6">
            <h3 className="text-lg font-semibold mb-4">How to Use</h3>
            <ol className="space-y-3 text-muted-foreground">
              <li className="flex gap-3">
                <span className="bg-primary text-primary-foreground w-6 h-6 rounded-full flex items-center justify-center text-sm font-medium shrink-0">1</span>
                <span>Download the project using the three dots menu above and select &quot;Download ZIP&quot;</span>
              </li>
              <li className="flex gap-3">
                <span className="bg-primary text-primary-foreground w-6 h-6 rounded-full flex items-center justify-center text-sm font-medium shrink-0">2</span>
                <span>Extract and copy the <code className="bg-secondary px-2 py-0.5 rounded">flutter_arka/lib/</code> folder to your Flutter project</span>
              </li>
              <li className="flex gap-3">
                <span className="bg-primary text-primary-foreground w-6 h-6 rounded-full flex items-center justify-center text-sm font-medium shrink-0">3</span>
                <span>Add <code className="bg-secondary px-2 py-0.5 rounded">google_fonts: ^6.1.0</code> to your pubspec.yaml dependencies</span>
              </li>
              <li className="flex gap-3">
                <span className="bg-primary text-primary-foreground w-6 h-6 rounded-full flex items-center justify-center text-sm font-medium shrink-0">4</span>
                <span>Run <code className="bg-secondary px-2 py-0.5 rounded">flutter pub get</code></span>
              </li>
              <li className="flex gap-3">
                <span className="bg-primary text-primary-foreground w-6 h-6 rounded-full flex items-center justify-center text-sm font-medium shrink-0">5</span>
                <span>Run <code className="bg-secondary px-2 py-0.5 rounded">flutter run -d chrome</code> for web</span>
              </li>
            </ol>
          </section>

          <section className="bg-card border border-border rounded-xl p-6">
            <h3 className="text-lg font-semibold mb-4">Features Included</h3>
            <ul className="grid grid-cols-1 md:grid-cols-2 gap-3 text-muted-foreground">
              <li className="flex items-center gap-2">
                <span className="w-2 h-2 bg-primary rounded-full"></span>
                Responsive navigation with mobile menu
              </li>
              <li className="flex items-center gap-2">
                <span className="w-2 h-2 bg-primary rounded-full"></span>
                Hero section with animated stats
              </li>
              <li className="flex items-center gap-2">
                <span className="w-2 h-2 bg-primary rounded-full"></span>
                Services grid with hover effects
              </li>
              <li className="flex items-center gap-2">
                <span className="w-2 h-2 bg-primary rounded-full"></span>
                About section with tech stack
              </li>
              <li className="flex items-center gap-2">
                <span className="w-2 h-2 bg-primary rounded-full"></span>
                Portfolio project showcase
              </li>
              <li className="flex items-center gap-2">
                <span className="w-2 h-2 bg-primary rounded-full"></span>
                Process timeline with 6 steps
              </li>
              <li className="flex items-center gap-2">
                <span className="w-2 h-2 bg-primary rounded-full"></span>
                Testimonials carousel
              </li>
              <li className="flex items-center gap-2">
                <span className="w-2 h-2 bg-primary rounded-full"></span>
                Contact form with validation
              </li>
            </ul>
          </section>

          <section className="bg-primary/10 border border-primary/30 rounded-xl p-6">
            <h3 className="text-lg font-semibold mb-2 text-primary">Color Palette</h3>
            <div className="flex flex-wrap gap-4 mt-4">
              <div className="flex items-center gap-2">
                <div className="w-8 h-8 rounded-lg" style={{ backgroundColor: '#6FAF8E' }}></div>
                <span className="text-sm text-muted-foreground">Primary Green</span>
              </div>
              <div className="flex items-center gap-2">
                <div className="w-8 h-8 rounded-lg" style={{ backgroundColor: '#1A1D21' }}></div>
                <span className="text-sm text-muted-foreground">Background</span>
              </div>
              <div className="flex items-center gap-2">
                <div className="w-8 h-8 rounded-lg border border-border" style={{ backgroundColor: '#23272E' }}></div>
                <span className="text-sm text-muted-foreground">Card</span>
              </div>
            </div>
          </section>
        </div>
      </div>
    </main>
  )
}
