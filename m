Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3L0MbX1004434
	for <linux-lvm@redhat.com>; Sun, 20 Apr 2008 20:22:37 -0400
Received: from biostat.ucsf.edu (upstrm185.psg-ucsf.org [38.99.193.74])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3L0MP27014405
	for <linux-lvm@redhat.com>; Sun, 20 Apr 2008 20:22:26 -0400
Subject: Re: [linux-lvm] Adding PVs to a group
From: Ross Boylan <ross@biostat.ucsf.edu>
In-Reply-To: <480B728C.9010708@Media-Brokers.com>
References: <48091663.2070404@Media-Brokers.com>
	<480A3291.7070702@Media-Brokers.com> <480AB63C.4070605@gmail.com>
	<480B728C.9010708@Media-Brokers.com>
Content-Transfer-Encoding: 7bit
Date: Sun, 20 Apr 2008 17:22:10 -0700
Message-Id: <1208737330.13193.66.camel@corn.betterworld.us>
Mime-Version: 1.0
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


On Sun, 2008-04-20 at 12:42 -0400, Charles Marcus wrote:
> vgextend vg2 /dev/sdb2, then
> 
> lvextend -L+100G /dev/vg2/var, then
> 
> resize_reiserfs -f /dev/vg2/var
> 
In your first example you umount'd before resizing.  In this example you
don't.  reiser doesn't require taking the volume offline before
resizing, so I don't think you need umount in any case.
Ross
