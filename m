From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Just for information ....
Message-ID: <20011123130149.A4829@sistina.com>
References: <3BFAA389.24AAB2A1@LTUtech.com> <20011120125632.Z1308@lynx.no> <20011120214104.A24005@cistron.nl> <20011120150638.E1308@lynx.no>
Mime-Version: 1.0
In-Reply-To: <20011120150638.E1308@lynx.no>; from adilger@turbolabs.com on Tue, Nov 20, 2001 at 03:06:38PM -0700
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
Date: Fri Nov 23 06:07:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Nov 20, 2001 at 03:06:38PM -0700, Andreas Dilger wrote:
> On Nov 20, 2001  21:41 +0100, Wichert Akkerman wrote:
> > Previously Andreas Dilger wrote:
> > > Yes.  You will need to do a vgscan to find the new disks.  Hopefully they
> > > will not have the same VG name as another VG on that system.
> > 
> > What if they do?
> 
> Then it will depend on disk ordering which one you get under that name, and
> the other will be unavailable.  vgscan will see all of the disks, but then
> start checking the UUIDs on the PVs against the list on the "first" disk,
> and the extra disks with UUIDs that don't match will be discarded.

Worst case would be a temporary disconnect of the PVs belonging to one
of the VGs which share the same name. vgscan+vgrename the found one and
reconnect the drives and vgscan again.


> 
> I don't think there are any likely scenarios with LVM 0.9+ that will cause
> problems, but since UUIDs were only introduced in 0.9, it may be much harder
> to handle this in older LVM versions.

See above.

> 
> You might be able to vgexport the disks from the "other" VG at that time,
> and reimport it with a different name, but I don't know how reliable that
> will be (if it even works).  LVM has been confused by less.

???

> Better to just
> "not do that" in the first place.
> 
> FYI, AIX LVM does not keep the VG name on the disk itself, only a UUID.
> You also never do something like "vgscan" at boot time to reconfigure
> the LVM setup.  When you attach the disks to a new system, you have to
> import them (at which point they get a name that is stored in a config
> file in /etc), and your LVM config is never touched until you change it.
> When you export the VG, it also doesn't write to the disks, just deletes
> the config from /etc.  This means you don't need to do anything to the
> VG before moving it to another system.

Well, actually you can just "vgscan" in the VG without vgexport'ing it
in Linux LVM as well. vgexport/vgimport exactly is the clean procedure
to make sure that name clashes don't happen!

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
