Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8AHSR318821
	for <linux-lvm@redhat.com>; Fri, 10 Sep 2004 13:28:27 -0400
Received: from lax-gate5.raytheon.com (lax-gate5.raytheon.com [199.46.200.234])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8AHSPnE018823
	for <linux-lvm@redhat.com>; Fri, 10 Sep 2004 13:28:25 -0400
Received: from ds02w00.directory.ray.com (ds02w00.directory.ray.com
	[147.25.146.118])
	by lax-gate5.raytheon.com (8.12.10/8.12.10) with ESMTP id
	i8AHSJ9W017267
	for <linux-lvm@redhat.com>; Fri, 10 Sep 2004 10:28:24 -0700 (PDT)
Received: from ds02w00 (localhost [127.0.0.1])
	by ds02w00.directory.ray.com (Switch-3.1.4/Switch-3.1.0) with ESMTP id
	i8AHSFHZ003774
	for <linux-lvm@redhat.com>; Fri, 10 Sep 2004 17:28:15 GMT
Received: from ds02w00.directory.ray.com with LMTP by ds02w00
	(2.0.6/sieved-2-0-build-559)
	for <linux-lvm@redhat.com>; Fri, 10 Sep 2004 17:28:14 +0000
Received: from electra.rsc.raytheon.com (electra.RSC.RAYTHEON.COM
	[147.19.81.176])
	by ds02w00.directory.ray.com (Switch-3.1.4/Switch-3.1.0) with ESMTP id
	i8AHRcIi003565
	sender sawitt@zeus.rsc.raytheon.com for <linux-lvm@redhat.com>;
	Fri, 10 Sep 2004 17:27:38 GMT
Received: from zeus.rsc.raytheon.com ([147.19.81.175] ident=mail)
	by electra.rsc.raytheon.com with esmtp (Exim 4.34)
	id 1C5pBS-000301-62
	for linux-lvm@redhat.com; Fri, 10 Sep 2004 10:27:38 -0700
Received: from sawitt (helo=localhost)
	by zeus.rsc.raytheon.com with local-esmtp (Exim 3.35 #1 (Debian))
	id 1C5pBR-0002G9-00
	for <linux-lvm@redhat.com>; Fri, 10 Sep 2004 10:27:37 -0700
Date: Fri, 10 Sep 2004 10:27:37 -0700 (PDT)
From: Steve Witt <sawitt@electra.rsc.raytheon.com>
Message-ID: <Pine.LNX.4.61.0409101016330.8512@zeus.rsc.raytheon.com>
MIME-Version: 1.0
Sender: "Stephen A. Witt" <sawitt@zeus.rsc.raytheon.com>
Subject: [linux-lvm] LVM2 Device Permissions
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM <linux-lvm@redhat.com>

I've just set up my first RAID 5 array and LVM2 volumes on a Debian Linux 
(sarge) system. We do backups from another machine in our network using 
Amanda. In trying to add this LVM machine to our backup scheme, I've run 
into a problem with backing up the LVM volumes. Amanda (I suppose the 
local client) complains that it doesn't have permission to access the LVM 
directories. The LVM volumes have permissions of (/dev/mapper) :

brw-------  1 root root 254,  2 Sep  9 02:20 server_vg-home1_lv
brw-------  1 root root 254,  3 Sep  9 02:20 server_vg-home2_lv
brw-------  1 root root 254,  4 Sep  9 02:20 server_vg-home3_lv

These are mounted on (/export) :

drwxr-xr-x   6 root root 4096 Sep  7 23:00 home1
drwxr-xr-x  23 root root 4096 Sep  8 10:36 home2
drwxr-xr-x   3 root root 4096 Sep  7 15:06 home3


So it seems that I need to change the LVM device partition permissions. I 
couldn't find anything about this on the web, so I thought I'd ask here if 
this is the right thing to do and if there are any issues or problems I'll 
introduce?

Thanks...
