Message-ID: <000601bf2fc6$ed402fa0$030116ac@fd1>
From: "Fernando Dammous" <ferdam@internetcom.com.br>
References: <8525682A.0078290B.00@fund-dc2.txfund.com>
Subject: Re: [linux-lvm] lvcreate_initrd & redhat 6.1
Date: Mon, 15 Nov 1999 22:09:58 -0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "Jonathan S. Polacheck" <JPolache@txfund.com>, linux-lvm@msede.com

Hi,

    the script lvcreate_initrd has a typo (-N 4096) in the line :

    mke2fs -m0 -N 4096 $DEVRAM $INITRDSIZE >/dev/null 2>&1

Edit and change to -B 4096 :
    mke2fs -m0 -B 4096 $DEVRAM $INITRDSIZE >/dev/null 2>&1
[]s
Fernando

----- Original Message ----- 
From: Jonathan S. Polacheck <JPolache@txfund.com>
To: <linux-lvm@msede.com>
Sent: Monday, November 15, 1999 8:53 PM
Subject: [linux-lvm] lvcreate_initrd & redhat 6.1


> 
> 
> Got lvm running on at RH 6.1 after patching a 2.2.10 kernal.  All looking
> very good. However, when I ran lvcreate_initrd, it errored out;
> 
> [root@l61 tools]# ./lvmcreate_initrd
> 
> Logical Volume Manager 0.7 by Heinz Mauelshagen  01/07/1999
> 
> lvmcreate_initrd -- this script creates a LVM initial ram disk in
> /boot/initrd.z
> 
> lvmcreate_initrd -- making ram filesystem
> lvmcreate_initrd -- ERROR making ram disk filesystem
> 
> Also, any suggestions as to where to put the "vgscan" and "vgchange -a y"
> on this system.  It uses the "Sys V" rc.d setup (no /sbin/init.d/boot
> file).
> 
> Thanks,
> 
> Jon Polacheck
> 
> 
> 
