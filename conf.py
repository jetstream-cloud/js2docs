html_title = 'Jetstream2 Wiki'

# Open external links in new tab/window
from sphinx.writers.html import HTMLTranslator
class PatchedHTMLTranslator(HTMLTranslator):
   def visit_reference(self, node):
      if node.get('newtab') or not (node.get('target') or node.get('internal') 
         or 'refuri' not in node):
            node['target'] = '_blank'
            super().visit_reference(node)

def setup(app):
    app.set_translator('html', PatchedHTMLTranslator)
##########

