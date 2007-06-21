Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l5LEjwgS020684
	for <linux-lvm@redhat.com>; Thu, 21 Jun 2007 10:45:58 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l5LEjvTs000366
	for <linux-lvm@redhat.com>; Thu, 21 Jun 2007 10:45:57 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l5LEjVI2000596
	for <linux-lvm@redhat.com>; Thu, 21 Jun 2007 10:45:51 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l5LEjVkN017532
	for <linux-lvm@redhat.com>; Thu, 21 Jun 2007 10:45:31 -0400
Date: Thu, 21 Jun 2007 10:45:31 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Does pv failure effect whole vg?
In-Reply-To: <467A2C22.6030503@vdberg.org>
Message-ID: <Pine.LNX.4.44.0706211043080.17457-100000@bmsred.bmsi.com>
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

On Thu, 21 Jun 2007, Richard van den Berg wrote:

> When booting from cdrom (systemrescuecd) md2 failed to come up, so vg00
> did not come up. I then manually brought up md2 and split the vg, and
> added sda3 in the mix:

When md devices haven't come up, it has been one of the following:

1) I forgot to make the partition type fd - RAID autodetect
2) The raid1 (or other) driver was not in initrd.  Makeinitrd
   does not always add it when it needs to.  (Wants to
   see /etc/mdadm.conf or /etc/raidtab.)

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
