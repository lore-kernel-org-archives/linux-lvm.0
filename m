Date: Sat, 14 Oct 2000 14:28:39 +0930 (CST)
From: Mark Phillips <mark@ist.flinders.edu.au>
Subject: [linux-lvm] vgcreate -- ERROR "lvm_tab_read(): size" inserting...
Message-ID: <Pine.GSO.4.10.10010141425320.10567-100000@kurango>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com
Cc: Mark Phillips <mark@infoeng.flinders.edu.au>

Hi,

I'm using LVM for the first time and I got this error:

# vgcreate main_vg /dev/hda2
vgcreate -- INFO: using default physical extent size 4 MB
vgcreate -- INFO: maximum logical volume size is 255.99 Gigabyte
vgcreate -- ERROR "lvm_tab_read(): size" inserting volume group "main_vg"
into "/etc/lvmtab"

Can anyone tell me what's wrong?

All I've did before the above command was make /dev/hda2 into a 8e
partition and then run:

# pvcreate /dev/hda2
pvcreate -- physical volume "/dev/hda2" successfully created

Thanks,

Mark.

_/~~~~~~~~___/~~~~~~____________________________________________________
____/~~_____/~~__/~~__________________________Mark_Phillips____________
____/~~_____/~~________________________________mark@ist.flinders.edu.au_
____/~~\HE___/~~__/~~\APTAIN_____________________________________________
____/~~______/~~~~~~____________________________________________________
__________________________________________________________________________
        "They told me I was gullible ... and I believed them!" 
