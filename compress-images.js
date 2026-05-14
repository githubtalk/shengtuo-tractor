const sharp = require('sharp');
const path = require('path');
const fs = require('fs');

const imagesDir = path.join(__dirname, 'images');
const files = fs.readdirSync(imagesDir).filter(f => 
  /\.(jpg|jpeg|png)$/i.test(f)
);

let processed = 0;
let totalSaved = 0;

(async () => {
  for (const file of files) {
    const filePath = path.join(imagesDir, file);
    const ext = path.extname(file).toLowerCase();
    const stat = fs.statSync(filePath);
    const originalSize = stat.size;
    const tmpFile = filePath + '.tmp';

    try {
      let pipeline = sharp(filePath);

      if (ext === '.png') {
        await pipeline.png({ compressionLevel: 9 }).toFile(tmpFile);
      } else if (ext === '.jpg' || ext === '.jpeg') {
        await pipeline.jpeg({ quality: 75, progressive: true, chromaSubsampling: '4:2:0' }).toFile(tmpFile);
      } else {
        continue;
      }

      if (fs.existsSync(tmpFile)) {
        const newStat = fs.statSync(tmpFile);
        const saved = originalSize - newStat.size;
        totalSaved += saved;
        if (saved > 1024) {  // only save if > 1KB benefit
          fs.renameSync(tmpFile, filePath);
          console.log(`✓ ${file}: ${(originalSize/1024).toFixed(0)}KB → ${(newStat.size/1024).toFixed(0)}KB (-${(saved/1024).toFixed(0)}KB)`);
        } else {
          fs.unlinkSync(tmpFile);
          console.log(`○ ${file}: no significant gain, skipped`);
        }
        processed++;
      }
    } catch (e) {
      console.log(`✗ ${file}: error - ${e.message}`);
    }
  }
  console.log(`\nDone: ${processed} files processed, total saved: ${(totalSaved/1024).toFixed(0)}KB`);
})();