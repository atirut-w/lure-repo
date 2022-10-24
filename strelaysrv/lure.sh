name='strelaysrv'
version='1.18.6'
release='1'
desc='This is the relay server for the syncthing project.'
homepage='https://syncthing.net/'
architectures='amd64'
licenses='MPL'
provides='syncthing-relaysrv'
conflicts='syncthing-relaysrv'
deps_amd64=('glibc')
build_deps=('git' 'go')
sources_amd64=("https://github.com/syncthing/relaysrv/releases/download/v${version}/${name}-linux-amd64-v${version}.tar.gz"
	"https://raw.githubusercontent.com/archlinux/svntogit-community/packages/syncthing/trunk/syncthing-relaysrv.service"
	"https://raw.githubusercontent.com/archlinux/svntogit-community/packages/syncthing/trunk/syncthing-relaysrv.tmpfiles"
	"https://raw.githubusercontent.com/archlinux/svntogit-community/packages/syncthing/trunk/syncthing-relaysrv.sysusers")
checksums=('ff5f4dfa7e1d88d3db904aa78e0a536d809ad31d9d0fe0073c61a61dfa8b0b2a'
	'SKIP'
	'SKIP'
	'SKIP')

prepare() {
	cd "${srcdir}"
}

package() {
	install -Dm755 ./${name}-linux-amd64-v${version}/strelaysrv "${pkgdir}/usr/bin/syncthing-relaysrv"
	install -Dm644 "${srcdir}/syncthing-relaysrv.service" "${pkgdir}/usr/lib/systemd/system/syncthing-relaysrv.service"
	install -Dm644 "${srcdir}/syncthing-relaysrv.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/syncthing-relaysrv.conf"
	install -Dm644 "${srcdir}/syncthing-relaysrv.sysusers" "${pkgdir}/usr/lib/sysusers.d/syncthing-relaysrv.conf"
}