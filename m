Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i17MsKa21840
	for <linux-lvm@redhat.com>; Sat, 7 Feb 2004 17:54:20 -0500
Received: from mail.werbeagentur-aufwind.de (websrv.werbeagentur-aufwind.de [213.239.197.241])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i17MsJb29279
	for <linux-lvm@redhat.com>; Sat, 7 Feb 2004 17:54:19 -0500
Subject: Re: [linux-lvm] root on lvm2 on raid5 problem... kernel 2.6.x
From: Christophe Saout <christophe@saout.de>
In-Reply-To: <20040207223426.Y1170@uk.sistina.com>
References: <253458D17524064C996F67C97116BF880659D9@Oscar-5.north.mcld.net>
	 <20040207223426.Y1170@uk.sistina.com>
Message-Id: <1076194457.32307.3.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Sat Feb  7 17:53:23 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Am Sa, den 07.02.2004 schrieb linux-lvm-admin@redhat.com um 23:34:

> Some more tips that might be useful:
>   dmsetup vgmknodes: creates /dev/mapper directories entries for active devices

I think you meant "dmsetup mknodes". :-)

> > From the initrd image, however, vgchange is unable to activate
> > the volumes.
> If it's read-only, vgscan/vgchange --ignorelockingfailure

What's also useful with a dynamic /dev (like mounted on ramfs with udev)
on a read-only root filesystem (I'm doing this here in the early system
boot rc when /dev is populated even before the filesystem checking and
mounting begins):

lvm vgscan --mknodes --ignorelockingfailure
