#!/bin/bash

SRC_DIR="img"
OUT_DIR="img/optimized"

mkdir -p "$OUT_DIR"

echo "🛠️ Optimizando imágenes..."

# PNG → optimizado
for img in "$SRC_DIR"/*.png; do
    [ -e "$img" ] || continue
    filename=$(basename "$img")
    echo "⚙️ Optimizing $filename"
    convert "$img" -strip -interlace Plane -gaussian-blur 0.05 -quality 85 "$OUT_DIR/$filename"
done

# JPG → optimizado
for img in "$SRC_DIR"/*.{jpg,jpeg}; do
    [ -e "$img" ] || continue
    filename=$(basename "$img")
    echo "⚙️ Optimizing $filename"
    convert "$img" -strip -interlace Plane -quality 80 "$OUT_DIR/$filename"
done

# SVG → copia directa (no se optimiza igual)
for img in "$SRC_DIR"/*.svg; do
    [ -e "$img" ] || continue
    filename=$(basename "$img")
    echo "📁 Copiando SVG $filename"
    cp "$img" "$OUT_DIR/$filename"
done

echo "✅ Imágenes optimizadas en $OUT_DIR/"
