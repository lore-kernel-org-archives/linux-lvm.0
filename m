From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] PV#s are not unique
Message-ID: <20011212091557.C629@sistina.com>
References: <20011208170737.GA15685@marvin.palfrader.org> <20011211123626.C27568@sistina.com> <20011211182356.GA864@marvin.palfrader.org>
Mime-Version: 1.0
In-Reply-To: <20011211182356.GA864@marvin.palfrader.org>; from peter@palfrader.org on Tue, Dec 11, 2001 at 07:23:56PM +0100
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
Date: Wed Dec 12 02:16:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Dec 11, 2001 at 07:23:56PM +0100, Peter Palfrader wrote:
> Hi Heinz!
> 
> On Tue, 11 Dec 2001, Heinz J . Mauelshagen wrote:
> 
> > But anyway:
> > 
> > you need to read te first sector of
> > 
> > /dev/ide/host0/bus1/target1/lun0/part1
> > and
> > /dev/ide/host0/bus0/target1/lun0/part1.
> > 
> > Change unsigned int value (4 byte) at decimal offset 432 to 5 for bus1
> > and to 7 for bus0 which should give you unique numbering of PVs and store
> > them back to the corresponding disks.
> 
> Thank you for your reply, I did this.  PVids are unique now, but vgscan
> still does not find and activate the volume group.
> 
> Do you have something else I could try?
> 
> I think of trying to restore the metadata on all PVs using vgcfgrestore
> since I have a few copies of vg_stuff.conf in /etc/lvmconf.  Would this
> be a stupid idea?

No, not at all. This is actually the recommended wayx to restore a messy VG ;-)
You need to run "pvcreate -ff" on all of the (former) PVs and vgcfgrestore on
each of them afterwards.

Could you save your VG's metadata before by running

for PV in YOurPVs
   do dd if=/dev/$PV of=VGDA.${VGName}.$PV bs=1k count=512
done

and storing the copies on tape or something so that we are able to backup
for potential further investigation?

> 
> TIA
> 					yours,
> 					peter
> 
> -- 
>  PGP signed and encrypted  |  .''`.  ** Debian GNU/Linux **
>     messages preferred.    | : :' :      The  universal
>                            | `. `'      Operating System
>  http://www.palfrader.org/ |   `-    http://www.debian.org/
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
