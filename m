Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4I90ZeS024728
	for <linux-lvm@redhat.com>; Thu, 18 May 2006 05:00:35 -0400
Received: from smtp.cs.tcd.ie (relay.cs.tcd.ie [134.226.32.56])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4I90X5T002923
	for <linux-lvm@redhat.com>; Thu, 18 May 2006 05:00:33 -0400
Received: from localhost (localhost [127.0.0.1])
	by relay.cs.tcd.ie (Postfix) with ESMTP id 14CAC3C4B
	for <linux-lvm@redhat.com>; Thu, 18 May 2006 10:00:33 +0100 (IST)
Received: from smtp.cs.tcd.ie ([127.0.0.1])
	by localhost (smtp.cs.tcd.ie [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 02396-05 for <linux-lvm@redhat.com>;
	Thu, 18 May 2006 10:00:32 +0100 (IST)
Received: from [134.226.53.245] (frascati.cs.tcd.ie [134.226.53.245])
	by smtp.cs.tcd.ie (Postfix) with ESMTP id 2D45D3C26
	for <linux-lvm@redhat.com>; Thu, 18 May 2006 10:00:28 +0100 (IST)
Message-ID: <446C37AB.104@cs.tcd.ie>
Date: Thu, 18 May 2006 10:00:27 +0100
From: Stephen Childs <childss@cs.tcd.ie>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Problem with creation of dev entries on SL (RHEL)
 4
References: <446B0DE9.6010004@cs.tcd.ie>
	<20060517184232.GC16774@percy.comedia.it>
In-Reply-To: <20060517184232.GC16774@percy.comedia.it>
Content-Transfer-Encoding: 7bit
Reply-To: Stephen.Childs@cs.tcd.ie,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Here's some snippets from the log:

activate/fs.c:176   Linking /dev/xenvg/gridmon_gridmon023__1147860249 -> 
/dev/mapper/xenvg-gridmon_gridmon023__1147860249
toollib.c:1087   Zeroing start of logical volume 
"gridmon_gridmon023__1147860249"
device/dev-cache.c:228   /dev/xenvg/gridmon_gridmon023__1147860249: Added 
to device cache
device/dev-io.c:425   Opened /dev/xenvg/gridmon_gridmon023__1147860249 RW 
O_DIRECT
device/dev-io.c:584   Wiping /dev/xenvg/gridmon_gridmon023__1147860249 at 
sector 0 length 8 sectors
device/dev-io.c:134   /dev/xenvg/gridmon_gridmon023__1147860249: block 
size is 4096 bytes
device/dev-io.c:456   Closed /dev/xenvg/gridmon_gridmon023__1147860249




metadata/metadata.c:1164   Found volume group "xenvg"
activate/dev_manager.c:1048   Getting device info for 
xenvg-gridmon_gridmon023__1147860249
ioctl/libdm-iface.c:1326   dm info 
IgMc4AcnOILtiudkjAXpuErUegVxunX66lb1awfZBR5rYYzIF64ogYnf98AcKHS0 O
mm/memlock.c:119   Unlocking memory
mm/memlock.c:138   memlock_count dec to 0
activate/fs.c:211   Removing link /dev/xenvg/gridmon_gridmon023__1147860249

The volume appears briefly in the /dev/mapper directory and then 
disappears again! How is this meant to work?

Stephen
-- 
