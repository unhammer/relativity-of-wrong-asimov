all: The_Relativity_of_Wrong.nb.txt

The_Relativity_of_Wrong.pot: The_Relativity_of_Wrong.txt
	po4a-gettextize -f text -m The_Relativity_of_Wrong.txt \
	-M UTF-8 -L UTF-8 --package-name "Relativitiy of Wrong" \
	| sed 's/CHARSET/UTF-8/' > $@.new && mv $@.new $@

The_Relativity_of_Wrong.nb.po: The_Relativity_of_Wrong.pot
	po4a --no-translations --msgmerge-opt --no-location po4a.cfg

The_Relativity_of_Wrong.nb.txt: The_Relativity_of_Wrong.nb.po The_Relativity_of_Wrong.txt
	po4a --translate-only The_Relativity_of_Wrong.nb.txt po4a.cfg 

stats:
	for f in *.po; do printf "$$f "; msgfmt --output /dev/null --statistics $$f; done
