From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] VG lost, no lvmconf => Help !
Message-Id: <20020124171255.A9239@sistina.com>
References: <3C4EDF1A.3000409@cgg.com> <20020124154339.A8972@sistina.com>
    <3C50250F.40209@cgg.com>
MIME-Version: 1.0
In-Reply-To: <3C50250F.40209@cgg.com>; from gduquesnay@cgg.com on Thu,
    Jan 24, 2002 at 04:15:27PM +0100
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
Date: Thu Jan 24 10:17:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Jan 24, 2002 at 04:15:27PM +0100, Guillaume Duquesnay wrote:
> Heinz J . Mauelshagen wrote:
> 
> > Can you send "vgscan -d" to me in personal email (mge@sistina.com)?
> OK, i'll do that.
> 
> > What does lvm-1.0.1-1 mean. We don't have such version.
> 
> In fact, 1.0.1-1-mdk (Mandrake), you can find it on rpmfind.net
> 
> > Please check with for eg. "vgdisplay -h".
> 
> ---------------
> vgdisplay -h
> Logical Volume Manager 1.0.1
> Heinz Mauelshagen, Sistina Software  26/11/2001 (IOP 10)
> 
> vgdisplay -- display volume group information
> 
> vgdisplay [-c|--colon | -s|--short | -v[v]|--verbose [--verbose]]
>          [-d|--debug] [-h|--help] [--version]
>          [-A|--activevolumegroups | [-D|--disk] [VolumeGroupName...] ]
> 
> ---------------
> 
> 
> A little more info :
> 
> i tried to reimport the old PVs
> ----------------
> ]# vgimport -f -v main /dev/sda1 /dev/sda3
> vgimport -- locking logical volume manager
> vgimport -- checking volume group name
> vgimport -- checking volume group "main" existence
> vgimport -- trying to read physical volumes
> vgimport -- checking for duplicate physical volumes
> vgimport -- checking physical volume name "/dev/sda1"
> vgimport -- reading data of physical volume "/dev/sda1" from disk
> vgimport -- checking for exported physical volume "/dev/sda1"
> vgimport -- reallocating memory
> vgimport -- checking consistency of physical volume "/dev/sda1"
> vgimport -- checking for duplicate physical volumes
> vgimport -- checking physical volume name "/dev/sda3"
> vgimport -- reading data of physical volume "/dev/sda3" from disk
> vgimport -- checking for exported physical volume "/dev/sda3"
> vgimport -- reallocating memory
> vgimport -- checking consistency of physical volume "/dev/sda3"
> vgimport -- physical volumes "/dev/sda3" and "/dev/sda1" are in 
> different volume groups
> 
> ----------------
> 
> Next, i said my pvdata was identical for /dev/sda1 and /dev/sda3, but i 
> discover that was'nt true :
> ---------------
> #]pvdata -P /dev/sda3
> --- Physical volume ---
> PV Name               /dev/sda3
> VG Name               main
> PV Size               1.39 GB / NOT usable 7.65 MB [LVM: 125.00 KB]
> PV#                   2
> PV Status             NOT available
> Allocatable           yes
> Cur LV                1
> PE Size (KByte)       4096
> Total PE              355
> Free PE               99
> Allocated PE          256
> PV UUID               none
> ----------------
> see that PVUUID ?
> 
> So i did try uuid_fixer, which finally give me a human readable error :
> ----------------
> ]# ./uuid_fixer /dev/sda1 /dev/sda3
> /dev/sda3 - UUID corrupt

uuid_fixer aims to write a correct list of PV uuids to every PV.
But it can't handle this case, where you don't have a PV UUID at all
on /dev/sda3.


So, let's hack one in to hopefully make LVM happier.

First preserve the metadata on sda1 and sda3 for recovery with:

dd if=/dev/sda1 of=sda1.VGDA count=512 bs=1k
dd if=/dev/sda3 of=sda3.VGDA count=512 bs=1k

Backup sda[13].VGDA please.


echo "sahdgdgasjg21hxjn45jxJJ45aasdc3d"|dd of=/dev/sda3 obs=1 seek=44 count=32


Run

./uuid_fixer /dev/sda1 /dev/sda3 

again.
Retry vgscan afterwards.



> ----------------
> Damned.
> So where do we go now ?
> thanks,
> 
> Guillaume
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

-- 

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
