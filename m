Date: Sat, 14 Oct 2000 15:59:01 +0930 (CST)
From: Mark Phillips <mark@ist.flinders.edu.au>
Subject: [linux-lvm] Re: vgcreate -- ERROR "lvm_tab_read(): size" inserting...
In-Reply-To: <Pine.GSO.4.10.10010141425320.10567-100000@kurango>
Message-ID: <Pine.GSO.4.10.10010141555520.12482-100000@kurango>
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mark Phillips <mark@ist.flinders.edu.au>
Cc: linux-lvm@msede.com

I thought I'd add a bit of extra information:

I run Debian Linux.  I am running linux kernel version 2.4.0-test9 and
have installed LVM tools provided by the Debian package
lvm_0.8.final-1_i386.deb which corresponds to version 0.8.final of the LVM
tools.

Cheers,

Mark.

On Sat, 14 Oct 2000, Mark Phillips wrote:

> Hi,
> 
> I'm using LVM for the first time and I got this error:
> 
> # vgcreate main_vg /dev/hda2
> vgcreate -- INFO: using default physical extent size 4 MB
> vgcreate -- INFO: maximum logical volume size is 255.99 Gigabyte
> vgcreate -- ERROR "lvm_tab_read(): size" inserting volume group "main_vg"
> into "/etc/lvmtab"
> 
> Can anyone tell me what's wrong?
> 
> All I've did before the above command was make /dev/hda2 into a 8e
> partition and then run:
> 
> # pvcreate /dev/hda2
> pvcreate -- physical volume "/dev/hda2" successfully created
> 
> Thanks,
> 
> Mark.
> 
> _/~~~~~~~~___/~~~~~~____________________________________________________
> ____/~~_____/~~__/~~__________________________Mark_Phillips____________
> ____/~~_____/~~________________________________mark@ist.flinders.edu.au_
> ____/~~\HE___/~~__/~~\APTAIN_____________________________________________
> ____/~~______/~~~~~~____________________________________________________
> __________________________________________________________________________
>         "They told me I was gullible ... and I believed them!" 
> 
> 
> 

_/~~~~~~~~___/~~~~~~____________________________________________________
____/~~_____/~~__/~~__________________________Mark_Phillips____________
____/~~_____/~~________________________________mark@ist.flinders.edu.au_
____/~~\HE___/~~__/~~\APTAIN_____________________________________________
____/~~______/~~~~~~____________________________________________________
__________________________________________________________________________
        "They told me I was gullible ... and I believed them!" 
