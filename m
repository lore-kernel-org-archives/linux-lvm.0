Received: from [10.33.1.214] (dhcp-1-214.fab.redhat.com [10.33.1.214])
	by pobox.surrey.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l3OAarjV006128
	for <linux-lvm@redhat.com>; Tue, 24 Apr 2007 11:36:53 +0100
Message-ID: <462DDE8D.1070601@redhat.com>
Date: Tue, 24 Apr 2007 11:40:13 +0100
From: "Bryn M. Reeves" <breeves@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Configure lvm2 with drbd
References: <462DDAC5.20100@euddene.com>
In-Reply-To: <462DDAC5.20100@euddene.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Mariano Gonzalvo wrote:
> 
>     /dev/md4 is the raid device over was configured drbd0.
> 
>     Why /dev/md4 it's taken as PV Name?
> 

Hi Mariano,

LVM2 identifies devices using labels written on the disks. So, if md4 is
the underlying device for your drbd devices, when lvm2 scans /dev
looking for labels it finds the label on md4 first and uses that.

You can control this using lvm2's filtering options.

See the man page for lvm.conf for the full details, but editing
/etc/lvm/lvm.conf and changing the filter line from:

        filter = [ "a/.*/" ]

to:

        filter = [ "a|/dev/drdb|", "r|/dev/md|", "a|.*|" ]

Should accept all drdb devices as physical volumes, reject any software
raid (md) devices, and accept everything else.

This should work if you only have PVs on drdb or other device types and
not on any plain md devices. If you have a mix of the types you will
need to create a more specific filter line for your system.

Regards,
Bryn.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.7 (GNU/Linux)
Comment: Using GnuPG with Fedora - http://enigmail.mozdev.org

iD8DBQFGLd6M6YSQoMYUY94RAtI8AKDFS6jYQQ4869RQQKy/qMYZEdjiagCfaKGP
te2AMpkzZ45lDQTMwXmyTgE=
=nRwl
-----END PGP SIGNATURE-----
