From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Re: RE: ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of volume group "data_disks" from physical volume(s) (Heinz J . Mauelshagen)
Message-ID: <20020704143451.A9894@sistina.com>
References: <E17Q3FS-0002v6-00@hermes.sistina.com> <JPELLJPKALBKDDKAFGGLEEFICDAA.lw@mih-assoc.com>
Mime-Version: 1.0
In-Reply-To: <JPELLJPKALBKDDKAFGGLEEFICDAA.lw@mih-assoc.com>; from lw@mih-assoc.com on Thu, Jul 04, 2002 at 01:22:45PM +0100
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
Date: Thu Jul  4 07:43:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Leigh,

that pvdata still can't see the VGDA after your successfull vgcfgrestore
indeed points to a hardware flaw.

You should find the VG UUID at offset 0x400 on the disk with metadata
created by LVM versions before 0.9.1 Beta 8.

With newer LVM versions it sits at offset 0x1000 as you suggested
(LVM_VGDA_ALIGN definition in tools/lib/liblvm.h).

Please get back once you sorted out any HW problems.

Regards,
Heinz    -- The LVM Guy --



On Thu, Jul 04, 2002 at 01:22:45PM +0100, Leigh Waldie wrote:
> Thanks for the reply...
> 
> -----Original Message-----
> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of linux-lvm-request@sistina.com
> Sent: 04 July 2002 10:49
> >Message: 7
> >Date: Thu, 4 Jul 2002 11:34:54 +0200
> >From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
> >To: linux-lvm@sistina.com
> >Subject: Re: [linux-lvm] RE: ERROR "vg_read_with_pv_and_lv(): current PV"
> can't get data of volume group "data_disks" from physical volume(s)
> >Reply-To: linux-lvm@sistina.com
> 
> >On Wed, Jul 03, 2002 at 02:25:20PM +0100, Leigh Waldie wrote:
> >> Further...
> >>
> >> Output from pvdata /dev/hde reveals that there is no vg info on the disk,
> >> however there is vg info on the second disk /dev/hdb...
> 
> >Then the vgcfgrestore must have been unsuccessfull :(
> 
> indeed it was
> 
> >"vgchange -an" is not needed. It doesn't write to the PVs it just tries
> >to deactivate the VGs in core.
> 
> >>
> >> Is there any way of recovering the vg info from hdb onto hde ?
> 
> >vgcfgrestore!
> 
> >Look with "vgcfgrestore -ll ..." if your backup fits your config,
> 
> the output from vgcfgrestore -ll -n data_disks -f
> /etc/lvmconf/data_disks.conf looked good to me.
> It listed the volume group , the logical volume and the two PVs and all the
> sizes seem correct.
> So i went ahead to the next step...
> 
> >run
> 
> >	pvcreate -ff /dev/hde
> 
> worked ok - said it was successful
> 
> >and
> 
> >	vgcfgrestore -n data_disks -f /etc/lvmconf/YourPreferedArchive /dev/hde
> 
> when i run
> vgcfgrestore -n data_disks -f /etc/lvmconf/data_disks.conf /dev/hde
> 
> it reports that VG for data_disks successfully restored to /dev/hde
> but it also says : you may not have an actual backup of restored volume
> group "data_disks"
> 
> and when i try vgscan i get the same error as in the subject line
> above...( pvdata /dev/hde still shows no volume group on the PV )
> 
> I have several other cfg backups which I have also tried, all of which give
> me the same result.
> 
> I'm pretty much coming to the conclusion that something else is happening
> here but I dont know what...
> I suspect that the disk controller may be screwing up.
> 
> I got fed up with trying all the correct tools as they were obviously having
> a problem with this disk so i used dd to back up the first 512k of the
> /dev/hde disk and the used dd again to "copy" the first 512k of data from
> disk /dev/hdb to /dev/hde just to test whether or not pvdata would then like
> the disk ( I know I couldn't use the disk in this state, just trying it out
> of interest ).
> 
> The results are very strange.
> 
> If I use "dd if=/dev/hde |xxd |more" I can see that the VG UUID is at hex
> 0x0001200 for 32 bytes, but if I use "xxd /dev/hde |more" I can see the VG
> uuid at hex 0x0001000 for 32 bytes, which is where I presume it is meant to
> be judging by the data on the other disks.
> 
> This is leading me to suspect a hardware problem, so I think I will try
> moving the disk onto another controller and see how that goes..
> 
> 
> >and
> 
> >	vgscan ; vgchange -ay
> 
> 
> >That should do the trick.
> 
> 
> >The open question is, what overwrote your LVM metadata (and hopefully just
> >it) on /dev/hde in the first place.
> 
> >Regards,
> >Heinz    -- The LVM Guy --
> 
> 
> 
> ---
> Outgoing mail is certified Virus Free.
> Checked by AVG anti-virus system (http://www.grisoft.com).
> Version: 6.0.372 / Virus Database: 207 - Release Date: 20/06/2002
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
