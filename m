From: Matthew Johnson <mjj29@hermes.cam.ac.uk>
Subject: Re: [linux-lvm] recovering a bad physical volume
In-Reply-To: <20020716071417.GB957@tykepenguin.com>
Message-ID: <Pine.SOL.4.44.0207162219080.19234-100000@green.csi.cam.ac.uk>
MIME-Version: 1.0
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
Date: Tue Jul 16 16:22:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com


On Tue, 16 Jul 2002, Patrick Caulfield wrote:

> On Tue, Jul 16, 2002 at 01:02:08AM +0100, Matthew Johnson wrote:
> > Hi, I have just got lvm setup on my machine - and it works fine. However,
> > I had a problem with my root partition (not lvm) and when it came back up
> > one of the 2 lvm partitions on that disk said it wasn't a valid physical
> > volume. The otherone was fine, and the logical volumes that weren't on the
> > first physical volume (it wasn't striped) mounted OK. The one that
was
> > partially on that first pv didn't, though - it said the device was not a
> > valid block device.
> >
> > The question is, can I easily get the partition back so it mounts OK, and
> > failing that can I recover all (or any) of the data. all my /usr is on
> > there, plus some other less critical stuff, so I really could do with it.
> >
> > more system details: Debian woody, with a custom 2.4.19 kernel with lvm
> > compiled in. The fs's all run reiserfs. THe volume group contains
> > /dev/hde6 /dev/hde7 & /dev/hda5. e7 & a5 are OK when I run pvdisplay, and
> > /dev/lvm1/var and /dev/lvm1/utils mount fine. /dev/lvm1/music doesn't
> > mount - I get errors reading superblock etc, and when I pvdisplay
> > /dev/hde6 it says it is not a valid physical volume.
>
> # pvcreate /dev/hde6
> # vgcfgrestore -n lvm1 /dev/hde6
> # vgscan
>
> should recover the volume group for you.
>

OK, from that I get the error "size of volume differs from backup",
although the volume group mounts fine. However, mount can't find a
filesystem. Bit more info - I checked the partition sizes (I was playing
around with some) - but they cylinder numbers are the same as the list I
have before I started. Second - its a 3gb partition, and the missing
logical volume is a 10Gb one. Hence, the last 7Gb are on the OK physical volumes. Can I
get back at least those, if not the whole lot.

Alternatively, at this point the question might better be asked to the
reiserfs lists.

Matt
