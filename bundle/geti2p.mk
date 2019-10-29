geti2p: i2pinstaller.exe i2pdinstaller.exe

i2pinstaller.exe: url
	wget -c `cat geti2p.url` -O i2pinstaller.exe

url:
	echo -n 'https://launchpad.net' | tee .geti2p.url
	curl -s https://launchpad.net/i2p/trunk/+rdf | \
		grep specifiedAt | \
		head -n 3 | \
		tail -n 1 | \
		sed 's|                <lp:specifiedAt rdf:resource="||g' | \
		sed 's|+rdf"/>||g' | tee -a .geti2p.url
	echo -n '+download/i2pinstall_' | tee -a .geti2p.url
	curl -s https://launchpad.net/i2p/trunk/+rdf | \
		grep specifiedAt | \
		head -n 3 | \
		tail -n 1 | \
		sed 's|                <lp:specifiedAt rdf:resource="/i2p/trunk/||g' | \
		sed 's|/+rdf"/>||g' | tee -a .geti2p.url
	echo '_windows.exe' | tee -a .geti2p.url
	cat .geti2p.url | tr -d '\n' | tee geti2p.url
	rm -f .geti2p.url

LATEST_I2PD=$(shell gothub info -u purplei2p -r i2pd -j | grep tag_name | sed 's|tag_name||g' | tr -d ':, '| head -n 1 )

i2pd: i2pdinstaller.exe

i2pdinstaller.exe:
	wget -c https://raw.githubusercontent.com/PurpleI2P/i2pd/master/contrib/i2pd.conf -O i2pd.conf
	wget -c https://github.com/PurpleI2P/i2pd/releases/download/$(LATEST_I2PD)/setup_i2pd_v$(LATEST_I2PD).exe -O i2pdinstaller.exe
