Message-ID: <005801c161dc$1bbd6160$0a5c010a@ultra>
From: "Klaus Pedersen" <ultra@mailme.dk>
References: <002e01c161d6$7fa8a960$0a5c010a@ultra> <20011030235208.F800@lynx.no>
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
Date: Wed Oct 31 01:15:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I think that gave a little breakthrough :-)
First of all - as murphys law suggests, I don't have a backup to use with
vgcfgrestore - but with the tool I did manage to recreate both /etc/lvmtab
and /etc/lvmtab.d :

Vault:/home/ultra# vgcfgrestore -n site_vg /dev/hda8
vgcfgrestore -- VGDA for "site_vg" successfully restored to physical volume
"/dev/hda8"

Vault:/home/ultra# vgcfgrestore -n site_vg /dev/hdb1
vgcfgrestore -- VGDA for "site_vg" successfully restored to physical volume
"/dev/hdb1"

the only problem is that they are both really empty, so with vgscan I find
nothing :

Vault:/etc# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- no volume groups found

But to my big relief, the data is still present on the physical drives :

Vault:/etc# pvdisplay /dev/hda8
--- Physical volume ---
PV Name               /dev/hda8
VG Name               site_vg
PV Size               14.1 GB / NOT usable 1.21 MB [LVM: 135 KB]
PV#                   2
PV Status             available
Allocatable           yes
Cur LV                1
PE Size (KByte)       4096
Total PE              3610
Free PE               108
Allocated PE          3502
PV UUID               W9tkR7-eq02-6WBM-CBrU-Cdeb-I32v-RyFuLn


Vault:/etc# pvdisplay /dev/hdb1
--- Physical volume ---
PV Name               /dev/hdb1
VG Name               site_vg
PV Size               57.25 GB / NOT usable 3.96 MB [LVM: 178 KB]
PV#                   1
PV Status             NOT available
Allocatable           yes (but full)
Cur LV                1
PE Size (KByte)       4096
Total PE              14654
Free PE               0
Allocated PE          14654
PV UUID               u5vBzC-Hwu5-mjAt-5yN0-lS4E-crto-1jI9NZ


Thanks for the help so far Andreas, but where do I go from here ?

Thanks in advance

Klaus Pedersen

----- Original Message -----
From: "Andreas Dilger" <adilger@turbolabs.com>
To: <linux-lvm@sistina.com>
Sent: Wednesday, October 31, 2001 7:52 AM
Subject: Re: [linux-lvm] Re: After power outtage my vg is gone


> On Oct 31, 2001  07:37 +0100, Klaus Pedersen wrote:
> > I really need help on this - sorry to send another request for help.
> > Does anybody have a clue ? anything that can help me remount my vg
without
> > dataloss if possible ?
> > Can anybody point me to documentation in saving a vg ? or a newsgroup on
> > usenet I can try ?
>
> Try "vgcfgrestore".
>
> Cheers, Andreas
> --
> Andreas Dilger
> http://sourceforge.net/projects/ext2resize/
> http://www-mddsp.enel.ucalgary.ca/People/adilger/
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
