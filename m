From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Subject: Re: [linux-lvm] Cluster LVM
Message-Id: <20020227191419.J27155@vestdata.no>
References: <3C7CC4F3.9DA76FC9@lmco.com>
    <200202271145.MAA11838@mailgate.sara.nl>
    <20020227101949.M12832@lynx.adilger.int>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020227101949.M12832@lynx.adilger.int>; from
    adilger@turbolabs.com on Wed, Feb 27, 2002 at 10:19:49AM -0700
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
Date: Wed Feb 27 12:14:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Wed, Feb 27, 2002 at 10:19:49AM -0700, Andreas Dilger wrote:
> On Feb 27, 2002  12:45 +0100, Remco Post wrote:
> > clusters all have one major problem to solve: split brain. Make sure =
that the=20
> > node manipulating the LV/VG does indeed have the right to do so, and =
doesn't=20
> > screw up everything for everybody. Maybe introduce a (LV/VG) master c=
oncept=20
> > into the VG, so as long as that is set, no other node in the cluster =
will=20
> > manipulate anything in the vg. (just some random rant, ignore if I'm =
talking=20
> > nonsense ;)
>=20
> Having a single master is a _terrible_ idea, since this would mean that
> if that node is down you are unable to change the VG until/if it is bac=
k
> working again.

The VG being locked is not _that_ terrible - after all - you only need
this to change your storage configuration (I don't expet the LVM to
actually lock access to the device).

> Rather use a DLM (as the other poster suggested) and a client needs to
> get a lock on the VG in order to change anything.  You can start with
> a lock per VG and one per shared PV not in a VG, and then go more fine
> grained if you want (e.g. write lock on VG and specific LV being change=
d,
> which does not block users of other LVs).  In the end, because you are
> not changing a VG configuration very often, and it doesn't take very lo=
ng
> when you do (excluding pvmove), the big lock is probably enough.

Alternatively one could implement the cluster LVM as a simple
"resource", and leave it to the resource manager to do locking and
STONITH. The ocf (Open Cluster Framework) or "linux-ha" lists would be
good places to query for more information.



--=20
Ragnar Kj=F8rstad
Big Storage
