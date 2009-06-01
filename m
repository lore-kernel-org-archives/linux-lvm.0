Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n516eB2B015707
	for <linux-lvm@redhat.com>; Mon, 1 Jun 2009 02:40:11 -0400
Received: from kcout02.prserv.net (kcout02.prserv.net [12.154.55.32])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n516dq7h022646
	for <linux-lvm@redhat.com>; Mon, 1 Jun 2009 02:39:53 -0400
Message-ID: <4A2377B0.4000707@attglobal.net>
Date: Sun, 31 May 2009 23:39:44 -0700
From: Eddie Atherton <stunnel@attglobal.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] highmem64G Breaks My LVM
Reply-To: stunnel@attglobal.net,
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

I originally posted this on the LinuxQuestions forum:  
http://www.linuxquestions.org/questions/slackware-14/highmem64g-kills-lvm-728418/

I have a fairly vanilla Slack 12.2 system.  I recently upped my memory 
to 8GB, and so recompiled the kernel, making a single change.  HIGNMEM4G 
was changed to HIGHMEM64G.  On re-booting, I could see the extra memory, 
but, unfortunately, I lost all my LVM volumes.

After a few checks, I found that vgscan was failing:

root@The-Tardis:~# vgscan --mknodes --verbose
    Wiping cache of LVM-capable devices
    Wiping internal VG cache
  Reading all physical volumes.  This may take a while...
    Finding all volume groups
  /dev/sda1: Checksum error
    Finding all logical volumes

If I reboot back to the HIGHMEM4G kernel, then all works fine again:

root@The-Tardis:~# vgscan --mknodes --verbose
    Wiping cache of LVM-capable devices
    Wiping internal VG cache
  Reading all physical volumes.  This may take a while...
    Finding all volume groups
    Finding volume group "raid_vg"
  Found volume group "raid_vg" using metadata type lvm2
    Finding all logical volumes

All the LVM volumes reside on an LSI megaRAID card, detected as 
/dev/sda, which is dedicated to a single PVM.

Any ideas why changing the HIGHMEM kernel option would break LVM.

Cheers,
Eddie
