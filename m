Message-ID: <001501c16305$0e2ab230$0a5c010a@ultra>
From: "Klaus Pedersen" <ultra@mailme.dk>
References: <002e01c161d6$7fa8a960$0a5c010a@ultra> <20011030235208.F800@lynx.no> <005801c161dc$1bbd6160$0a5c010a@ultra>
Subject: Re: [linux-lvm] Re: After power outtage my vg is gone
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Thu Nov  1 12:41:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi again

I finally got my problem solved, so I write this message to tell others how
I solved it, so it's in the mail archives - and also because I want to point
out that this should be in the HOW-TO, since my problem is probably not so
uncommonm and very easy to solve - IF you know how.

Basically my problem is that after a power outtage I was unable to mount my
vgs - I got this message :

Vault:/home/ultra# mount /glftpd/site
mount: /dev/site_vg/lvol1 is not a valid block device

I found out that the problem is that the file /etc/lvmtab and the directory
/etc/lvmtab.d is gone for some reason.

Basically I solved this with a big help from Andreas to dropped me a short
message to use vgcfgrestore, so I did.
In the how-to I find it very vagely documented exactly what this tool does,
and when it's being used.
Also, I was unable to read in the how-to that after this is the sequence of
commands that should be used :
vgcfgrestore -n site_vg /dev/hda8
vgcfgrestore -n site_vg /dev/hdb1
(my vg consists of those two partitions)

vgscan -a y (to activate the vg)

and then do the actual mounting :

mount /glftpd/site

Yes, I know that to some very experienced LVM developer and such, this is
VERY simple - but to a guy like me who really doesn't know much about LVM,
it was very advanced and hard to find out.

So please - put an advanced troubleshooting guide in the LVM how-to on
sistina.com - I find it very hard to believe that I am the only one who
could use it.

/Klaus


----- Original Message -----
From: "Klaus Pedersen" <ultra@mailme.dk>
To: <linux-lvm@sistina.com>
Sent: Wednesday, October 31, 2001 8:17 AM
Subject: Re: [linux-lvm] Re: After power outtage my vg is gone


> I think that gave a little breakthrough :-)
> First of all - as murphys law suggests, I don't have a backup to use with
> vgcfgrestore - but with the tool I did manage to recreate both /etc/lvmtab
> and /etc/lvmtab.d :
>
> Vault:/home/ultra# vgcfgrestore -n site_vg /dev/hda8
> vgcfgrestore -- VGDA for "site_vg" successfully restored to physical
volume
> "/dev/hda8"
>
> Vault:/home/ultra# vgcfgrestore -n site_vg /dev/hdb1
> vgcfgrestore -- VGDA for "site_vg" successfully restored to physical
volume
> "/dev/hdb1"
>
> the only problem is that they are both really empty, so with vgscan I find
> nothing :
>
> Vault:/etc# vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- no volume groups found
>
> But to my big relief, the data is still present on the physical drives :
>
> Vault:/etc# pvdisplay /dev/hda8
> --- Physical volume ---
> PV Name               /dev/hda8
> VG Name               site_vg
> PV Size               14.1 GB / NOT usable 1.21 MB [LVM: 135 KB]
> PV#                   2
> PV Status             available
> Allocatable           yes
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              3610
> Free PE               108
> Allocated PE          3502
> PV UUID               W9tkR7-eq02-6WBM-CBrU-Cdeb-I32v-RyFuLn
>
>
> Vault:/etc# pvdisplay /dev/hdb1
> --- Physical volume ---
> PV Name               /dev/hdb1
> VG Name               site_vg
> PV Size               57.25 GB / NOT usable 3.96 MB [LVM: 178 KB]
> PV#                   1
> PV Status             NOT available
> Allocatable           yes (but full)
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              14654
> Free PE               0
> Allocated PE          14654
> PV UUID               u5vBzC-Hwu5-mjAt-5yN0-lS4E-crto-1jI9NZ
>
>
> Thanks for the help so far Andreas, but where do I go from here ?
>
> Thanks in advance
>
> Klaus Pedersen
>
