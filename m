Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m92IvlhP010230
	for <linux-lvm@redhat.com>; Thu, 2 Oct 2008 14:57:47 -0400
Received: from mailhost.auckland.ac.nz (moe.its.auckland.ac.nz [130.216.12.35])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m92IvVRn014147
	for <linux-lvm@redhat.com>; Thu, 2 Oct 2008 14:57:36 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mailhost.auckland.ac.nz (Postfix) with ESMTP id 46F3948146A
	for <linux-lvm@redhat.com>; Fri,  3 Oct 2008 07:57:30 +1300 (NZDT)
Received: from mailhost.auckland.ac.nz ([127.0.0.1])
	by localhost (moe.its.auckland.ac.nz [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id odfksQrBACB9 for <linux-lvm@redhat.com>;
	Fri,  3 Oct 2008 07:57:30 +1300 (NZDT)
Received: from esp104.esc.auckland.ac.nz (esp104.esc.auckland.ac.nz
	[130.216.209.104])
	by mailhost.auckland.ac.nz (Postfix) with ESMTP id 2D26E481466
	for <linux-lvm@redhat.com>; Fri,  3 Oct 2008 07:57:29 +1300 (NZDT)
Received: from localhost.localdomain (esp104 [127.0.0.1])
	by esp104.esc.auckland.ac.nz (Postfix) with ESMTP id D5C9C187D6
	for <linux-lvm@redhat.com>; Fri,  3 Oct 2008 07:57:29 +1300 (NZDT)
Message-ID: <2429.128.187.150.9.1222973849.squirrel@mail.esc.auckland.ac.nz>
Date: Fri, 3 Oct 2008 07:57:29 +1300 (NZDT)
From: michael.osullivan@auckland.ac.nz
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Can't create LV in cluster
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
To: linux-lvm@redhat.com

Hi everyone,

I have created a 2-node cluster and (after a little difficulty) created a
clustered volume group visible on both nodes. However, I can't create a
logical volume on either node. I get the following error:

Error locking on node <other node>: Error backing up metadata, can't find
VG for group #global
Aborting. Failed to activate new LV to wipe the start of it.

I have locking_type = 3 and locking_library = liblvm2clusterlock.so. The
metadata areas and sequence nos are the same using vgdisplay on both
nodes.

Can anyone help me create LVs? I am happy to provide any extra info needed.

Thanks, Mike
