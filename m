From: Ragnar =?iso-8859-15?Q?Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] Volume Group Size
Message-ID: <20030625181135.GU24737@vestdata.no>
References: <200306251800.40336.stuart@fotango.com> <20030625114634.Z18762@schatzie.adilger.int>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030625114634.Z18762@schatzie.adilger.int>
Content-Transfer-Encoding: quoted-printable
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
Date: Wed Jun 25 13:12:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: Stuart Fox <stuart@fotango.com>, linux-lvm@sistina.com

On Wed, Jun 25, 2003 at 11:46:34AM -0600, Andreas Dilger wrote:
> On Jun 25, 2003  18:00 +0100, Stuart Fox wrote:
> > I cant find information about the maximum volume group size in the cu=
rrent
> > 2.4  series kernel.
> >=20
> > Id like to be able to join 2 1.75Tb raid arrays into  1 3.5Tb array.
> > Is this possible?
>=20
> No, there is a limit of 2TB for all block devices in 2.4 kernels.  With
> 2.5, there is a "large block device" configure option that lets you hav=
e
> larger block devices.  There is apparently also a patch to support this
> on 2.4 kernels, but AFAIK it is not very widely used/tested.

The question was regarding volum goups, not logical volums.

So, correct me if I'm wrong, but I think the answer is yes, you will be=20
able to join 2 1.75 Tb volume groups into a single 3.5 Tb volum group,=20
if only an apropriate extent-size was set on VG-creation.

However, each Logical Volum in the Volum-Group need to be smaller than 2
TB.

AFAIK the "large block device" feature in 2.5 does not enable > 2TB
logical volumes - it only fixes the general block-device layer, md and
the scsi-subsystem. At least that used to be the case - maybe someone
knows if it has changed?


--=20
Ragnar Kj=F8rstad
Zet.no
