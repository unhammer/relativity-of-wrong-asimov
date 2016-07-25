all: The_Relativity_of_Wrong.nb.txt

The_Relativity_of_Wrong.pot: The_Relativity_of_Wrong.txt
	po4a-gettextize -f text -m The_Relativity_of_Wrong.txt > $@.new && mv $@.new $@

The_Relativity_of_Wrong.nb.txt: The_Relativity_of_Wrong.nb.po
	po4a --translate-only The_Relativity_of_Wrong.nb.txt po4a.cfg 

stats:
	for f in *.po; do printf "$$f "; msgfmt --output /dev/null --statistics $$f; done
