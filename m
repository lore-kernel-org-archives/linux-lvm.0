Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8T0Cfg1029603
	for <linux-lvm@redhat.com>; Thu, 28 Sep 2006 20:12:41 -0400
Received: from bay0-omc1-s12.bay0.hotmail.com (bay0-omc1-s12.bay0.hotmail.com
	[65.54.246.84])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8T0CdF3001026
	for <linux-lvm@redhat.com>; Thu, 28 Sep 2006 20:12:39 -0400
Message-ID: <BAY123-DAV4AEAB45F81E2062D8FA0CAC1B0@phx.gbl>
From: "Jamie Burns" <fantasticjamieburns@hotmail.com>
Date: Fri, 29 Sep 2006 00:39:18 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Cluster Question
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: linux-lvm@redhat.com

Hello,

I am trying to create a single 400GB logical volume, that is made up from 2 
seperate 200GB disks. The fun part is that the 2 seperate disks are located 
on 2 seperate machines, and they each export to the other via AOE (ATA over 
Ethernet). All appears to be fine if I use one of the machines to create the 
2 physicial volumes and a volume group - the other machine can detect and 
use the volume group perfectly. The 2 disks will use the OCFS2 filesystem in 
a logical volume, so the filesystem layer is taken care of.

Am I right to think if I only ever manage the metadata from a single 
machine, no corruption will occur ?

Is metadata only ever changed whilst using the commands pv* vg* and lv* ?

Thanks!

Jamie. 
