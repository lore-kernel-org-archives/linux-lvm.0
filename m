From: <mikeywoll@cox.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20020808044250.DBLK14593.fed1mtao02.cox.net@smtp.west.cox.net>
Subject: [linux-lvm] Trouble recovering physical volumes
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
Date: Wed Aug  7 23:42:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I improperly shutdown my pc which resulted in a system  
that would not boot.  The root partition is on a logical  
volume called root (/dev/hda2) of the volume group vg1,   
vg1 also contains a logical volume called home  
(/dev/hda6).  Booting would freeze with a vg_read... 
error.  I have another computer with lvm installed, and 
the drive worked fine on there (I did not try it as the 
booting drive).  Because I installed the drive in a 
working computer, I have a working backup of the 
lvmtab/lvmconf stuff. I followed instructions on this list 
for restoring a lost volume.  (pvcreate -ff /dev/hda2..., 
vgcfgrestore -n vg1 /dev/hda6, vgchange -ay) The restore 
fails at vgcfrestore with the error "physical volume 
/dev/hda6 doesn't belong to volume group vg1."  The 
logical volume is no longer working in either system.  I 
installed the broken drive in my working pc as the primary 
master, and have a working system as the secondary master.  
I can boot off the second drive, and work on the broken 
lvm with the physical drive paths maintained.  I restored 
my lvmtab, lvmtab.d, and lvmconf files by hand. 
 
vgchange -ay gives the following error: 
 
physical volume /.......lun0/part6 of volume group vg1 is 
offline 
physical volume /...../lun0/part6 of volume group vg1 is 
inconsistent 
vgchange -- run vgscan 
 
Running vgscan runs as if there are no volume groups 
defined, and overwrites the lvmtab/lvmconf stuff with 
blank files. 
 
running pvdata on the partitions shows the correct data 
for my original setup, however it segfaults. 
 
Is there any way to reset the physical volumes so that 
vgcfgrestore can do its magic?? 
 
thanks in advance for any help. 
 
 
mike 
