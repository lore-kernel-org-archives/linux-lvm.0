Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s56NQU62010182
	for <linux-lvm@redhat.com>; Fri, 6 Jun 2014 19:26:30 -0400
Received: from mho-02-ewr.mailhop.org (mho-02-ewr.mailhop.org [204.13.248.72])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s56NQTMY011933
	for <linux-lvm@redhat.com>; Fri, 6 Jun 2014 19:26:29 -0400
Received: from 23-25-228-129-static.hfc.comcastbusiness.net ([23.25.228.129]
	helo=mail.enlj.com)
	by mho-02-ewr.mailhop.org with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.72) (envelope-from <me@mooluv.com>) id 1Wt3Wm-000AUf-Vw
	for linux-lvm@redhat.com; Fri, 06 Jun 2014 23:26:29 +0000
Received: from [192.168.1.22] (firewall [192.168.1.254])
	(using TLSv1 with cipher ECDHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by mail.enlj.com (Postfix) with ESMTPSA id 587AF3E06
	for <linux-lvm@redhat.com>; Fri,  6 Jun 2014 19:26:26 -0400 (EDT)
Message-ID: <53924E22.60403@mooluv.com>
Date: Fri, 06 Jun 2014 19:26:26 -0400
From: Leeman Strout <me@mooluv.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm Bug? - bad reaction to snapshot creation
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
To: linux-lvm@redhat.com


Creating a snapshot throws an error "Attempted to decrement suspended 
device counter below zero." but succeeds.  Removing the snapshot fails, 
attempting a 2nd time succeeds.  Somewhere in this process the original 
LV gets locked and the system needs to be restarted to unlock it.  As 
explained below this happens intermittently but regularly.


Any additional info please let me know directly, I am not a subscriber,
Leeman

----
log file: http://www.enlj.com/lvm.txt
lvm config: http://www.enlj.com/lvmconfig.txt

Arch Linux, lvm2 2.02.106-2

line 1: lvcreate -L1G -s -n srvrootsnap /dev/ssd.vg/server-root
   Attempted to decrement suspended device counter below zero.
   Logical volume "srvrootsnap" created
line 148+: why? globalfilter = [ "a|/dev/md|", "r|.*|" ]
line 921: after this point I do udevadm settle
no output from udevadm settle
line 923: lvremove -f /dev/ssd.vg/srvrootsnap - fails
   Unable to deactivate open ssd.vg-srvrootsnap-cow (253:3)
   Failed to activate srvrootsnap.
   Releasing activation in critical section.
   libdevmapper exiting with 1 device(s) still suspended.
line 1567: lvremove -f /dev/ssd.vg/srvrootsnap - again, works this time
   Logical volume "srvrootsnap" successfully removed

However, /dev/ssd.vg/server-root is locked up, the VM seizes as no data
can be written to the volume. I have to restart the entire system to
unlock the volume.

This doesn't happen all the time.  It happens every time I do a backup.
1 of the 7 LV snapshots created for the job, not always the same one.

hardware: Supermicro X9DR3-F,
onboard SATA controller:
00:1f.2 SATA controller: Intel Corporation C600/X79 series chipset 
6-Port SATA AHCI Controller (rev 06)
/dev/md0 consists of 2 Seagate 600 240GB SSDs on that controller
/dev/ssd.vg consists of /dev/md0
