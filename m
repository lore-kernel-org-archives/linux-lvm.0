Message-ID: <4011D696.1020408@digitalgenus.com>
From: dGenus Mailing List <ml@digitalgenus.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] VG Recovery off multiple PV's
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
Date: Fri Jan 23 21:19:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Well... I've got myself in a bit of a bind, and spending close to 24 
hours trying to fix a problem I have with LVM, and browsing the 
internet, I've come to the conclusion that I need some expert help!!

Problem: Disk died in LVM... I madly tried to move the PE's off the 
drive, and managed to get all but teh offending PE's off to new drives i 
added to the system. (no 42 wouldn't you know it... thought it was the 
answer not the question...) .  Thought I was ok, until the drive locked 
again, and I had to reboot. 

When it came back, I had a vg which wouldn't be recognised after 
vgchange and vgscan, with lots of various errors, most of which I've 
seen similar examples for here.   I upgraded the lvm to lvm2 and kernel 
to 2.6 to see whether I could get it all going using the partial mount.  
Anyways, here is what I get from the various outputs.

[root@wren pictures]# lvm pvscan
  4 PV(s) found for VG data: expected 5
  VG data differs between PVs /dev/hde1 and /dev/hdg2
  VG data differs between PVs /dev/hde1 and /dev/hda8
  VG data differs between PVs /dev/hde1 and /dev/hdh1
  2 PV(s) found for VG pictures: expected 3
  Logical volume (lv_pictures) contains an incomplete mapping table.
  PV /dev/hdg1   VG data       lvm1 [60.50 GB / 0    free]
  PV /dev/hde2   VG data       lvm1 [68.75 GB / 0    free]
  PV /dev/hdb    VG data       lvm1 [55.84 GB / 0    free]
  PV /dev/hdf2   VG data       lvm1 [53.06 GB / 0    free]
  PV /dev/hde1   VG pictures   lvm1 [2.75 GB / 0    free]
  PV /dev/hdf1   VG pictures   lvm1 [2.75 GB / 0    free]
  Total: 6 [0   ] / in use: 6 [0   ] / in no VG: 0 [0   ]

Now I can quite happily see the volumes in the missing vg (in this case 
pictures).

# lvm pvdisplay /dev/hde1  
  --- Physical volume ---
  PV Name               /dev/hde1
  VG Name               pictures
  PV Size               2.79 GB / not usable 45.55 MB
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              88
  Free PE               0
  Allocated PE          88
  PV UUID               uJqHOZ-puzh-6m8D-04dP-v3np-0Fj5-dh1CDY
  
# lvm pvdisplay /dev/hdf1
  --- Physical volume ---
  PV Name               /dev/hdf1
  VG Name               pictures
  PV Size               2.79 GB / not usable 45.55 MB
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              88
  Free PE               0
  Allocated PE          88
  PV UUID               FJh4Dl-2KPf-LyHK-8I3F-LAsk-hJ0x-0svzu4
  
# lvm pvdisplay /dev/hdh1
  --- Physical volume ---
  PV Name               /dev/hdh1
  VG Name               pictures
  PV Size               4.66 GB / not usable 32.77 MB
  Allocatable           yes (but full)
  PE Size (KByte)       32768
  Total PE              148
  Free PE               0
  Allocated PE          148
  PV UUID               63LnM2-4MsC-Lg7I-st7o-xKcX-LHNy-BFYPtz
  
# lvm pvdisplay /dev/hdg2

  --- Physical volume ---
  PV Name               /dev/hdg2
  VG Name               pictures
  PV Size               13.99 GB / not usable 51.58 MB
  Allocatable           yes
  PE Size (KByte)       32768
  Total PE              446
  Free PE               445
  Allocated PE          1
  PV UUID               KW087O-c77n-k7Hf-4TCn-6MpM-Kf6L-izuYBv

And when I try a vgchange this is what happens:

# lvm vgchange -P -a y pictures
  Partial mode. Incomplete volume groups will be activated read-only.
  VG data differs between PVs /dev/hde1 and /dev/hdg2
  VG data differs between PVs /dev/hde1 and /dev/hda8
  VG data differs between PVs /dev/hde1 and /dev/hdh1
  2 PV(s) found for VG pictures: expected 3
  Logical volume (lv_pictures) contains an incomplete mapping table.
  VG data differs between PVs /dev/hde1 and /dev/hdg2
  VG data differs between PVs /dev/hde1 and /dev/hda8
  VG data differs between PVs /dev/hde1 and /dev/hdh1
  2 PV(s) found for VG pictures: expected 3
  Logical volume (lv_pictures) contains an incomplete mapping table.
  VG data differs between PVs /dev/hde1 and /dev/hdg2
  VG data differs between PVs /dev/hde1 and /dev/hda8
  VG data differs between PVs /dev/hde1 and /dev/hdh1
  2 PV(s) found for VG pictures: expected 3
  Logical volume (lv_pictures) contains an incomplete mapping table.
  1 logical volume(s) in volume group "pictures" now active

But I can't get it mounted, although the entry exists in /dev/mapper

ls -l /dev/mapper
total 0
crw-------    1 root     root      10,  63 Jan 24 13:49 control
brw-------    1 root     root     254,   0 Jan 24 14:11 data-lv_data
brw-------    1 root     root     254,   1 Jan 24 14:11 pictures-lv_pictures

The logical link is connected to /dev/data/lv_data, but none for 
/dev/pictures/lv_pictures

Now my main question is, and I'm hoping this is possible.  Can I list 
the PE's on the drives in question and then rebuild the VG in some way 
by manually specifying these LE/PE's?  When I did a vgcfgbackup I got a 
file with a lot of missing segments.  I'd like to manually specify the 
extents and rebuild the vg.

The reason for persisting??  My wife is a photographer and you can 
imagine what's on this lvm.....

Hoping someone can help I can provide further information if need be.
