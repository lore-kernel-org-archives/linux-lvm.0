Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k29DeW105298
	for <linux-lvm@redhat.com>; Thu, 9 Mar 2006 08:40:32 -0500
Received: from mail.gmx.net (mail.gmx.net [213.165.64.20])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id k29DeUAH004480
	for <linux-lvm@redhat.com>; Thu, 9 Mar 2006 08:40:30 -0500
Date: Thu, 9 Mar 2006 14:40:25 +0100 (MET)
From: "Axel Braun" <Axel.Braun@gmx.de>
MIME-Version: 1.0
References: <20060309133101.GB16@redhat.com>
Subject: Re: [linux-lvm] LVM2 on a USB-disk/ same VG name
Message-ID: <19705.1141911625@www084.gmx.net>
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
To: mauelshagen@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>

Hallo Heinz,

> > > vgrename the active one and adjust /etc/fstab appropriately.
> > > 'vgscan;vgchange -ay' should gain you access to the USB one then.
> >=20
> > After deactivation I could change the name, but after the reboot the
> > dm-mapper was still looking for the old volume group 'system'. I tried
> to
> > boot the rescue system, maybe the inittab needed a refresh - but that
> did
> > not work.
>=20
> Did you change /etc/fstab ?

yes, even before I changed the vgname

Ax

--=20
"Feel free" mit GMX FreeMail!
Monat f=EF=BF=BDr Monat 10 FreeSMS inklusive! http://www.gmx.net
