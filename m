From: Kevin Corry <kevcorry@us.ibm.com>
Subject: Re: [linux-lvm] Volume Group Size
References: <200306251800.40336.stuart@fotango.com> <20030625114634.Z18762@schatzie.adilger.int> <20030625181135.GU24737@vestdata.no>
In-Reply-To: <20030625181135.GU24737@vestdata.no>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200306251348.19097.kevcorry@us.ibm.com>
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
Date: Wed Jun 25 13:53:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com, Ragnar =?iso-8859-15?q?Kj=F8rstad?= <lvm@ragnark.vestdata.no>, Stuart Fox <stuart@fotango.com>

On Wednesday 25 June 2003 13:11, Ragnar Kj=F8rstad wrote:
> On Wed, Jun 25, 2003 at 11:46:34AM -0600, Andreas Dilger wrote:
> > On Jun 25, 2003  18:00 +0100, Stuart Fox wrote:
> > > I cant find information about the maximum volume group size in the
> > > current 2.4  series kernel.
> > >
> > > Id like to be able to join 2 1.75Tb raid arrays into  1 3.5Tb array.
> > > Is this possible?
> >
> > No, there is a limit of 2TB for all block devices in 2.4 kernels.  With
> > 2.5, there is a "large block device" configure option that lets you have
> > larger block devices.  There is apparently also a patch to support this
> > on 2.4 kernels, but AFAIK it is not very widely used/tested.
>
> The question was regarding volum goups, not logical volums.
>
> So, correct me if I'm wrong, but I think the answer is yes, you will be
> able to join 2 1.75 Tb volume groups into a single 3.5 Tb volum group,
> if only an apropriate extent-size was set on VG-creation.

The limitation for the size of a volume-group is a little obscure. The=20
volume-group metadata (for LVM1 volume-groups - LVM2 format is probably=20
different) stores the total number of PEs in the group as a 32-bit number.=
=20
Thus, you are limited to 2^32 total extents. With a PE size of 4 MB, this i=
s=20
2^54 bytes, or 16 exabytes (adjust accordingly for a different PE size).

> However, each Logical Volum in the Volum-Group need to be smaller than 2
> TB.
>
> AFAIK the "large block device" feature in 2.5 does not enable > 2TB
> logical volumes - it only fixes the general block-device layer, md and
> the scsi-subsystem. At least that used to be the case - maybe someone
> knows if it has changed?

Again, the LVM1 format uses a 32-bit number to record the size (in sectors)=
 of=20
each LV. So the 2 TB limitation still exists. However, the metadata also=20
records the number of extents allocated to the LV, so the tools *could* be=
=20
written to ignore the lv-size field and always calculate based on the numbe=
r=20
of allocated extents. This would push the limit up to pe_size * 2^32 bytes,=
=20
but would of course break backwards-compatibility with older tools (not sur=
e=20
if that really matters).

=2D-=20
Kevin Corry
kevcorry@us.ibm.com
http://evms.sourceforge.net/
