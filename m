Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mBFHYmnf023972
	for <linux-lvm@redhat.com>; Mon, 15 Dec 2008 12:34:48 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mBFHYZ9X029812
	for <linux-lvm@redhat.com>; Mon, 15 Dec 2008 12:34:36 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id mBFHYbRt031663
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 15 Dec 2008 12:34:37 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.13.8) with ESMTP id mBFHYYqr007703
	for <linux-lvm@redhat.com>; Mon, 15 Dec 2008 12:34:35 -0500
Date: Mon, 15 Dec 2008 12:34:34 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] FC8: "no Volumegroups found" after Mainboard-Change, 
	Rescueboot:OK
In-Reply-To: <49461A1C.8050006@tum.de>
Message-ID: <Pine.LNX.4.64.0812151230360.7650@bmsred.bmsi.com>
References: <49461A1C.8050006@tum.de>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 15 Dec 2008, Reinald Gfuellner wrote:

> After changing the mainboard, booting of several preexistent
> FC8-Installations fails: "No volume groups found".
> (kernel can not mount root-filesystem.)
> 
> DVD-Rescue-Boot however is OK, volumegroups are found and
> root-filesystem is accessible.

I've run into this several times.  In my cases, the problem has
been a change in disk controller, so that the drivers
in initrd no longer work.  This can usually be fixed by booting
the rescue, mount the root and boot, chroot, and mkinitrd.
You might need to use lsmod to find out which driver is needed
if mkinitrd can't figure it out from the chroot environment.
Use -v to make sure mkinitrd is including the LVM stuff.  If not,
more manual overrides are in order.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
