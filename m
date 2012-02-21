Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q1L8ekJL007578
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2012 03:40:46 -0500
Received: from zimbra.agenda.si (mail.agenda.si [178.79.70.59])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q1L8eiMo022529
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2012 03:40:45 -0500
Received: from [172.16.0.214] (barbie.agenda.si [172.16.0.214])
	by zimbra.agenda.si (Postfix) with ESMTPSA id 25BD91234399
	for <linux-lvm@redhat.com>; Tue, 21 Feb 2012 09:40:44 +0100 (CET)
Message-ID: <4F43588B.8040202@agenda.si>
Date: Tue, 21 Feb 2012 09:40:43 +0100
From: Danilo Godec <danilo.godec@agenda.si>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Duplicate PV's - how does LVM choose which one to use
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi,

I had VG's and LV's on top of a Linux MD RAID1 array using two iSCSI 
volumes. Apparently this RAID1 array wasn't started properly after a 
reboot, so LVM detected two duplcate PV's (both RAID1 members had the 
same PV UUID) and chose to use one of them. Unfortunately I didn't 
notice it so it ran like that for a while.

I was lucky and the machine was only rebooted once, so LVM used the same 
PV all the time, but what would happen on a next reboot?

How does LVM decide which one to use?  Will it always choose the same one?


    Thanks, Danilo
