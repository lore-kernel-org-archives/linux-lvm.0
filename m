From: "Leigh Waldie" <lw@mih-assoc.com>
Message-ID: <JPELLJPKALBKDDKAFGGLKEGBCDAA.lw@mih-assoc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <E17QseF-0006cM-00@hermes.sistina.com>
Subject: [linux-lvm] Re: RE: ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of volume group "data_disks" from physical volume(s) (Heinz J . Mauelshagen) (Leigh Waldie)
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
Date: Mon Jul  8 03:28:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Heinz,

Thanks for your input on this, but I have now gone back to standard linux
partitions on these disks and everything works fine. I am assuming that
there are compatibility issues with using LVM on a 160GB disk on a promise
ATA133 TX2 controller and I am going to give up on LVM for now. I would love
to be able to use it, as it seems to be extremely useful, but given the
teething problems i have had, I cant really rely on it.

I hope to be able to try again at a later date, maybe things will have
changed by then.

Thanks again for your time...

Leigh Waldie


---------------------------------------
From: "Leigh Waldie" <lw@mih-assoc.com>
To: <linux-lvm@sistina.com>
Date: Thu, 4 Jul 2002 13:22:45 +0100
Subject: [linux-lvm] Re: RE: ERROR "vg_read_with_pv_and_lv(): current PV"
can't get data of volume group "data_disks" from physical volume(s) (Heinz J
. Mauelshagen)
Reply-To: linux-lvm@sistina.com

Thanks for the reply...

-----Original Message-----
From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
Behalf Of linux-lvm-request@sistina.com
Sent: 04 July 2002 10:49
>Message: 7
>Date: Thu, 4 Jul 2002 11:34:54 +0200
>From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
>To: linux-lvm@sistina.com
>Subject: Re: [linux-lvm] RE: ERROR "vg_read_with_pv_and_lv(): current PV"
can't get data of volume group "data_disks" from physical volume(s)
>Reply-To: linux-lvm@sistina.com

>On Wed, Jul 03, 2002 at 02:25:20PM +0100, Leigh Waldie wrote:
>> Further...
>>
>> Output from pvdata /dev/hde reveals that there is no vg info on the disk,
>> however there is vg info on the second disk /dev/hdb...

>Then the vgcfgrestore must have been unsuccessfull :(

indeed it was

>"vgchange -an" is not needed. It doesn't write to the PVs it just tries
>to deactivate the VGs in core.

>>
>> Is there any way of recovering the vg info from hdb onto hde ?

>vgcfgrestore!

>Look with "vgcfgrestore -ll ..." if your backup fits your config,

the output from vgcfgrestore -ll -n data_disks -f
/etc/lvmconf/data_disks.conf looked good to me.
It listed the volume group , the logical volume and the two PVs and all the
sizes seem correct.
So i went ahead to the next step...

>run

>	pvcreate -ff /dev/hde

worked ok - said it was successful

>and

>	vgcfgrestore -n data_disks -f /etc/lvmconf/YourPreferedArchive /dev/hde

when i run
vgcfgrestore -n data_disks -f /etc/lvmconf/data_disks.conf /dev/hde

it reports that VG for data_disks successfully restored to /dev/hde
but it also says : you may not have an actual backup of restored volume
group "data_disks"

and when i try vgscan i get the same error as in the subject line
above...( pvdata /dev/hde still shows no volume group on the PV )

I have several other cfg backups which I have also tried, all of which give
me the same result.

I'm pretty much coming to the conclusion that something else is happening
here but I dont know what...
I suspect that the disk controller may be screwing up.

I got fed up with trying all the correct tools as they were obviously having
a problem with this disk so i used dd to back up the first 512k of the
/dev/hde disk and the used dd again to "copy" the first 512k of data from
disk /dev/hdb to /dev/hde just to test whether or not pvdata would then like
the disk ( I know I couldn't use the disk in this state, just trying it out
of interest ).

The results are very strange.

If I use "dd if=3D/dev/hde |xxd |more" I can see that the VG UUID is at hex
0x0001200 for 32 bytes, but if I use "xxd /dev/hde |more" I can see the VG
uuid at hex 0x0001000 for 32 bytes, which is where I presume it is meant to
be judging by the data on the other disks.

This is leading me to suspect a hardware problem, so I think I will try
moving the disk onto another controller and see how that goes..


>and

>	vgscan ; vgchange -ay


>That should do the trick.


>The open question is, what overwrote your LVM metadata (and hopefully just
>it) on /dev/hde in the first place.

>Regards,
>Heinz    -- The LVM Guy --



---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.372 / Virus Database: 207 - Release Date: 20/06/2002



--__--__--

Message: 2
Date: Thu, 4 Jul 2002 14:34:51 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] Re: RE: ERROR "vg_read_with_pv_and_lv(): current
PV" can't get data of volume group "data_disks" from physical volume(s)
(Heinz J . Mauelshagen)
Reply-To: linux-lvm@sistina.com


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
> >> Output from pvdata /dev/hde reveals that there is no vg info on the
disk,
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
> It listed the volume group , the logical volume and the two PVs and all
the
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
> I have several other cfg backups which I have also tried, all of which
give
> me the same result.
>
> I'm pretty much coming to the conclusion that something else is happening
> here but I dont know what...
> I suspect that the disk controller may be screwing up.
>
> I got fed up with trying all the correct tools as they were obviously
having
> a problem with this disk so i used dd to back up the first 512k of the
> /dev/hde disk and the used dd again to "copy" the first 512k of data from
> disk /dev/hdb to /dev/hde just to test whether or not pvdata would then
like
> the disk ( I know I couldn't use the disk in this state, just trying it
out
> of interest ).
>
> The results are very strange.
>
> If I use "dd if=3D/dev/hde |xxd |more" I can see that the VG UUID is at h=
ex
> 0x0001200 for 32 bytes, but if I use "xxd /dev/hde |more" I can see the VG
> uuid at hex 0x0001000 for 32 bytes, which is where I presume it is meant
to
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
> >The open question is, what overwrote your LVM metadata (and hopefully
just
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

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-
=3D-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-
=3D-


--__--__--

Message: 3
Subject: Re: [linux-lvm] ERROR "vg_read_with_pv_and_lv(): current PV" can't
	get data of volume group
From: Eamonn Hamilton <eamonn@snifter.freeserve.co.uk>
To: linux-lvm@sistina.com
Date: 04 Jul 2002 16:02:12 +0100
Reply-To: linux-lvm@sistina.com

no problem, files are on the way :-)


On Thu, 2002-07-04 at 10:20, Heinz J . Mauelshagen wrote:
>
> Eamonn,
>
> could you send the output to me directly (mge@sistina.com), please?
>
> On Tue, Jul 02, 2002 at 12:55:43PM +0100, Eamonn Hamilton wrote:
> >
> >
> > Hi.
> >
> > I'm getting the error as shown in the subject line from a system which
> > was shut down improperly ( read: turned off ! ). Is there anything I can
> > do to recover this, as the disks all seem fine, and pvscan finds the
> > physical volumes.
> >
> > Any pointers gratefully received ..
> >
> > Cheers,
> > Eamonn
> >
> > P.S
> >
> > pvscan -d and vgscan -d on request, as I don't want to throw 70k at the
> > list :-)
> >
> >
> >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
> --
>
> Regards,
> Heinz    -- The LVM Guy --
>
> *** Software bugs are stupid.
>     Nevertheless it needs not so stupid people to solve them ***
>
>
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-
=3D-
>
> Heinz Mauelshagen                                 Sistina Software Inc.
> Senior Consultant/Developer                       Am Sonnenhang 11
>                                                   56242 Marienrachdorf
>                                                   Germany
> Mauelshagen@Sistina.com                           +49 2626 141200
>                                                        FAX 924446
>
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-
=3D-
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>




--__--__--

Message: 4
From: "James B. Byrne " <ByrneJB@Harte-Lyne.ca>
Organization: Harte & Lyne Limited
To: linux-lvm@sistina.com
Date: Thu, 4 Jul 2002 11:11:49 -0400
Subject: [linux-lvm] Re: linux-lvm digest, Vol 1 #624 - 8 msgs
Reply-To: linux-lvm@sistina.com

On 4 Jul 2002 at 4:49, "Heinz J . Mauelshagen"
<mauelshagen@sistina.com> wrote:

> Did you just grow the LV?
>

Yes

> You need to extend the FS using the respective FS resizing tool as
> well (resize2fs, resize_reiserfs, ...).
>

Did that too.

> BTW: for ext2 the e2fsadm(8) command, which comes with LVM does both
> for you.
>
>

I tried this originally but I can't remember if it worked first off or if in
my ignorance I ran it out of sequence, had problems, and ended up
doing something else.  In any case eventually I managed to get the
file system up to 350 Mb.

> This doesn't really explain the local/remote difference unless:
>
> - local users had root credentials avoiding the fs
>   "reserved block count" to matter

As it turned out the local user did have root capability but when su to
a non-privileged user the local file transfers also worked.
>
> - files uploaded where very large compared to the locally stored files

The reverse in fact, the local files moved in for testing averaged 10x
the size of normal ftp uploads.  However, the culprit was discovered
and it wasn't lvm.  The problem appears to have been a simple
permission problem in the directory tree for the ftp chroot.  Why
pureftpd chose to report this as a disk full error is beyond me.

However, it is worth noting that rebooting the system, without
making any other changes, caused pureftp to subsequently report a
different error message for the same activity. The message didn't
actually say access forbidden ( I think that it was more like "non
existent file", but with the application of a little intuition it did point
to
a permissions problem.

Regards,
Jim


---     e-mail is NOT a secure channel
James B. Byrne                mailto:ByrneJB@Harte-Lyne.ca
Harte & Lyne Limited          http://www.harte-lyne.ca
9 Brockley Drive              vox: +1 905 561 1241
Hamilton, Ontario             fax: +1 905 561 0757
Canada  L8E 3C3



--__--__--

Message: 5
From: "Mark Peloquin" <markpeloquin@hotmail.com>
To: linux-kernel@vger.kernel.org
Cc: joe@fib011235813.fsnet.co.uk, linux-lvm@sistina.com
Subject: Re: [linux-lvm] LVM2 modifies the buffer_head struct?
Date: Fri, 05 Jul 2002 00:21:56 -0500
Reply-To: linux-lvm@sistina.com

On 2002-07-02 14:17:02, Joe wrote:

>This is a horrible hack to get around the fact that ext3 uses the
>b_private field for its own purposes after the buffer_head has been
>handed to the block layer (it doesn't just use b_private when in the
>b_end_io function).  Is this acceptable behaviour ?  Other > filesystems
>do not have similar problems as far as I know.

Under what conditions does ext3 exhibit this behaviour? In EVMS, we have
been stacking the b_private field (for many months), and have not seen any
problems or have had any problems reported with ext3.

Mark



_________________________________________________________________
Join the world=EF=BF=BDs largest e-mail service with MSN Hotmail.
http://www.hotmail.com



--__--__--

Message: 6
Date: Fri, 5 Jul 2002 11:54:22 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] Re: linux-lvm digest, Vol 1 #624 - 8 msgs
Reply-To: linux-lvm@sistina.com


James,

good to hear that it works for you now.

Cheers,
Heinz    -- The LVM Guy --

On Thu, Jul 04, 2002 at 11:11:49AM -0400, James B. Byrne  wrote:
> On 4 Jul 2002 at 4:49, "Heinz J . Mauelshagen"
> <mauelshagen@sistina.com> wrote:
>
> > Did you just grow the LV?
> >
>
> Yes
>
> > You need to extend the FS using the respective FS resizing tool as
> > well (resize2fs, resize_reiserfs, ...).
> >
>
> Did that too.
>
> > BTW: for ext2 the e2fsadm(8) command, which comes with LVM does both
> > for you.
> >
> >
>
> I tried this originally but I can't remember if it worked first off or if
in
> my ignorance I ran it out of sequence, had problems, and ended up
> doing something else.  In any case eventually I managed to get the
> file system up to 350 Mb.
>
> > This doesn't really explain the local/remote difference unless:
> >
> > - local users had root credentials avoiding the fs
> >   "reserved block count" to matter
>
> As it turned out the local user did have root capability but when su to
> a non-privileged user the local file transfers also worked.
> >
> > - files uploaded where very large compared to the locally stored files
>
> The reverse in fact, the local files moved in for testing averaged 10x
> the size of normal ftp uploads.  However, the culprit was discovered
> and it wasn't lvm.  The problem appears to have been a simple
> permission problem in the directory tree for the ftp chroot.  Why
> pureftpd chose to report this as a disk full error is beyond me.
>
> However, it is worth noting that rebooting the system, without
> making any other changes, caused pureftp to subsequently report a
> different error message for the same activity. The message didn't
> actually say access forbidden ( I think that it was more like "non
> existent file", but with the application of a little intuition it did
point to
> a permissions problem.
>
> Regards,
> Jim
>
>
> ---     e-mail is NOT a secure channel
> James B. Byrne                mailto:ByrneJB@Harte-Lyne.ca
> Harte & Lyne Limited          http://www.harte-lyne.ca
> 9 Brockley Drive              vox: +1 905 561 1241
> Hamilton, Ontario             fax: +1 905 561 0757
> Canada  L8E 3C3
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-
=3D-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-
=3D-


--__--__--

Message: 7
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: <linux-LVM@sistina.com>
Date: Fri, 5 Jul 2002 12:28:09 +0200
Subject: [linux-lvm] Tr: Possible LVM bug in 2.4.19-rc1
Reply-To: linux-lvm@sistina.com

---------------- D=3DE9but du message transmis ----------------
Sujet: Possible LVM bug in 2.4.19-rc1
Envoy=3DE9: jeudi 4 juillet 2002 13:59
De: Benjamin Herrenschmidt <benh@kernel.crashing.org>
=3DC0: linux-kernel@vger.kernel.org

Hi !

Olaf and I have been tracking down a bug where the kernel died
into lvm=3D5Fblk=3D5Fopen() during boot on pmac, and later on other PPCs
when trying to access an unconfigured LVM block device (or an
LVM minor not associated yet). This typically happened in the
pmac root discovery code which walks all gendisks, but I beleive
there are other possible exploits.

Here's what I've tracked down so far:

  static int lvm=3D5Fblk=3D5Fopen(struct inode *inode, struct file *file)
  {
  =3D09int minor =3D3D MINOR(inode->i=3D5Frdev);
  =3D09lv=3D5Ft *lv=3D5Fptr;
  =3D09vg=3D5Ft *vg=3D5Fptr =3D3D vg[VG=3D5FBLK(minor)];

  =3D09P=3D5FDEV("blk=3D5Fopen MINOR: %d  VG#: %d  LV#: %d  mode: %s%s\n",
=3D09        minor, VG=3D5FBLK(minor), LV=3D5FBLK(minor),
  =3D09      MODE=3D5FTO=3D5FSTR(file->f=3D5Fmode));

  #ifdef LVM=3D5FTOTAL=3D5FRESET
=3D09  if (lvm=3D5Freset=3D5Fspindown > 0)
=3D09  =3D09return -EPERM;
  #endif

  =3D09if (vg=3D5Fptr !=3D3D NULL &&
  =3D09    (vg=3D5Fptr->vg=3D5Fstatus & VG=3D5FACTIVE) &&

  .../...

At this point, no association have been made. That is VG=3D5FBLK(minor)
will return vg=3D5Flv=3D5Fmap[minor].vg=3D5Fnumber which has been initializ=
ed
to ABS=3D5FMAX=3D5FVG in lvm=3D5Finit=3D5Fvars().

That means that vg=3D5Fptr is set to vg[ABS=3D5FMAX=3D5FVG], which is right=
 =3D
outside
the array bounds, as vg is declared to be

  /* volume group descriptor area pointers */
  vg=3D5Ft *vg[ABS=3D5FMAX=3D5FVG];

So, as soon as we dereference vg=3D5Fptr, we get whatever garbage is located
right after the array, and not the NULL value we would expect for a non
initialized association.

If my understanding is correct, then a simple fix would be to

  /* volume group descriptor area pointers */
-  vg=3D5Ft *vg[ABS=3D5FMAX=3D5FVG];
+  vg=3D5Ft *vg[ABS=3D5FMAX=3D5FVG+1];

though it's a bit hackish... maybe we should just test
VG=3D5FBLK < ABS=3D5FMAX=3D5FVG

Also, the loop initializing vg array to NULL can probably be removed
from lvm=3D5Finit=3D5Fvars as vg is part of the BSS and thus cleared by def=
ault.

Did I miss something =3D3F

Ben.

----------------- Fin du message transmis -----------------




--__--__--

Message: 8
Date: Fri, 5 Jul 2002 22:53:24 +0200
From: Kai Weber <lists@glorybox.de>
To: linux-lvm@sistina.com
Subject: [linux-lvm] Get rid of files of a non existing volume group
Reply-To: linux-lvm@sistina.com

Hi,

I have lost a hard disk (died). I had a volume group on this disk. Now I
have replaced the disk with a new one and wanted to create the old scheme
on this disk:

$ vgcreate datavg /dev/hdb1
vgcreate -- directory /dev/datavg already exists

As you can see the old /dev/datavg still exists on my root-partition. How
do I get rid of the old files? There is no VG datavg anymore, but I want to
have the name back.

Can I 'rm -rf /dev/datavg' the files? Or should I do a vgextend?

vgscan does not find the VG datavg anymore.

Kai


--__--__--

Message: 9
Date: Sat, 6 Jul 2002 09:27:58 +0100
From: Patrick Caulfield <caulfield@sistina.com>
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] Get rid of files of a non existing volume group
Reply-To: linux-lvm@sistina.com

On Fri, Jul 05, 2002 at 10:53:24PM +0200, Kai Weber wrote:
> Hi,
>
> I have lost a hard disk (died). I had a volume group on this disk. Now I
> have replaced the disk with a new one and wanted to create the old scheme
> on this disk:
>
> $ vgcreate datavg /dev/hdb1
> vgcreate -- directory /dev/datavg already exists
>
> As you can see the old /dev/datavg still exists on my root-partition. How
> do I get rid of the old files? There is no VG datavg anymore, but I want
to
> have the name back.
>
> Can I 'rm -rf /dev/datavg' the files? Or should I do a vgextend?

You can safely delete the directory. When you re-created the VG and LVs then
nodes will be re-created.

> vgscan does not find the VG datavg anymore.

Well...er... if it's a totally new disk it won't. :)

patrick



--__--__--

Message: 10
Date: Sat, 6 Jul 2002 15:00:52 +0200
From: Kai Weber <lists@glorybox.de>
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] Get rid of files of a non existing volume group
Reply-To: linux-lvm@sistina.com

+ Patrick Caulfield <caulfield@sistina.com>:

> > Can I 'rm -rf /dev/datavg' the files? Or should I do a vgextend?
>
> You can safely delete the directory. When you re-created the VG and
> LVs then nodes will be re-created.

It worked. I ever thought the dev-files for LVM are created dynamicly.
So I feared removing the files would not be succesfull. And I am not a
friend of experiments... *g*

Thank you
Kai


--__--__--

Message: 11
Date:	Sat, 6 Jul 2002 13:39:39 -0300 (BRT)
From: Rik van Riel <riel@conectiva.com.br>
To:	linux-lvm@sistina.com
Subject: [linux-lvm] lvm & 2.5
Reply-To: linux-lvm@sistina.com

Hi,

are there any plans to fix lvm support for 2.5 or should I
drop lvm from my test boxes until 2.6 comes out ?

Rik
--
Bravely reimplemented by the knights who say "NIH".

http://www.surriel.com/		http://distro.conectiva.com/




--__--__--

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm


End of linux-lvm Digest


---
Incoming mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.373 / Virus Database: 208 - Release Date: 01/07/2002

---
Outgoing mail is certified Virus Free.
Checked by AVG anti-virus system (http://www.grisoft.com).
Version: 6.0.373 / Virus Database: 208 - Release Date: 01/07/2002
