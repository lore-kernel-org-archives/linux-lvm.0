Subject: Re: [linux-lvm] LVM and RAID
Message-ID: <20031110204133.GB3352@planungsteam-eb.de>
References: <21E8E34076807C41A646FDC666B15BDF0876A1@minna.combox.de> <1067952111.20554.26.camel@lupin> <20031109221838.GD4425@amphibian.dyndns.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20031109221838.GD4425@amphibian.dyndns.org>
From: Holger Parplies <wopp@planungsteam-eb.de>
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
Date: Mon Nov 10 14:43:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Toad wrote:
> On Tue, Nov 04, 2003 at 01:21:51PM +0000, Geoff Dolman wrote:
> > On Tue, 2003-11-04 at 13:09, Tobias Gablunsky wrote:
> > > [...]
> > > Well thats fine but if you want your kernel to boot use your RAID-Volumes
> > > automatically you have to give it partition type 0xFD. And if you want
> > > automatically mounted LVM you need to give it the partition type 0x8E 
> > 
> > But why? Your RAID set will be made on say /dev/hda1 and /dev/hdb1
> > creating say /dev/md0, but your lvm partition will exist on /dev/md0.
> 
> Does the kernel autodetection work in this case?

Yes. Presuming your init scripts start RAID first before executing
vgscan ...

Why should it not work? vgscan doesn't care about partition types. It
scans possible block devices for LVM metadata (in LVM1 it's a hardcoded
list of devices, in LVM2 it's configurable, I believe). Among these are
the raid devices, so if they're active, they'll be recognized as PVs.

> Would you need to partition /dev/md0 into a boot partition and an LVM PV?

No. You can't anyway, as far as I'm aware. Well, you can probably write
a partition table to it, but you can do that with /dev/zero too (I just
tried it out :-). Nobody will use it.

Regards,

Holger
