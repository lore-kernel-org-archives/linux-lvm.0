From: CHUCK_MUNRO@HP-Canada-om1.om.hp.com
Date: Wed, 1 Sep 1999 16:00:11 -0400
Message-Id: <H00000fa0c2cec2a@MHS>
Subject: [linux-lvm] More thoughts on Linux LVM+RAID
MIME-Version: 1.0
Content-Disposition: inline; filename="BDY.TXT"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; name="BDY.TXT"
To: linux-lvm@msede.com


I have been reading the thread regarding Linux RAID and LVM with great interest 
(since joining the list today :-).  Please forgive this new thread ... I still 
need to learn how to use the list properly.

I have been using HP LVM with mirroring for several years, and have come to 
expect this arrangement to be configurable without a lot of fuss on HP-UX 
machines.  For this reason I am very interested in seeing the same 
functionality on Linux.

Let's hope the LVM petition succeeds, but are we not dangerously close to 
Linus' freeze date?

I currently use Linux MD mirroring on my firewall/web-server machine at home, 
but have discovered that recovery from disk faults is NOT painless  :-)    I 
implemented full mirroring of the entire boot process by using a Promise 
FastTRACK IDE RAID card to boot a tiny mirrored DOS C: drive (the card nicely 
provides this in its own BIOS).  From there I use loadlin to boot an initrd 
Linux, which activates a RAID-1 root filesystem, switches to it, and so on 
......

This is soooo UGLY, but it has rescued my firewall twice so far.

I would like to encourage a merge of LVM and RAID (at least RAID-0 and 1), with 
the realization that the ease with which HP-UX boots a mirrored root disk would 
involve a lot of kernel changes in Linux.

One remaining snag would then be to work around the BIOS' inability to 
recognize a secondary boot path if the primary one fails (which HP machines 
have been able to do for many years).  I can't think of any solution here 
except for a Promise-like bit of IDE hardware.  The current crop of SCSI 
hardware-RAID controllers (AMI, Mylex, DPT, etc.) are just too expensive for my 
personal budget.

My 2 cents' worth, anyway.

Sincere thanks for the great work with LVM!

Chuck Munro
chuck_munro@hp.com
