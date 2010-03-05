Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o252ix9d005509
	for <linux-lvm@redhat.com>; Thu, 4 Mar 2010 21:44:59 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o252ih8i031594
	for <linux-lvm@redhat.com>; Thu, 4 Mar 2010 21:44:43 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id o252igmV007833
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 4 Mar 2010 21:44:42 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id o252igo4030150
	for <linux-lvm@redhat.com>; Thu, 4 Mar 2010 21:44:42 -0500
Date: Thu, 4 Mar 2010 21:44:42 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
In-Reply-To: <1267750775.2916.23.camel@portuga-desktop>
Message-ID: <Pine.LNX.4.64.1003042137100.30097@bmsred.bmsi.com>
References: <1267750775.2916.23.camel@portuga-desktop>
MIME-Version: 1.0
Subject: Re: [linux-lvm] my project
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, 4 Mar 2010, Afonso Henriques Silva Leite wrote:

> So guys, what do you think? Can I solve my problem with lvm? I mean, I
> remember reading a warning to do not use lvm with root partitions. It's
> impossible to do it?

LVM works fine for the root partition.  There are a few operations
that require booting from a LiveCD (like shrinking the root LV), but
I've never had to do them.

LVM does not currently work for the *boot* partition (although the
grub guys are working on that).

It will not be easy to convert your disk to LVM, however.  You should
get another 40G disk (I have a stack of them, having recycled all
my 10s and 20s).  Install the new disk as primary, and the old as secondary.
Install an LVM friendly distro like Fedora on the new disk with "Custom Disk
Layout".  Allocate a 300M /boot partition, and the remainder as an LVM PV.
Allocate a 10G LV for system, a swap LV, and a large data LV mounted on the
same directory as your current system.  After installing and updating, copy
your data directory over with rsync.

Once your root is in LVM, it is very easy to enlarge while mounted
and the system is cranking!

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
