Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8KHP2Ic017540
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 13:25:02 -0400
Received: from mhw.ulib.iupui.edu (mail@mhw.ulib.iupui.edu [134.68.171.23])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k8KHOu3l003114
	for <linux-lvm@redhat.com>; Wed, 20 Sep 2006 13:24:57 -0400
Date: Wed, 20 Sep 2006 13:24:46 -0400 (EDT)
From: "Mark H. Wood" <mwood@IUPUI.Edu>
Subject: Re: [linux-lvm] LVM on RAID
In-Reply-To: <1158760524.26653.4.camel@merlin.Mines.EDU>
Message-ID: <Pine.LNX.4.64.0609201316551.29462@mhw.ulib.iupui.edu>
References: <1158603016.7182.12.camel@localhost.localdomain>
	<450EEEA0.7020703@mdmiller.com>
	<1158606792.7182.15.camel@localhost.localdomain>
	<1158607438.19905.30.camel@bounty.rider.geekspirit.net>
	<1158608077.7182.18.camel@localhost.localdomain>
	<1158608557.19905.37.camel@bounty.rider.geekspirit.net>
	<1158609135.7182.21.camel@localhost.localdomain>
	<1158609477.19905.38.camel@bounty.rider.geekspirit.net>
	<Pine.LNX.4.63.0609191650560.1397@zeus.itg.uiuc.edu>
	<1158760524.26653.4.camel@merlin.Mines.EDU>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: mbrookov@mines.edu, LVM general discussion and development <linux-lvm@redhat.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

We've been doing that on a number of hosts, using Compaq SMART2, HP Smart 
Array, and Dell PERC II/PERC 2/PERC 4 hardware SCSI RAID cards for several 
years.  The combination's never been a bit of trouble, and I'll add my 
vote to those who wouldn't think of doing a server without some sort of 
storage redundancy.

Likewise I wouldn't set up a server without LVM.  I was spoiled by the 
flexibility of the Netware 4 storage management layer and am loath to give 
it up just because we don't run Netware anymore.

- -- 
Mark H. Wood, Lead System Programmer   mwood@IUPUI.Edu
Typically when a software vendor says that a product is "intuitive" he
means the exact opposite.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.4 (GNU/Linux)
Comment: pgpenvelope 2.10.2 - http://pgpenvelope.sourceforge.net/

iD8DBQFFEXlms/NR4JuTKG8RAiX9AKCq3hIMBz/uF3WnTNHzClnxfCdsXwCePY3K
9M8gfDdsD1ShjeJo+5RZ/JE=
=wQc5
-----END PGP SIGNATURE-----
