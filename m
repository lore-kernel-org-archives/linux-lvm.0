From: Arkadiusz Miskiewicz <arekm@maven.pl>
Subject: Re: [linux-lvm] [PATCH]: don't use functions marked by SUSv3 as legacy
Date: Mon, 2 Jul 2007 09:21:16 +0200
References: <200707011529.08381.arekm@maven.pl>
	<200707011658.00819.arekm@maven.pl>
	<20070701203436.GK30047@agk.fab.redhat.com>
In-Reply-To: <20070701203436.GK30047@agk.fab.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200707020921.17551.arekm@maven.pl>
Content-Transfer-Encoding: quoted-printable
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: Alasdair G Kergon <agk@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Sunday 01 of July 2007, Alasdair G Kergon wrote:

> > The other one puts LDFLAGS (linker flags) not CFLAGS (cflags is for
> > compilation, ldflags for linking) and changes order so linking will
> > success when using -Wl,--as-needed flag.
>
> For fsadm, which I don't consider production-ready yet - but if you're
> using it successfully that'd be nice to know!

Never tested but we are building it and the patch is needed for that.

> > There are also others mostly self explaining patches for device-mapper:
> > http://cvs.pld-linux.org/cgi-bin/cvsweb/SOURCES/device-mapper-disable_d=
yn
> >amic_link.patch
>
> Want to test that one - how does it handle configure --disable-dynamic
> without --enable-static?  (A nice error message?  Is there a cleaner way?)

The goal of this was disabling building shared libraries and linking to the=
m.=20
Cleaner way would be simply change --enable-static_link to do the same.

Right now you can't just build static libraries, even=20
with --enable-static_link shared lib is being built:

klcc -static -shared -Wl,-soname,libdevmapper.so.1.02 \
        -O2 -fno-strict-aliasing -fwrapv -march=3Dx86-64 -gdwarf-2 -g2  -fP=
IC
-Wall -Wundef -Wshadow -Wcast-align -Wwrite-strings -Wmissing-prototypes
-Wmissing-declarations -Wnested-externs -Winline -O2 -fno-strict-aliasing
-fwrapv -march=3Dx86-64 -gdwarf-2 -g2  -Wl,--as-needed=20
-Wl,--version-script,.export.sym -L../lib/ioctl datastruct/bitset.o=20
datastruct/hash.o libdm-common.o libdm-file.o libdm-deptree.o libdm-string.=
o=20
libdm-report.o mm/dbg_malloc.o mm/pool.o regex/matcher.o regex/parse_rx.o=20
regex/ttree.o ioctl/libdm-iface.o  -o ioctl/libdevmapper.so

Is changing --enable-static_link to disable building shared libs a fine=20
change?

> > http://cvs.pld-linux.org/cgi-bin/cvsweb/SOURCES/device-mapper-force-loc=
al
> >-headers.patch
>
> Not sure what the best way to achieve that upstream is: the patch breaks
> some valid alternative configurations.

AFAIK the problem was that it was prefering system wide header over local i=
n=20
package. So when building new version of device-mapper old system include=20
header was used.

> > http://cvs.pld-linux.org/cgi-bin/cvsweb/SOURCES/device-mapper-klibc.pat=
ch
>
> basename: I'd rather call a local implementation if 'configure' didn't fi=
nd
> one
>
> fread+sscanf: I'd prefer not to change that at this stage unless you can
> show if fixes bugs in the existing implementation (it's not easy to get
> this sort of code correct, so any change involves avoidable risk) - again
> an alternative function implementation (possibly with a little refactorin=
g)
> would be more acceptable.

It doesn't fix anything. It merely replaces functions with these available =
in=20
klibc so you can build device-mapper against klibc.

> Alasdair

--=20
Arkadiusz Mi=EF=BF=BDkiewicz        PLD/Linux Team
arekm / maven.pl            http://ftp.pld-linux.org/
