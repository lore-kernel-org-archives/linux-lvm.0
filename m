Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q71GHEZ5016685
	for <linux-lvm@redhat.com>; Wed, 1 Aug 2012 12:17:14 -0400
Received: from v041420.home.net.pl (v041420.home.net.pl [89.161.211.18])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id q71GHALW008913
	for <linux-lvm@redhat.com>; Wed, 1 Aug 2012 12:17:11 -0400
From: Hubert Kario <hubert@kario.pl>
Date: Wed, 01 Aug 2012 18:17:03 +0200
Message-ID: <2392219.d0OTJVWRfz@bursa22>
In-Reply-To: <20120801122413.GF11876@agk-dp.fab.redhat.com>
References: <1912398.2IYGSI2Xbi@bursa22>
	<20120801122413.GF11876@agk-dp.fab.redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart37342573.xBYTO6G15D";
	micalg="pgp-sha1"; protocol="application/pgp-signature"
Content-Transfer-Encoding: 7Bit
Subject: Re: [linux-lvm] [lvm2cmd] Heap destruction by lvm2_exit()?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: Alasdair G Kergon <agk@redhat.com>
Cc: linux-lvm@redhat.com


--nextPart37342573.xBYTO6G15D
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday 01 of August 2012 13:24:13 Alasdair G Kergon wrote:
> Your test program works for me:
> 
> $ valgrind ./a.out
> ==14092== Memcheck, a memory error detector
> ==14092== Copyright (C) 2002-2009, and GNU GPL'd, by Julian Seward et al.
> ==14092== Using Valgrind-3.5.0 and LibVEX; rerun with -h for copyright
> info ==14092== Command: ./a.out
> ==14092==
> Some text to output
> Variable before: "Other text"
> Variable after: "Other text"
> ==14092==
> ==14092== HEAP SUMMARY:
> ==14092==     in use at exit: 0 bytes in 0 blocks
> ==14092==   total heap usage: 161 allocs, 161 frees, 10,620,400 bytes allocated 
> ==14092==
> ==14092== All heap blocks were freed -- no leaks are possible
> ==14092==
> ==14092== For counts of detected and suppressed errors, rerun with: -v
> ==14092== ERROR SUMMARY: 0 errors from 0 contexts (suppressed: 6 from 6)

You've got 6 supressions, while I've got 3. Could be that errors I see are
hidden from You.

Try running with
valgrind -v ./a.out

I've re-worked the application to work with only one lvm2 handle and it's
been stable for the past 17h while with multiple lvm2_exit()'s called it would crash
after 2-3minutes...
 
> What version of lvm2 are you using?

lvm2 2.02.96-2
gcc-multilib 4.7.1-1
valgrind 3.7.0-2

> Retest with upstream source?
> What lvm configure options are you using?

It is vanilla upstream source, Archlinux package doesn't use any
distro-specific patches, it's compiled with

./configure --prefix=/ --sbindir=/sbin --sysconfdir=/etc --localstatedir=/var --datarootdir=/usr/share \
    --includedir=/usr/include --with-usrlibdir=/usr/lib  --libdir=/usr/lib --with-udev-prefix=/usr \
    --with-systemdsystemunitdir=/usr/lib/systemd/system --enable-pkgconfig --enable-readline \
    --enable-dmeventd --enable-cmdlib --enable-applib --enable-udev_sync --enable-udev_rules  \
    --with-default-locking-dir=/run/lock/lvm
make

Regards,
-- 
Hubert Kario
hubert@kario.pl     kario@wit.edu.pl    https://hubert.kario.pl
PGP: 30D7 71F5 2F6F B157 872C  D811 A1D0 6BC9 8956 DCFE
--nextPart37342573.xBYTO6G15D
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAABAgAGBQJQGVaDAAoJEKHQa8mJVtz+4OgP/1JILc/Omz2ggqCc63QHKC9M
xC89O1C+j8NLIVLthCaRYVzVe09RdXv0CS+ijOSxnTV45/OyjMP+v2SJ6RHHdVNz
7oH/eCGqEsK97Kx/N6pvEE/eO+BaDuTpEjQ+cQBdnH6PWkZBJG0tDttG0Ko1j/lb
dTkSFuL8YfOsXg+gx3EMqP9BZECkGToo8s6oNuO0IvV2sO22E+uHuunAk3QlT7n5
Hr4WvtkpBPou4HH1TY8I8H1D6dBBAi2lw7ivbVHz8VvO3Ch+DldBsrxSUQM00R9l
P9vogY1pbvz8oChuL/dlJJDpuSN3EemnN8GuPiaQrkxAUpp3HgnBKbNHuQhLkgeD
y5/xsUUs+ifCzZfuGg7k6C4Cn2DWiWW0jPKdYFrUNWtLvcSaSmJC76+U1zFsO8p8
NgeFYXZCj1Y+eLnE286E09qdVr6AfGHGflRDpIZ8GqLmAxahNEceqJkG8XVb+x42
J6dEEtkOeTyu+f3DGSHHNB3wqbCCVn8Cok5aTkhvqf+xCvIOptfG8hmbn1NXn0zC
BfxeYHPeKIUUEl45fjtAbjhS6adsmeEMov/MUYNTa0fYiHYsjj+3YNsmk3e/b3hL
hxVzSKFQ8J09PP/ykvtaK+y7YI2Xt5z/gsIzoJXQk0Ys6Qt92nMja6u25s5cCoYG
XiuggdOTfKil1x18owBR
=korE
-----END PGP SIGNATURE-----

--nextPart37342573.xBYTO6G15D--
