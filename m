From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Pvmove fails... No free PE's (and lvextend does
    not work...)
Message-Id: <20020121122915.A17020@sistina.com>
References: <20020118114002.B32516@sistina.com>
    <3X4YQWUJH6271XR1A6HC31ZUZTTSVR.3c4b44c1@kadzuki>
MIME-Version: 1.0
In-Reply-To: <3X4YQWUJH6271XR1A6HC31ZUZTTSVR.3c4b44c1@kadzuki>;
    from andewid@tnonline.net on Sun, Jan 20, 2002 at 11:29:21PM +0100
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
Date: Mon Jan 21 05:33:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Anders,

as said in private email: I had a typo 'server1' rather than 'Server' in
the script, that's why you didn't get any output :-(

On Sun, Jan 20, 2002 at 11:29:21PM +0100, Anders Widman wrote:
> This script did not output anything. Isn't the VGDA data in /etc/lvmconf/volumegroup.conf ?

Yes, it is. The binary copies save some time during setup of a test system.

Heinz

> 
> //Anders
> 
> 2002-01-18 11:40:02, "Heinz J . Mauelshagen" <mauelshagen@sistina.com> wrote:
> 
> >On Thu, Jan 17, 2002 at 10:18:39PM +0100, Anders Widman wrote:
> >> I currently use RedHat 7.2 with kernel 2.4.18-4, but I have tested most kernel versions from 2.4.16. I am also using lvm 1.0.1.
> >> 
> >> I have tried to move all extents and just a few (or even one) extents with no luck... Could it be that this disk is 120GB (114,44) and there would be some problems with that?
> >
> >Hmmm.., shouldn't be the case.
> >
> >Could you send me all the metadata of your VG "server" attached in private email
> >(mge@sistina.com) for further investigation?
> >
> >You can create the copies running this script:
> >
> >#!/bin/sh
> >for d in $(pvscan|sed '/server1/!d;s!^.* PV "!!;s!" .*$!!'); do
> >   dd if=$d of=$(basename $d).VGDA bs=1k count=512
> >done
> >
> >Thanks,
> >Heinz
> >
> >> 
> >> //Anders
> >> 
> >> 
> >> 2002-01-17 12:32:53, "Heinz J . Mauelshagen" <mauelshagen@sistina.com> wrote:
> >> 
> >> >
> >> >Hmmm,
> >> >we didn't talk about versions.
> >> >Which Linux/LVM version are you using?
> >> >
> >> >Another point (assuming that you might siffer from an old OBO error):
> >> >does the extent still fail with less than 1221 extents?
> >> >
> >> >Regards,
> >> >Heinz    -- The LVM Guy --
> >> >
> >> >On Wed, Jan 16, 2002 at 10:28:39PM +0100, Anders Widman wrote:
> >> >> Well... here is what the problem is right now.:
> >> >> 
> >> >> First I scan all physical disks to determine where I have free space to grow..
> >> >> 
> >> >> 
> >> >> pvscan -- reading all physical volumes (this may take a while...)
> >> >> pvscan -- ACTIVE   PV "/dev/hdo1" of VG "Server" [55.84 GB / 0 free]
> >> >> pvscan -- ACTIVE   PV "/dev/hdp1" of VG "Server" [28.56 GB / 0 free]
> >> >> pvscan -- ACTIVE   PV "/dev/hdm1" of VG "Server" [76.28 GB / 0 free]
> >> >> pvscan -- ACTIVE   PV "/dev/hdn1" of VG "Server" [76.28 GB / 0 free]
> >> >> pvscan -- ACTIVE   PV "/dev/hdk1" of VG "Server" [38.12 GB / 0 free]
> >> >> pvscan -- ACTIVE   PV "/dev/hdl1" of VG "Server" [55.84 GB / 0 free]
> >> >> pvscan -- ACTIVE   PV "/dev/hdg1" of VG "Server" [55.88 GB / 0 free]
> >> >> pvscan -- ACTIVE   PV "/dev/hdh1" of VG "Server" [55.88 GB / 0 free]
> >> >> pvscan -- ACTIVE   PV "/dev/hde1" of VG "Server" [114.44 GB / 38.16 GB free]
> >> >> pvscan -- ACTIVE   PV "/dev/hdf1" of VG "Server" [57.22 GB / 0 free]
> >> >> pvscan -- ACTIVE   PV "/dev/hdc1" of VG "Server" [71.53 GB / 0 free]
> >> >> pvscan -- ACTIVE   PV "/dev/hdd1" of VG "Server" [71.53 GB / 0 free]
> >> >> pvscan -- ACTIVE   PV "/dev/hdb1" of VG "Server" [4.28 GB / 0 free]
> >> >> pvscan -- ACTIVE   PV "/dev/hdb3" of VG "Server" [52.88 GB / 0 free]
> >> >> pvscan -- total: 14 [815.29 GB] / in use: 14 [815.29 GB] / in no VG: 0 [0]
> >> >> 
> >> >> --- Volume group ---
> >> >> VG Name               Server
> >> >> VG Access             read/write
> >> >> VG Status             available/resizable
> >> >> VG #                  0
> >> >> MAX LV                256
> >> >> Cur LV                1
> >> >> Open LV               1
> >> >> MAX LV Size           1.00 TB
> >> >> Max PV                256
> >> >> Cur PV                14
> >> >> Act PV                14
> >> >> VG Size               814.56 GB
> >> >> PE Size               32.00 MB
> >> >> Total PE              26066
> >> >> Alloc PE / Size       24845 / 776.41 GB
> >> >> Free  PE / Size       1221 / 38.16 GB
> >> >> VG UUID               ElJLCd-ln4W-k3YA-yg8W-HmVU-gs0O-mcR0pA
> >> >> 
> >> >> --- Physical volume ---
> >> >> PV Name               /dev/hde1
> >> >> VG Name               Server
> >> >> PV Size               114.50 GB / NOT usable 62.91 MB [LVM: 142.00 KB]
> >> >> PV#                   13
> >> >> PV Status             available
> >> >> Allocatable           yes
> >> >> Cur LV                1
> >> >> PE Size (KByte)       32768
> >> >> Total PE              3662
> >> >> Free PE               1221
> >> >> Allocated PE          2441
> >> >> PV UUID               7ScWsg-0vX4-ccX3-W1sO-mFnz-0Sl0-gDWKmM
> >> >> 
> >> >> -----------------------------------------------------------------------
> >> >> 
> >> >> 
> >> >> Now I use "lvextend -l +1221 /dev/Server/FTPRoot /dev/hde1" to grow my LV "FTPRoot". It worked fine on my new disk (to wich I also moved the old PE's from the bad disk), but not on this one. 
> >> What 
> >> >> can be the problem. Where should I even begin to look?
> >> >> 
> >> >> lvextend -- extending logical volume "/dev/Server/FTPRoot" to 814.56 GB
> >> >> lvextend -- not enough free/allocatable physical extents to extend logical volume /dev/Server/FTPRoot
> >> >> 
> >> >> Thanks for any help!
> >> >> 
> >> >> //Anders
> >> >> 
> >> >> 
> >> >> 2002-01-16 19:28:03, Anders Widman <andewid@tnonline.net> wrote:
> >> >> 
> >> >> >No, my LV is not striped, so this should have worked. Well.. I have bought another disk and will move all pe's to that one instead. Hopefully this will work better.
> >> >> >
> >> >> >//Anders
> >> >> >
> >> >> >2002-01-16 16:08:44, "Heinz J . Mauelshagen" <mauelshagen@sistina.com> wrote:
> >> >> >
> >> >> >>
> >> >> >>Anders,
> >> >> >>
> >> >> >>is your LV striped? In this case, pvmove complains because it can't
> >> >> >>move 2 stripes onto one PV.
> >> >> >>
> >> >> >>If so, you need another disk to be pvcreated/vgextend to your VG in order
> >> >> >>to pvmove data over.
> >> >> >>
> >> >> >>On Wed, Jan 16, 2002 at 07:52:18AM +0100, Anders Widman wrote:
> >> >> >>> I have a bad disk (hdl1) that needs to be replaced. It is 40GB, or 1220 PE's. I have another disk which is about 120GB, but has 1221 free PE's. Both disks are in the same VG, Server and the 
> same 
> >> LV, 
> >> >> >>> FTPRoot. When I try "pvmove -v /dev/hdl1" it failes (doesn't even start, really) and tells me I haven't any free PE's.
> >> >> >>> 
> >> >> >>> What can I have missed...
> >> >> >>> 
> >> >> >>> 1) I shrick the filesystem first with about 60GB
> >> >> >>> 2) I use lvreduce to shrick the LV with about 59GB
> >> >> >>> 3) I tried "pvmove -v /dev/hdl" to move all PE's on this 40GB disk to the free ones on the other disks. This should have worked, shoudln't it?
> >> >> >>> 
> >> >> >>> have I missed something critical?
> >> >> >>> 
> >> >> >>> //Anders
> >> >> >>> 
> >> >> >>> 
> >> >> >>> 
> >> >> >>> _______________________________________________
> >> >> >>> linux-lvm mailing list
> >> >> >>> linux-lvm@sistina.com
> >> >> >>> http://lists.sistina.com/mailman/listinfo/linux-lvm
> >> >> >>> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >> >> >>
> >> >> >>-- 
> >> >> >>
> >> >> >>Regards,
> >> >> >>Heinz    -- The LVM Guy --
> >> >> >>
> >> >> >>*** Software bugs are stupid.
> >> >> >>    Nevertheless it needs not so stupid people to solve them ***
> >> >> >>
> >> >> >>=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> >> >> >>
> >> >> >>Heinz Mauelshagen                                 Sistina Software Inc.
> >> >> >>Senior Consultant/Developer                       Am Sonnenhang 11
> >> >> >>                                                  56242 Marienrachdorf
> >> >> >>                                                  Germany
> >> >> >>Mauelshagen@Sistina.com                           +49 2626 141200
> >> >> >>                                                       FAX 924446
> >> >> >>=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> >> >> >>
> >> >> >>_______________________________________________
> >> >> >>linux-lvm mailing list
> >> >> >>linux-lvm@sistina.com
> >> >> >>http://lists.sistina.com/mailman/listinfo/linux-lvm
> >> >> >>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >> >> >>
> >> >> >>
> >> >> >
> >> >> >
> >> >> >
> >> >> >
> >> >> >_______________________________________________
> >> >> >linux-lvm mailing list
> >> >> >linux-lvm@sistina.com
> >> >> >http://lists.sistina.com/mailman/listinfo/linux-lvm
> >> >> >read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >> >> >
> >> >> >
> >> >> 
> >> >> 
> >> >> 
> >> >> 
> >> >> _______________________________________________
> >> >> linux-lvm mailing list
> >> >> linux-lvm@sistina.com
> >> >> http://lists.sistina.com/mailman/listinfo/linux-lvm
> >> >> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >> >
> >> >*** Software bugs are stupid.
> >> >    Nevertheless it needs not so stupid people to solve them ***
> >> >
> >
> >=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> >
> >Heinz Mauelshagen                                 Sistina Software Inc.
> >Senior Consultant/Developer                       Am Sonnenhang 11
> >                                                  56242 Marienrachdorf
> >                                                  Germany
> >Mauelshagen@Sistina.com                           +49 2626 141200
> >                                                       FAX 924446
> >=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> >
> >_______________________________________________
> >linux-lvm mailing list
> >linux-lvm@sistina.com
> >http://lists.sistina.com/mailman/listinfo/linux-lvm
> >read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >
> >
> 
> 
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
