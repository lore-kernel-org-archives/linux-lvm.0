From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] Just for information ....
Message-ID: <20011120150638.E1308@lynx.no>
References: <3BFAA389.24AAB2A1@LTUtech.com> <20011120125632.Z1308@lynx.no> <20011120214104.A24005@cistron.nl>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011120214104.A24005@cistron.nl>; from wichert@cistron.nl on Tue, Nov 20, 2001 at 09:41:04PM +0100
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
Date: Tue Nov 20 16:05:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: list LVM <linux-lvm@sistina.com>, Igor Dumaire <Igor.Dumaire@LTUtech.com>

On Nov 20, 2001  21:41 +0100, Wichert Akkerman wrote:
> Previously Andreas Dilger wrote:
> > Yes.  You will need to do a vgscan to find the new disks.  Hopefully they
> > will not have the same VG name as another VG on that system.
> 
> What if they do?

Then it will depend on disk ordering which one you get under that name, and
the other will be unavailable.  vgscan will see all of the disks, but then
start checking the UUIDs on the PVs against the list on the "first" disk,
and the extra disks with UUIDs that don't match will be discarded.

I don't think there are any likely scenarios with LVM 0.9+ that will cause
problems, but since UUIDs were only introduced in 0.9, it may be much harder
to handle this in older LVM versions.

You might be able to vgexport the disks from the "other" VG at that time,
and reimport it with a different name, but I don't know how reliable that
will be (if it even works).  LVM has been confused by less.  Better to just
"not do that" in the first place.

FYI, AIX LVM does not keep the VG name on the disk itself, only a UUID.
You also never do something like "vgscan" at boot time to reconfigure
the LVM setup.  When you attach the disks to a new system, you have to
import them (at which point they get a name that is stored in a config
file in /etc), and your LVM config is never touched until you change it.
When you export the VG, it also doesn't write to the disks, just deletes
the config from /etc.  This means you don't need to do anything to the
VG before moving it to another system.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
