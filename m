Date: Sun, 29 Aug 1999 01:08:03 -0500 (CDT)
From: "Dominic J. Eidson" <sauron@the-infinite.org>
Subject: [linux-lvm] Re: LVM and devices
Message-ID: <Pine.LNX.4.05.9908290051330.29346-100000@morannon.kdi.com>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-LVM <linux-lvm@msede.com>


Heinz wrote:
> > It shouldn't be a big change to have LVM not STORE the device names in
> > the VGDA,
> 
> It doesn't use a stored devices name in the PV part of the VGDA today.
> The device name is inserted at PV read time (see pv_read()).
> 
> > and something like a pvscan is done at boot-time (after the LVM
> > module is loaded, if a module) to determine PV -> /dev mapping.  The LVM
> > kernel code would still use the device name/major+minor in memory to
> > access the devices, so there should be no performance impact outside a
> > small amount of scanning at boot time or when a new VG is imported.
> 
> What i meant with performance impact is the longer time to scan large
> /dev configurations in user space (vgscan, pvscan and friends).

Well, the way AIX currently does it(the only LVM I've had much exposure
to), is they store the PVID(s) (UUID?) of the disks in the volume group in
the VGDA. Then, when you import a VG, it scans the VGDA on the disk you
pass to the importvg command for the PVID's, scans the ODM (Object/Device
Database) for the disks that match the PVID's, and imports the disks into
the VG.

Sample output:

root@offhours4:/etc>lqueryvg -Atp hdisk0
Max LVs:        256
PP Size:        22
Free PPs:       141
LV count:       10
PV count:       1
Total VGDAs:    2
Conc Allowed    0
MAX PPs per     1016
MAX PVs:        32
Quorum Setti    0
Auto Varyon     0
Conc Autovar    0
Varied on Co    0
Logical:        00000716ba2d791d.1   hd5 1  
                00000716ba2d791d.2   hd6 1  
                00000716ba2d791d.3   hd8 1  
                00000716ba2d791d.4   hd4 1  
                00000716ba2d791d.5   hd2 1  
                00000716ba2d791d.6   hd9var 1  
                00000716ba2d791d.7   hd3 1  
                00000716ba2d791d.8   vardce 1  
                00000716ba2d791d.9   dumplv 1  
                00000716ba2d791d.10  dfscache 1  
Physical:       0000071652f96a88 2   0  

There is only one disk in the VG that hdisk0 is a part of (the rootvg on
my machine here at work), here is output on a multi-disk VG:

root@offhours4:/etc>lqueryvg -Atp hdisk1
Max LVs:        256
PP Size:        22
Free PPs:       682
LV count:       4
PV count:       2
Total VGDAs:    3
Conc Allowed    0
MAX PPs per     1016
MAX PVs:        32
Quorum Setti    0
Auto Varyon     1
Conc Autovar    0
Varied on Co    0
Logical:        00000716142a8786.1   usr_local_lv 1  
                00000716142a8786.2   loglv00 1  
                00000716142a8786.3   scratch_lv 1  
                00000716142a8786.4   home_lv 1  
Physical:       00000716b936212e 2   0  
                0000373337280ddd 1   0  

As you can see, the disks with PVID's (UUID's) of 00000716b936212e and
0000373337280ddd are part of this volume group.

root@offhours4:/etc>lspv
hdisk0         0000071652f96a88    rootvg         
hdisk1         00000716b936212e    datavg         
hdisk2         0000373337280ddd    datavg         

As you can see, hdisk1 and hdisk2 are the disks, both part of "datavg"...

Hmm - on second thought, I'm sure all of you've see the above before :)


-- 
Dominic J. Eidson
                                         "Baruk Khazad! Khazad ai-menu!" - Gimli
--------------------------------------------------------------------------------
http://www.the-infinite.org/               http://www.the-infinite.org/~dominic/
