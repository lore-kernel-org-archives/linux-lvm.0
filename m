Message-ID: <39752C4D.D07D0F2C@marxmeier.com>
Date: Wed, 19 Jul 2000 06:19:25 +0200
From: Michael Marxmeier <mike@msede.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] made a big misstake
References: <200007182303.TAA20264@e35.marxmeier.com>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@marxmeier.com, bagfors@pdc.kth.se

Andreas Dilger wrote:
> Erik writes:
> > Now the misstake, I did not run a vgreduce before I fdisk'ed the whole
> > disk (hdb).  Now when I start up, vgscan cannot find any vg's.
> 
> Was hdb1 the first PV created in the VG?  The problem, I think, is that
> Linux LVM only keeps the VGDA on the first PV.  AIX will keep a VGDA
> copy on all of the PVs, and even will keep 2 VGDAs on the first PV for
> backup, in case the first one is corrupt.

Actually, LVM should have a copy of the dscriptor area. It is kept in
the file system in the directory /etc/lvmconf which even has the nice
property that you can back it up. The VGDA is implecitely backed up by 
most LVM  commands. 

You should be able to restore them with vgcfgrestore.
The vgcfgrestore syntax seems to sugest you can even restore it
to another physical volume (no tested, personally) which would
solve the actual problem nicely.


Hope this helps
Michael

-- 
Michael Marxmeier           Marxmeier Software AG
E-Mail: mike@msede.com      Besenbruchstrasse 9
Phone : +49 202 2431440     42285 Wuppertal, Germany
Fax   : +49 202 2431420     http://www.msede.com/
