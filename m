Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] snapshot with bigmem broken
Message-ID: <37885B2630DF0C4CA95EFB47B30985FB020EBDA8@exchange-1.umflint.edu>
From: "Lauro, John" <jlauro@umflint.edu>
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
Date: Fri May 16 07:40:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> > I did more testing, and it appears that snapshots in LVM will not
work
> > with either 4GB or or 64GB support enabled in the kernel under
2.4.20.
> > This includes both LVM 1.0.7 or the latest LVM2.
> >
>=20
> That's a known issue. You are faced with a VM flaw.
>=20
> I presume that it's not LVM snapshots only bacause HIGHMEM is
> basically broken.

Can you give more specifics/examples/web links/etc?  Does this mean I
should avoid LVM completely with HIGHMEM?  What if any other problems
should I expect with LVM (and/or other software)?

> > Is there anyone using LVM snapshots with 64GB RAM support (or even
4GB
> > RAM support, as snapshots would be good for at least our medium
size
> > servers if not our large ones)?  Is so, let me know the kernel
version
> > and LVM version you are using so that I can try it.
>=20
> Probably not, because the system lifelocks on bounce buffers (which
is
> the sympton of the principle HIGHMEM bug).
> Obviously not a lot of HIGHMEM users out there raising priorities to
fix
> this.

Is this easy to reproduce?  If so, how?  Sounds like I am either a
lucky early adopter of a >4GB Libux system, and/or the problem is rare
even on HIGHMEM systems?

Thanks.
