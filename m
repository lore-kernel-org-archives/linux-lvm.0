Return-Path: <root@srv.sistina.com>
Date: Tue, 26 Jun 2001 14:15:45 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] pvmove error
Message-ID: <20010626141545.A26445@sistina.com>
References: <20010626121458.A25838@sistina.com> <000001c0fe32$bd67f2e0$7d80a8c0@dyndns.org>
Mime-Version: 1.0
In-Reply-To: <000001c0fe32$bd67f2e0$7d80a8c0@dyndns.org>; from smdenton@bellsouth.net on Tue, Jun 26, 2001 at 07:25:37AM -0400
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: mge@sistina.com

On Tue, Jun 26, 2001 at 07:25:37AM -0400, S. Michael Denton wrote:
>  
> Hm. OK, i checked the lv stats and that specific pe hadn't been
> read/written to just yet, so there's no data there.

All right, that makes sense.

> By your
> procedure it looks like an upgrade from beta7 to 1.0 won't fix the
> alignment errors either, correct?

Well, in case you created the PVs and extended existing VGs by them or
created new VGs with them -> No, it won't :-(

> Oh and yes, I did initially create
> this with a prior version... 0.8i iirc.

In this case you *could* be fine using upcomming 1.0 without my procedure,
presumed that the last PE is not misaligned/misallocated which shouldn't be
the case, if you created the PV with < LVM 0.9.1 Beta 6.

You can get the sector offset of the beginning of your last PE with
"pvdisplay -v /dev/YourPVName | tail -3". The offset in 512 byte units is
in the last column of that output.
"fdisk -l" on the whole block device (for eg. /dev/sdb) gives you the disk
size to make sure, that the PE is not allocated beyond the end of the
underlying device.

> 
> Thanks for the info!

You're welcome.

Regards,
Heinz    -- The LVM Guy --

> 
> -----Original Message-----
> From: linux-lvm-admin@sistina.com
> [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Heinz J. Mauelshagen
> Sent: Tuesday, 26 June 2001 06:15
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] pvmove error
> 
> 
> On Mon, Jun 25, 2001 at 10:08:19PM -0400, S. Michael Denton wrote:
> > Hello,
> > 
> > The attached log is of a pvmove -d -v /dev/hdd1:extent
> > /dev/hdb1:extent, where the source extent is the last pe on
> > /dev/hdd1.  I want to move this extent off the drive for
> > performance reasons, but it refuses to move.  The error also makes
> > me wonder if I could even use that pe, since it seems to be smaller
> > than lvm is expecting.
> 
> Michael,
> 
> this is caused by an alignment bug which has been fixed in the last
> couple
> of days and only showed up in specific disk sizes.
> 
> > Is there a fix for this?
> 
> No, I am sorry. Not so far.
> 
> I am a little bit confused.
> You mention above, that you want to move the last PE away for
> performance
> reasons so I assume that it is already used. If so and the
> misalignment bug
> caused an invalid PE size for that very last PE you ant to move, you
> should
> already have seen trouble accessing it (like FS errors).
> If not so, the FS likely hasn't stored (meta)data in that PE which
> can't lead
> to performance bottlenecks on that PE.
> 
> Anyway; the workaround for your problem is (presumed you have enough
> free
>         temporary disk space):
> 
> - get LVM 1.0 once we release it (hopefully tonight :-) which has
>   fixes for the alignment bug and install it
> - create as many new PVs as needed to create a new LV of the size of
> the
>   LV containing the PE in questions
> - extent your VG by those
> - create a new LV (the destination) with the same size of the one
>   in question (the source)
> - close the source
> - dd the source over to the destination (which might expose I/O
> errors on
>   the last PE; do partital dd up to the end of the device then and
>   restart a dd from the next LE in the logical address space of the
> LV
>   after it
> - test the destination
> - remove the source
> - rename the destination to the sources name (if necessary)
> 
> Eventually you should do the above for all PVs which might have
> misaligned PEs
> in order to make sure that the error doesn't ocur again later while
> you try
> to pvmove your data.
> 
> We don't have hard data so far, if many users have that misalignment
> problem because it doesn't happen with *all* PV sizes.
> 
> People who didn't create PVs with LVM 0.9.1 Beta[67] don't suffer
> from
> the problem anyway!
> 
> Regards,
> Heinz    -- The LVM Guy --
> 
> 
> > 
> > Thanks.
> > 
> > Scott Denton
> > smdenton@bellsouth.net
> 
> Content-Description: pvmove.err
> > <1> lvm_get_col_numbers -- CALLED
> > <22> lvm_check_number -- CALLED with "502"
> > <22> lvm_check_number -- LEAVING with ret: 502
<SNIP>
> > pvmove -- checking destination physical volume names in command
> > line pvmove -- checking volume group activity
> > pvmove -- moving physical extents in active volume group "rootvg"
> > pvmove -- starting to move extents away from physical volume
> > "/dev/hdd1" pvmove -- checking for enough free physical extents in
> > "rootvg"
> > pvmove -- /dev/hdd1 [PE 502 [mp3lv [LE 2517]] -> /dev/hdb1 [PE 168]
> > [1/1]  
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
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
