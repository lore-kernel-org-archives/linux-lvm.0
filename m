Return-Path: <fabian.herschel@suse.de>
From: fabian herschel <fabian.herschel@suse.de>
Date: Tue, 24 Apr 2001 19:00:59 +0200
MIME-Version: 1.0
Message-Id: <01042419005900.11967@workstation>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] vgscan does not found my VG, but pvscan does...
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: fabian@suse.de

Hi *,

I have a strage problem on my Desktop. I have installed Kernel 2.2.18 
and lvm 0.9.

All things have been fine till this morning. I have increased a logical volume
(and the reiserfs which resides on that volume) from 1000M to 2000M (not 2GB).

Some time later I had to reboot the machine (because I want to attach some 
devices to the SCSI bus). After the reboot vgscan does NOT find my VG any
longer. It only says something like "no voulme group found".

If I call pvscan it tells me that it found two physical disks (thats ok). But 
both  PVs are in an unknown VG. I should call vgscan (but see obove :-)

Then I called pvdata to find out something out about whats going wrong here.

pvdata -a /dev/sda1 ; pvdata -a /dev/sda2 ; are working fine , they also tell 
me that these PVs are members of sysvg.

Does anybody have an idear how to get vgscan to read this info?
pvdata finds members of a VG but vgscan does not :-((.

I hope someone can help me!!
(Yes I do have backup data, but I want to sleep well, if there are so many
lvm installations out in the world).

Best regards,
Fabian Herschel
