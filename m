From: "Andre Bonhote" <andre@bonhote.com>
Message-ID: <EHEDIKGDCNFCNANFPGCDAENOCAAA.andre@bonhote.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM Recovery (urgent)
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
Date: Wed Jan  8 08:34:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: Linux-LVM@Sistina.com, Mauelshagen@sistina.com
Cc: beat@rubis.ch

Hi Heinz

Since I was not sure if you really understand the german tongue, so I write
in english. You're really kind of my last resort concerning my problem.

You might ask why I don't write to one of the mailing lists. Well, the
answer is quite simple: I don't trust them in this case. I don't think I
have many tries left to save my data, so I need a real expert advice. Don't
ask about a backup, there's none. And this is just one of my major faults.
But maybe I found a bug, we'll see. Let me describe my problem and what I
did first.

My setup is as following:
 - 2 SCSI drives, 18/9 GB
 - 1 IDE drive, 80 GB
 - Redhat 8.0, with
   - / on LVM (!! Redhat allows this without warning. I didn't know about
the
     dangerosity)
   - /boot on a standard ext3 partition
   - /home, respectively /new-home on LVM, which is my major concern.
 - I have/had one VG, /dev/CaradhrasVG/ spanning first the two SCSI disks.
   Yesterday I added the IDE disk to this VG.
   - /dev/CaradhrasVG/RootVG holding the /(remember this name!). Here, also
     /new-home and /home is located
   - /dev/CaradhrasVG/HomeLV, formatted with ext3 but empty. It was intended
to
     copy the homes here lateron.

Fdisk shows this:
/dev/sda:
 255 heads, 63 sectors, 1106 cyls
 /dev/sda1,Bootable,Start:1,End:13,Blocks:104391,83/Linux
 /dev/sda2,-,Start:14,End:1106,Blocks:8779522+,8e/LinuxLVM

/dev/sdb
 2231 cyls
 /dev/sdb1,Bootable,Start:1,End:2231,Blocks:17920476,8e/LinuxLVM

/dev/hdc
 fdisk -l shows no output. There's no partitioning. I did pvcreate /dev/hdc.

Ok, yesternight I added my IDE drive /dev/hdc to the VG. With the new space
inside the VG I decided to create the HomeLV using the whole new space.
Doing this (which ran fine and without any hassle), I found that the Root
Volume had the wrong name (RootVG instead of RootLV). So I changed its name
using "lvrename". After that, I changed the entry in /etc/fstab. First big
mistake. The result was, that no booting was possible with an error message
like that:

 mount: error 2 mounting ext3
 pivotroot: pivot_root(/sysroot,/sysroot/initrd) failed: 2
 umount /initrd/proc failed: 2

A search on google brought exactly two japanese pages. A different search
showed up a lot of different error codes, but not "error 2".

Since Redhat offers the "linux rescue" mode on their CD, I tried that, and
voil�! it worked. But here, I obviously did my second (but less serious
IMHO) mistake. Without being in a chrooted environment, I changed the name
of RootLV back to RootVG. After booting from disk, my RH installation booted
and found init but failed to fsck /. Simply because the Volume was still
somehow named RootVG, but mounted as RootLV.

Then all went very fast. It was almost three o'clock in the morning and I
was very tired and angry about myself, this is obviously one of the reasons
why I commited such stupid, stupid mistakes. But here we go.

I decided to extract the (unused? no!) IDE drive from the VG to store the
important data in some safe place. Again, with RH's rescue CD but WITHOUT
chroot. When I issued "vgreduce CaradhrasVG /dev/hdc", vgreduce answered
with an error message like "it's in use. don't do that". Well, I thought in
my fever that it means the VG which was in use. Therefore I rebooted with
the CD but I didn't mount the OS on the disks at all, which I thought would
allow me to vgreduce. It worked, but with an error message which I don't
remember. I personally think that the label on /dev/hdc has been removed but
no (which?) config files have been updated. Could this be a bug? Well,
anyway, after a reboot with the RH CD there was just the message "Could not
find a valid RedHat Installation". Bang-boom. "vgscan -v" shows this:

...
reading data of volume group "CaradhrasVG" from physical volume(s)
ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of volume group
 "CaradhrasVG" from physical volumes
...

For me, this shows that if /dev/hdc would be added to the VG again, it could
work.

You know, I don't care about my personal data. But on these disks, we have
around 3100 pictures of our kids of which I don't have a solid backup (some
months are missing), and all my wife's E-Mails (which was just too big to
store on a CD Rom) plus some very, very old compuserve mails which document
how my wife and I met several years ago. It's memory, without backup. That's
also why I don't trust the mailing lists: It's just too important to me and
my wife! I hope you understand that and accept it as a reason why I am
bothering you personally.

I don't know the LVM internals, but I have several ideas how I could bring
the data back. I am kindly asking you to point out IF there's a way to fix
it, and if yes, how I could do it. Here's what I was thinking of.

- I could try (under your lead if possible) to bring /dev/hdc back into the
CaradhrasVG
  so that I can redo what I wanted to (extract hdc), but CLEANLY this time.
IMHO this is
  the safest solution, if it's possible. As I said, I don't know how LVM
rally works,
  but I guess that you store information about the VG membership somewhere
on the drive
  itself. If yes, there could be a chance to recover that (hopefully).

- The second approach (which I don't like that much) is to remove the hdc
from the VG
  somehow. But since I don't have access to /etc, I have no clue how to
manage this.

- The third possible approach (which I really don't like) is to try to
access /home and
  /new-home on the VG directly somehow. I am quite sure that only the SCSI
disks are used
  by the VG, but not 100%

This mail will go in CC to Beat Rubischon, a veteran unix admin and head of
the LUGS. He agreed to help me sorting out this mess.

Heinz, I really hope you feel my desesperation. I have no clue how to
proceed best from here, but I also don't want to accept that all data is
lost. It's just too emotionally important to us. Memories.

Thank you very much in advance. I am really looking forward to hearing from
you soon, and if it's only a line like "yes, I have read your mail and I am
thinking about it" or something similar. This would set me a bit at ease.

Yours Sincerely

Andr� Bonhote

--
Andre Bonhote - Foehrenweg 6 - CH-8956 Killwangen
P: +41564011734  M: +41797069322  F: +41564011712
Pers: andre@bonhote.com Bus:andre.bonhote@colt.ch
