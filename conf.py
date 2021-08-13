html_title = 'Jetstream2 Wiki'

html_theme_options = {
    'analytics_id': 'UA-204881722-1',  #  Provided by Google in your dashboard
    'analytics_anonymize_ip': False,
    'logo_only': False,
    'display_version': True,
    'prev_next_buttons_location': 'bottom',
    'style_external_links': False,
    'vcs_pageview_mode': '',
    'style_nav_header_background': 'white',
    # Toc options
    #'collapse_navigation': True,
    'sticky_navigation': True,
    'navigation_depth': 5,
    #'includehidden': True,
    'titles_only': False
}

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

# These folders are copied to the documentation's HTML output
html_static_path = ['_static']

# These paths are either relative to html_static_path
# or fully qualified paths (eg. https://...)
html_css_files = [
    'css/custom.css',
]
