Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4HBoE8l028858
	for <linux-lvm@redhat.com>; Wed, 17 May 2006 07:50:14 -0400
Received: from smtp.cs.tcd.ie (relay.cs.tcd.ie [134.226.32.56])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4HBo6U7031298
	for <linux-lvm@redhat.com>; Wed, 17 May 2006 07:50:06 -0400
Received: from localhost (localhost [127.0.0.1])
	by relay.cs.tcd.ie (Postfix) with ESMTP id 8013C3C9D
	for <linux-lvm@redhat.com>; Wed, 17 May 2006 12:50:05 +0100 (IST)
Received: from smtp.cs.tcd.ie ([127.0.0.1])
	by localhost (smtp.cs.tcd.ie [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 13544-16 for <linux-lvm@redhat.com>;
	Wed, 17 May 2006 12:50:02 +0100 (IST)
Received: from [134.226.53.245] (frascati.cs.tcd.ie [134.226.53.245])
	by smtp.cs.tcd.ie (Postfix) with ESMTP id 4E5433B7E
	for <linux-lvm@redhat.com>; Wed, 17 May 2006 12:50:02 +0100 (IST)
Message-ID: <446B0DE9.6010004@cs.tcd.ie>
Date: Wed, 17 May 2006 12:50:01 +0100
From: Stephen Childs <childss@cs.tcd.ie>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Problem with creation of dev entries on SL (RHEL) 4
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
To: linux-lvm@redhat.com

When I create a new LVM volume on Scientific Linux 4 (RHEL4-compatible), a 
new entry isn't created in /dev, meaning that I can't access the volume 
although it exists.

Creation succeeds:

[root@tg23 mapper]# /usr/sbin//lvcreate -s '-L1024M' -n 
'/dev/xenvg/gridmon_gridmon023__1147860249' /dev/xenvg/gridmon
   Logical volume "gridmon_gridmon023__1147860249" created

Mount fails:

[root@tg23 mapper]# mount '/dev/xenvg/gridmon_gridmon023__1147860249' 
'/mnt/gridmon_gridmon023__1147860249'
mount: special device /dev/xenvg/gridmon_gridmon023__1147860249 does not exist

dev entry doesn't exist:

[root@tg23 mapper]# ls /dev/xenvg/gridmon_gridmon023__1147860249
ls: /dev/xenvg/gridmon_gridmon023__1147860249: No such file or directory

These were created before an upgrade from RH9:

[root@tg23 mapper]# ls /dev/xenvg/
gridgate_gridgate_wit_ie__1127224256    gridmon_gridmon__swap 
     sl304_1                   wnclonetest
gridmon_gridmon_ait_ie__swap            gridmon_gridmon_ucc_ie__swap 
     sl304_lfc__swap           wnclonewn50
gridmon_gridmon_grid_ul_ie__1127238733 
gridstore_gridstore_grid_ul_ie__swap  sl304_lfc.testgrid__swap
gridmon_gridmon_it-tallaght_ie__swap    gridui_gridui_dit_ie__swap 
     ttyl2base
gridmon_gridmon_scg_nuigalway_ie__swap  rh9server 
     wnclonecagnode89

I have the following error in /var/log/messages:

May 17 12:47:10 tg23 /sbin/hotplug: no runnable /etc/hotplug/block.agent 
is installed

I have the default hotplug package installed and can't find any source for 
  a hotplug block.agent.

Any ideas?


Stephen
