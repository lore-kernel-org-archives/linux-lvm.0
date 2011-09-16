Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p8GAfmrO002242
	for <linux-lvm@redhat.com>; Fri, 16 Sep 2011 06:41:48 -0400
Received: from mail-ey0-f174.google.com (mail-ey0-f174.google.com
	[209.85.215.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p8GAfcpd000916
	for <linux-lvm@redhat.com>; Fri, 16 Sep 2011 06:41:39 -0400
Received: by eya28 with SMTP id 28so1025737eya.33
	for <linux-lvm@redhat.com>; Fri, 16 Sep 2011 03:41:38 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 16 Sep 2011 11:41:38 +0100
Message-ID: <CAPbm57VXFxPNgGwh-sNZcgBqq4HDFTg2H_uAMdsnR+xYQ14Cfw@mail.gmail.com>
From: Joseph Graham <t67t67t67@gmail.com>
Subject: [linux-lvm] can't make snapshot
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

lvcreate --size 100M --snapshot --name root_snap /dev/VolGroup00/root
-vvv 2> outfile

http://ompldr.org/vYWRqbg/outfile

This seems to be the relevent error:

        Syncing device names
        Udev cookie 0xd4d33c5 (semid 19038208) decremented to 0
        Udev cookie 0xd4d33c5 (semid 19038208) waiting for zero
        Udev cookie 0xd4d33c5 (semid 19038208) destroyed
        VolGroup00-root_snap: Skipping NODE_ADD (254,14) 0:0 0600 [trust_udev]
        VolGroup00-root_snap: Processing NODE_READ_AHEAD 256 (flags=1)
  /dev/mapper/VolGroup00-root_snap: open failed: No such file or directory
    Clearing start of logical volume "root_snap"
      /dev/VolGroup00/root_snap: stat failed: No such file or directory
  /dev/VolGroup00/root_snap: not found: device not cleared
  Aborting. Failed to wipe snapshot exception store.
