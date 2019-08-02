cairo_sources =	\
	cairo-analysis-surface.c \
	cairo-arc.c \
	cairo-array.c \
	cairo-atomic.c \
	cairo-base64-stream.c \
	cairo-base85-stream.c \
	cairo-bentley-ottmann.c \
	cairo-bentley-ottmann-rectangular.c \
	cairo-bentley-ottmann-rectilinear.c \
	cairo-botor-scan-converter.c \
	cairo-boxes.c \
	cairo-boxes-intersect.c \
	cairo.c \
	cairo-cache.c \
	cairo-clip.c \
	cairo-clip-boxes.c \
	cairo-clip-polygon.c \
	cairo-clip-region.c \
	cairo-clip-surface.c \
	cairo-color.c \
	cairo-composite-rectangles.c \
	cairo-compositor.c \
	cairo-contour.c \
	cairo-damage.c \
	cairo-debug.c \
	cairo-default-context.c \
	cairo-device.c \
	cairo-error.c \
	cairo-fallback-compositor.c \
	cairo-fixed.c \
	cairo-font-face.c \
	cairo-font-face-twin.c \
	cairo-font-face-twin-data.c \
	cairo-font-options.c \
	cairo-freelist.c \
	cairo-freed-pool.c \
	cairo-gstate.c \
	cairo-hash.c \
	cairo-hull.c \
	cairo-image-compositor.c \
	cairo-image-info.c \
	cairo-image-source.c \
	cairo-image-surface.c \
	cairo-line.c \
	cairo-lzw.c \
	cairo-matrix.c \
	cairo-mask-compositor.c \
	cairo-mesh-pattern-rasterizer.c \
	cairo-mempool.c \
	cairo-misc.c \
	cairo-mono-scan-converter.c \
	cairo-mutex.c \
	cairo-no-compositor.c \
	cairo-observer.c \
	cairo-output-stream.c \
	cairo-paginated-surface.c \
	cairo-path-bounds.c \
	cairo-path.c \
	cairo-path-fill.c \
	cairo-path-fixed.c \
	cairo-path-in-fill.c \
	cairo-path-stroke.c \
	cairo-path-stroke-boxes.c \
	cairo-path-stroke-polygon.c \
	cairo-path-stroke-traps.c \
	cairo-path-stroke-tristrip.c \
	cairo-pattern.c \
	cairo-pen.c \
	cairo-polygon.c \
	cairo-polygon-intersect.c \
	cairo-polygon-reduce.c \
	cairo-raster-source-pattern.c \
	cairo-recording-surface.c \
	cairo-rectangle.c \
	cairo-rectangular-scan-converter.c \
	cairo-region.c \
	cairo-rtree.c \
	cairo-scaled-font.c \
	cairo-shape-mask-compositor.c \
	cairo-slope.c \
	cairo-spans.c \
	cairo-spans-compositor.c \
	cairo-spline.c \
	cairo-stroke-dash.c \
	cairo-stroke-style.c \
	cairo-surface.c \
	cairo-surface-clipper.c \
	cairo-surface-fallback.c \
	cairo-surface-observer.c \
	cairo-surface-offset.c \
	cairo-surface-snapshot.c \
	cairo-surface-subsurface.c \
	cairo-surface-wrapper.c \
	cairo-time.c \
	cairo-tor-scan-converter.c \
	cairo-tor22-scan-converter.c \
	cairo-clip-tor-scan-converter.c \
	cairo-toy-font-face.c \
	cairo-traps.c \
	cairo-tristrip.c \
	cairo-traps-compositor.c \
	cairo-unicode.c \
	cairo-user-font.c \
	cairo-version.c \
	cairo-wideint.c \
	$(NULL)

_cairo_font_subset_sources = \
	cairo-cff-subset.c \
	cairo-scaled-font-subsets.c \
	cairo-truetype-subset.c \
	cairo-type1-fallback.c \
	cairo-type1-glyph-names.c \
	cairo-type1-subset.c \
        cairo-type3-glyph-surface.c \
	$(NULL)

_cairo_pdf_operators_private =	\
	cairo-pdf-operators-private.h	\
	cairo-pdf-shading-private.h	\
	cairo-tag-attributes-private.h	\
	cairo-tag-stack-private.h

_cairo_pdf_operators_sources =	\
	cairo-pdf-interchange.c	\
	cairo-pdf-operators.c	\
	cairo-pdf-shading.c	\
	cairo-tag-attributes.c	\
	cairo-tag-stack.c

cairo_png_sources = cairo-png.c

cairo_ps_headers = cairo-ps.h
cairo_ps_private = cairo-ps-surface-private.h
cairo_ps_sources = cairo-ps-surface.c

_cairo_deflate_stream_sources = cairo-deflate-stream.c

cairo_pdf_headers = cairo-pdf.h
cairo_pdf_private = cairo-pdf-surface-private.h
cairo_pdf_sources = cairo-pdf-surface.c

cairo_svg_headers = cairo-svg.h
cairo_svg_private = cairo-svg-surface-private.h
cairo_svg_sources = cairo-svg-surface.c

cairo_ft_headers = cairo-ft.h
cairo_ft_private = cairo-ft-private.h
cairo_ft_sources = cairo-ft-font.c

# These are private, even though they look like public headers
cairo_test_surfaces_private = \
	test-compositor-surface.h \
	test-compositor-surface-private.h \
	test-null-compositor-surface.h \
	test-paginated-surface.h \
	$(NULL)
cairo_test_surfaces_sources = \
	test-compositor-surface.c \
	test-null-compositor-surface.c \
	test-base-compositor-surface.c \
	test-paginated-surface.c \
	$(NULL)

cairo_qt_headers = cairo-qt.h
cairo_qt_cxx_sources = cairo-qt-surface.cpp

cairo_win32_headers = cairo-win32.h
cairo_win32_private = win32/cairo-win32-private.h
cairo_win32_sources = \
	win32/cairo-win32-debug.c \
	win32/cairo-win32-device.c \
	win32/cairo-win32-gdi-compositor.c \
	win32/cairo-win32-system.c \
	win32/cairo-win32-surface.c \
	win32/cairo-win32-display-surface.c \
	win32/cairo-win32-printing-surface.c \
	$(NULL)
cairo_win32_font_sources = \
	win32/cairo-win32-font.c \
	$(NULL)

cairo_skia_headers = cairo-skia.h
cairo_skia_private = skia/cairo-skia-private.h
cairo_skia_cxx_sources = \
	skia/cairo-skia-context.cpp \
	skia/cairo-skia-surface.cpp \
	$(NULL)

cairo_gl_headers = cairo-gl.h
cairo_gl_private = cairo-gl-private.h \
		   cairo-gl-dispatch-private.h \
		   cairo-gl-ext-def-private.h \
		   cairo-gl-gradient-private.h

cairo_gl_sources = cairo-gl-composite.c \
		   cairo-gl-device.c \
		   cairo-gl-dispatch.c \
		   cairo-gl-glyphs.c \
		   cairo-gl-gradient.c \
		   cairo-gl-info.c \
		   cairo-gl-operand.c \
		   cairo-gl-shaders.c \
		   cairo-gl-msaa-compositor.c \
		   cairo-gl-spans-compositor.c \
		   cairo-gl-traps-compositor.c \
		   cairo-gl-source.c \
		   cairo-gl-surface.c

cairo_wgl_sources = cairo-wgl-context.c

cairo_script_headers = cairo-script.h
cairo_script_private = cairo-script-private.h
cairo_script_sources = cairo-script-surface.c

cairo_tee_headers = cairo-tee.h
cairo_tee_private = cairo-tee-surface-private.h
cairo_tee_sources = cairo-tee-surface.c

cairo_xml_headers = cairo-xml.h
cairo_xml_sources = cairo-xml-surface.c

cairo_cogl_headers = cairo-cogl.h
cairo_cogl_private = cairo-cogl-private.h \
		     cairo-cogl-gradient-private.h \
		     cairo-cogl-context-private.h \
		     cairo-cogl-utils-private.h
cairo_cogl_sources = cairo-cogl-surface.c \
		     cairo-cogl-gradient.c \
		     cairo-cogl-context.c \
		     cairo-cogl-utils.c
