Message-ID: <38EF1365.F5F75620@ednet.ns.ca>
Date: Sat, 08 Apr 2000 08:09:25 -0300
From: Patrick Boutilier <boutilpj@ednet.ns.ca>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Vgscan problem
References: <200004072157.XAA32301@u9etz.ez-darmstadt.telekom.de>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Heinz Mauelshagen <mauelsha@ez-darmstadt.telekom.de>
Cc: macleajb@ednet.ns.ca, linux-lvm@msede.com

Heinz,

I think I may know how I caused my problem. Do you think this may be the cause of
the problem?

I have /dev/data_vg shown below:

--- Volume group ---
VG Name               data_vg
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                6
Open LV               5
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               133.36 GB
PE Size               4 MB
Total PE              34140
Alloc PE / Size       27125 / 105.96 GB
Free  PE / Size       7015 / 27.4 GB

Here is the info for the PV:

--- Physical volume ---
PV Name               /dev/sda7
VG Name               data_vg
PV Size               133.36 GB / NOT usable 321 KB [LVM: 255 KB]
PV#                   1
PV Status             available
Allocatable           yes
Cur LV                6
PE Size (KByte)       4096
Total PE              34140
Free PE               7015
Allocated PE          27125


/dev/sda is actually a RAID 5 array of 5 x 36 Gig drives on a Dell Perc2/SC (AMI
Megatrends).

The 6 LVs are /dev/data_vg/home_lv, /dev/data_vg/var_lv,  /dev/data_vg/usr_lv,
/dev/data_vg/news_lv, /dev/data_vg/its_lv, and /dev/data_vg/test_lv   All LV are
19.53 Gig in size except test_lv which is 3.42 Gig

I think my problem arose on April 3rd when I created /dev/data_vg/its_lv and
mounted it as /usr/local/its  The problem here is that /dev/data_vg/usr_lv is
mounted as /usr   I then moved/rsynced /usr/local/vmware/* (on usr_lv) to
/usr/local/its/vmware/* (on its_lv)

So I am thinking that mounting a LV inside another LV and moving data is probably
what messed me up. Does this make any sense?


To get out of this mess I am thinking of using this scenario. I now have
/dev/data_vg/its_lv mounted as /data of the / which is not part of any LV. I have
this file from /etc/lvmconf which is the latest file before April 3rd when I made
the changes.

579300 Feb 23 15:36 data_vg.conf.4.old

vgcfgrestore -t -f /etc/lvmconf/data_vg.conf.4.old -n data_vg -l      shows this:

-- Volume group ---
VG Name               data_vg
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                256
Cur LV                5
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               133.36 GB
PE Size               4 MB
Total PE              34140
Alloc PE / Size       22125 / 86.43 GB
Free  PE / Size       12015 / 46.93 GB


That would give me the 5 LVs without /dev/data_vg/its_lv

I would then backup the data on /dev/data_vg/its_lv and then use this command to
restore the VGDA?

vgcfgrestore -f /etc/lvmconf/data_vg.conf.4.old -n data_vg

If so would I need to delete the /dev/data_vg/its_lv before running the previous
command or would it matter?

Thanks for your help.


Heinz Mauelshagen wrote:

> Hi Patrick,
>
> the error number tells you that the amount of logical extents found in
> the mapping tables for e specific logical volumes differs from the
> amount expected -> metedata inconsistency.
>
> Could you provide a complete "vgscan -d" output to better anaylze this?
>
> In the meantime please save your /etc/lvmconf/ VGDA backup files to
> enable you to restore a consistent state of your VGDAs to the PVs.
> Please read vgcfgrestore(8) for this issue.
>
> Heinz
>
> > I am getting the following EROR -364 when running vgscan. The volume
> > group and logical volumes are actually in use and reiser filesystems
> > mounted on them.
