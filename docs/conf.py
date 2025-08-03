# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = 'Öde - Kortfattad version'
copyright = 'Översättning och magi: 2023, Mats G. Liljegren, Fate Condensed: Evil Hat Productions, LLC'
author = 'Mats G. Liljegren'
release = '0.1'

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
        "sphinx.ext.autosectionlabel",
        "sphinx.ext.imgconverter",
        "sphinxcontrib.mermaid",
        ]

# Make sure the target is unique
autosectionlabel_prefix_document = True

mermaid_output_format = 'raw'

templates_path = ['_templates']
exclude_patterns = []

language = 'sv'

# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = 'alabaster'
html_show_sphinx = False
html_theme_options = {
     'show_powered_by' : 'False',
}

