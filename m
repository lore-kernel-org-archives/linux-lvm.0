Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] EXT3 vs Reiserfs
Message-ID: <CEADF0D83077F7458B763904E47AA709BD63@exchange.neokimia.com>
From: "Yanick Quirion" <yanick.quirion@neokimia.com>
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
Date: Mon Dec  8 15:22:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com


> -----Original Message-----
> From: Ajay Shekhawat [mailto:ajay@cedar.Buffalo.EDU]
> Sent: 8 December, 2003 11:26
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] EXT3 vs Reiserfs
>=20
> On Mon, Dec 08, 2003 at 04:25:47AM +0100, Markus Schiltknecht wrote:
> > why is that? thought reiser was faster than ext3 while ext3 would be
> > considered more stable (in general).
>=20
> Reiser has this "tail packing" option, as well as some other
optimizations
> that benefit sites with lots of small files (best example: Usenet
feeds).
> However, this can come at a price for really LARGE files (as a DB
would
> need).
>=20
> > Before getting ways off topic: where can I find a good comparison /
> > discussion on different filesystems?
>=20
> Checkout
> 	http://oregonstate.edu/~kveton/fs/
>=20
> Since noone has mentioned XFS, let me throw in my recommendation for
XFS.
> XFS (like, probably, IBM's JFS) is a top-notch filesystem.
> Try it out in your scenario, you might like it.


I'm currently testing XFS. It seems to be better than reiserfs, because
it supports ACLs and online resizing (I applied all patches with
success). But is XFS supports shrink? With reiserfs it possible to
shrink a filesystem, but this function doesn't seems to be available
with XFS.

Thanks

Yanick
