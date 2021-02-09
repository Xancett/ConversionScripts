set "mkv_merge=C:\Program Files\MKVtoolnix\mkvmerge.exe"
for %%f in (*.mkv) do "%mkv_merge%" -o "Finished\%%f" %%f %%~nf.srt