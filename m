Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p2BK5Q4O008359
	for <linux-lvm@redhat.com>; Fri, 11 Mar 2011 15:05:26 -0500
Received: from smtp12.tagonline.com (nat199.nat.tagonline.com [207.111.79.199])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2BK5D3U004124
	for <linux-lvm@redhat.com>; Fri, 11 Mar 2011 15:05:14 -0500
Received: from taco.int.tagonline.com (localhost.localdomain [127.0.0.1])
	by localhost.localdomain for (8.13.1/8.12.8/muffin_cf_1.0) with ESMTP
	id p2BK5DEC030414
	for <linux-lvm@redhat.com>; Fri, 11 Mar 2011 15:05:13 -0500
Received: (from news@localhost)
	by taco.int.tagonline.com (8.13.1/8.13.1/Submit) id p2BK5CVv030402
	for linux-lvm@redhat.com; Fri, 11 Mar 2011 15:05:12 -0500
From: Andrew Gideon <ag2827189@tagmall.com>
Date: Fri, 11 Mar 2011 20:05:12 +0000 (UTC)
Message-ID: <ildv9o$nji$2@taco.int.tagonline.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] lvremove or vgextend: metadata too large for circular
	buffer
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

We're hitting the "metadata too large for circular buffer" problem.  Last 
time this occurred, I was able to clear out a little space by removing 
some unused volumes, and then make more space by selective use of pvmove 
to defragment.  This worked well.

However, that time I didn't get the error from lvremove.  This time, that 
is occurring.  So I don't seem to be able to make any space.

Once I execute lvremove on a volume, the "LV Status" becomes "NOT 
available".  The command 'lvdisplay -m' still shows the segments, however.

How can I resolve this?  Trashing the entire VG is not something I can 
afford.

I created new PVs with larger allocations of space for metadata, but I 
cannot even add these to the VG.  The vgextend command also fails with 
"metadata too large for circular buffer".

	- Andrew
