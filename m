From: Greg Freemyer <freemyer@NorcrossGroup.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20020829150824.WQMQ2113.imf22bis.bellsouth.net@TAZ2>
Subject: [linux-lvm] FWD: Re: Draft Snapshot Regression Test
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
Date: Thu Aug 29 10:09:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>

On the xfs regression test I posted yesterday, there is concern that my check =
for lvm being present in the kernel is not general enough to check LVM 1 and =
LVM 2, or even EVMS.

Can anyone recommend a more general method of checking?

Possibilities:

   lsmod | grep lvm                only looks for modules, so it is flawed.

   if [ -d /proc/lvm ]                apparently only works for LVM 1

   grep lvm /proc/devices       might be a good choice, but I assume will not =
find EVMS setups


Greg Freemyer
Internet Engineer
Deployment and Integration Specialist
Compaq ASE - Tru64 v4, v5
Compaq Master ASE - SAN Architect
The Norcross Group
www.NorcrossGroup.com

---------- Forwarded Message ----------

FROM:      Andi Kleen <ak@suse.de>
TO:      Ragnar Kj?rstad <xfs@ragnark.vestdata.no>
DATE:      Thu, 29 Aug 2002 14:37:37 +0200

RE:      Re: Draft Snapshot Regression Test

On Thu, Aug 29, 2002 at 02:11:46PM +0200, Ragnar Kj?rstad wrote:
>=20
> On Thu, Aug 29, 2002 at 05:58:21PM +1000, Nathan Scott wrote:
> > > #Verify we have the a lvm enabled kernel
> > > # TODO (This assumes lvm is a module.  What if it is linked?  I don't =
know how to check that.
> > > lsmod | grep lvm-mod;
> > > if [ $? !=3D 0 ]; then _notrun "This test requires the LVM kernel module =
be present"; fi
> >=20
> > A better approach here would be to grep for lvm in /proc/devices,
> > this would work for module/non-module builds.
>=20
> or=20
> [ -d /proc/lvm ] || _notrun=20

This will likely break with LVM2/EVMS, which have lvm compatible=20
user utils and support snapshots, but not the /proc file.

-Andi
