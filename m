Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k29Cth122954
	for <linux-lvm@redhat.com>; Thu, 9 Mar 2006 07:55:43 -0500
Received: from mail.gmx.net (mail.gmx.de [213.165.64.20])
	by mx1.redhat.com (8.12.11/8.12.11) with SMTP id k29Ctf4Z020644
	for <linux-lvm@redhat.com>; Thu, 9 Mar 2006 07:55:42 -0500
Date: Thu, 9 Mar 2006 13:55:36 +0100 (MET)
From: "Axel Braun" <Axel.Braun@gmx.de>
MIME-Version: 1.0
References: <20060309094605.GA3222@redhat.com>
Subject: Re: [linux-lvm] LVM2 on a USB-disk/ same VG name
Message-ID: <21543.1141908936@www029.gmx.net>
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

Hello Heinz,

> vgrename the active one and adjust /etc/fstab appropriately.
> 'vgscan;vgchange -ay' should gain you access to the USB one then.

After deactivation I could change the name, but after the reboot the
dm-mapper was still looking for the old volume group 'system'. I tried to
boot the rescue system, maybe the inittab needed a refresh - but that did
not work.
unfortunately Suse's system repair cant deal with LVM, so my best idea was
to  change everything back.=20

Cheers
Axel

--=20
Echte DSL-Flatrate dauerhaft f=EF=BF=BDr 0,- Euro*!
"Feel free" mit GMX DSL! http://www.gmx.net/de/go/dsl
