/**
 * @description Find all files with more than 10 lines
 * @kind problem
 * @id javascript/files-more-than-10-lines
 * @problem.severity recommendation
 */

import javascript

predicate isJavaScriptOrTypeScriptFile(File file) {
  file.getExtension() = "js" or file.getExtension() = "jsx" or
  file.getExtension() = "ts" or file.getExtension() = "tsx"
}

predicate fileMoreThan10Lines(File file) {
   file.getNumberOfLines() > 10 
}

from File file
where
  isJavaScriptOrTypeScriptFile(file) and
  fileMoreThan10Lines(file)
select file, "Found file with more than 10 lines: " + file.getAbsolutePath()
