Message-ID: <001701bf1114$c8274c60$030116ac@fd1>
From: "Fernando Dammous" <ferdam@internetcom.com.br>
References: <m11ZIFi-000D4UC@londo.rhein-main.de>
Subject: Re: [linux-lvm] Problems with raid1 and LVM and initrd
Date: Thu, 7 Oct 1999 19:38:11 -0300
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Torsten Neumann <torsten@londo.rhein-main.de>, LVM for Linux <linux-lvm@msede.com>

Hi
----- Original Message -----
From: Torsten Neumann <torsten@londo.rhein-main.de>
To: LVM for Linux <linux-lvm@msede.com>
Sent: Thursday, October 07, 1999 3:26 PM
Subject: [linux-lvm] Problems with raid1 and LVM and initrd


> Hi,
> Everythings works, execpt if I start it via initrd.
>
> Any Ideas ?
I had a similar problem.  (I'm not using RAID).

There was a difference among /dev  and /etc/lvmtab from the real-root-device
and your correspondents in the initrd (it lacked /dev/vg00 / *).
I copied /dev and /etc/lvmtab and I re-built the initrd.
Today no longer vg01 exists, just vg00. Everything works fine.

BTW: my SWAP also lives in a LV (only /boot is out) .
I hope this helps !
> Regards
> Torsten

Cheers,
Fernando
