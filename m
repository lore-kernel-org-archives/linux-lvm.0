Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4FA4F001538
	for <linux-lvm@redhat.com>; Sat, 15 May 2004 06:04:15 -0400
Received: from hotmail.com (bay18-f54.bay18.hotmail.com [65.54.187.104])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i4FA498K029336
	for <linux-lvm@redhat.com>; Sat, 15 May 2004 06:04:09 -0400
From: "Bob Goddard" <bib_aab@hotmail.com>
Date: Sat, 15 May 2004 10:04:03 +0000
Mime-Version: 1.0
Message-ID: <BAY18-F54PzADZgsSTF000262e9@hotmail.com>
Subject: [linux-lvm] lost all logical volumes
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I was reinstalling the O/S when I created a new LVM2 volume group over the
existing LVM1 partition. It was named system but was recreated as system2.

vgscan -v gives:
    Wiping cache of LVM-capable devices
    Wiping internal cache
  Reading all physical volumes.  This may take a while...
    Finding all volume groups
    Finding volume group "system"
  Found volume group "system" using metadata type lvm2
    Finding volume group "system2"
  Found volume group "system2" using metadata type lvm1

while vgchange -ay gives:
  8 logical volume(s) in volume group "system" now active
  0 logical volume(s) in volume group "system2" now active

No logical volumes were recreated and hence were not formatted.
Is there any way to recover these or do I have to resort to a disk editor.


Bob Goddard

_________________________________________________________________
Want to block unwanted pop-ups? Download the free MSN Toolbar now!  
http://toolbar.msn.co.uk/
