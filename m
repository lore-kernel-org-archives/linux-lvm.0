Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l61EwDoc026233
	for <linux-lvm@redhat.com>; Sun, 1 Jul 2007 10:58:13 -0400
Received: from main.carme.maven.pl (main.carme.maven.pl [193.239.45.138])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l61EwB15010548
	for <linux-lvm@redhat.com>; Sun, 1 Jul 2007 10:58:11 -0400
Received: from chello087207214234.chello.pl ([87.207.214.234]
	helo=[192.168.0.149])
	by main.carme.maven.pl with esmtpsa (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.66) (envelope-from <arekm@maven.pl>) id 1I50sM-0005Ub-AL
	for linux-lvm@redhat.com; Sun, 01 Jul 2007 16:58:10 +0200
From: Arkadiusz Miskiewicz <arekm@maven.pl>
Subject: Re: [linux-lvm] [PATCH]: don't use functions marked by SUSv3 as legacy
Date: Sun, 1 Jul 2007 16:58:00 +0200
References: <200707011529.08381.arekm@maven.pl>
	<20070701144829.GI30047@agk.fab.redhat.com>
In-Reply-To: <20070701144829.GI30047@agk.fab.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200707011658.00819.arekm@maven.pl>
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
To: linux-lvm@redhat.com

On Sunday 01 of July 2007, Alasdair G Kergon wrote:
> On Sun, Jul 01, 2007 at 03:29:08PM +0200, Arkadiusz Miskiewicz wrote:
> > Please merge this one:
> > http://cvs.pld-linux.org/cgi-bin/cvsweb/SOURCES/lvm2-susv3.patch
> > by qboosh/pld-linux.org.
>
> Will do.  I was brought up on BSD:-)

Please merge this one, too:
http://cvs.pld-linux.org/cgi-bin/cvsweb/SOURCES/lvm2-as-needed.patch

First it checks for tinfo library in case where ncurses is built in form of=
=20
two libraries (tinfo - terminal stuff, ncurses - the rest).

The other one puts LDFLAGS (linker flags) not CFLAGS (cflags is for=20
compilation, ldflags for linking) and changes order so linking will success=
=20
when using -Wl,--as-needed flag.


There are also others mostly self explaining patches for device-mapper:
http://cvs.pld-linux.org/cgi-bin/cvsweb/SOURCES/device-mapper-disable_dynam=
ic_link.patch
http://cvs.pld-linux.org/cgi-bin/cvsweb/SOURCES/device-mapper-force-local-h=
eaders.patch
http://cvs.pld-linux.org/cgi-bin/cvsweb/SOURCES/device-mapper-getopt.patch
http://cvs.pld-linux.org/cgi-bin/cvsweb/SOURCES/device-mapper-klibc.patch

> Alasdair

--=20
Arkadiusz Mi=EF=BF=BDkiewicz        PLD/Linux Team
arekm / maven.pl            http://ftp.pld-linux.org/
