Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k3LFDHbx019958
	for <linux-lvm@redhat.com>; Fri, 21 Apr 2006 11:13:17 -0400
Received: from smtp-out2.email.it (smtp-out2.email.it [80.247.70.37])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k3LFDGgq017285
	for <linux-lvm@redhat.com>; Fri, 21 Apr 2006 11:13:16 -0400
Received: from [10.253.12.196] (host193-39.pool8711.interbusiness.it
	[87.11.39.193])by smtp-out2.email.it (Email.it) with ESMTP id
	CBC8E1BCC4Bfor <linux-lvm@redhat.com>;
	Fri, 21 Apr 2006 17:13:10 +0200 (CEST)
Subject: Re: [linux-lvm] LVM2 release 2.02.03 / device-mapper 1.02.04
From: Simone Gotti <simone.gotti@email.it>
In-Reply-To: <20060421145337.GK24520@agk.surrey.redhat.com>
References: <20060414214357.GE4521@agk.surrey.redhat.com><1145564732.2658.15.camel@localhost><20060421142546.GA32359@toucan.gentoo.org>
	<4448F024.5020104@cox.net><20060421145337.GK24520@agk.surrey.redhat.com>
Date: Fri, 21 Apr 2006 17:13:13 +0200
Message-Id: <1145632393.3020.1.camel@localhost>
Mime-Version: 1.0
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Thanks Alasdair.

Your fix made it working again.

Bye!
=20
On Fri, 2006-04-21 at 15:53 +0100, Alasdair G Kergon wrote:
> > Same issue here.  Something definitely broken.  Had to revert mapper an=
d=20
> > lvm2 to previous versions:
>=20
> I've checked a fix into CVS.
>=20
> Alasdair

=20
=20
 --
 Email.it, the professional e-mail, gratis per te: http://www.email.it/f
=20
 Sponsor:
 Volo Amsterdam A/R con Opodo a partire da 171=EF=BF=BD tutto incluso!=20
 Clicca qui: http://adv.email.it/cgi-bin/foclick.cgi?mid=3D4937&d=3D21-4
