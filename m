From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] lvm-1.0.1-rc4 and 2.4.13
Message-ID: <20011029084424.D4182@tykepenguin.com>
References: <20011026005405.A21775@sky.net> <20011026095641.C587@tykepenguin.com> <20011026213005.C928@sky.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011026213005.C928@sky.net>; from U.Wiederhold@gmx.net on Fri, Oct 26, 2001 at 09:30:05PM +0200
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
Date: Mon Oct 29 02:59:08 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Fri, Oct 26, 2001 at 09:30:05PM +0200, Ulrich Wiederhold wrote:
> * Patrick Caulfield <caulfield@sistina.com> [011026 10:56]:
> > On Fri, Oct 26, 2001 at 12:54:05AM +0200, Ulrich Wiederhold wrote:
>=20
> Two questions:
> 1. Why isn=B4t lvm-1.0.1-rc4 in the current Linux-Kernel? Why do I stil=
l
> need to patch? I think this version is already stable and better than
> the older one, isn=B4t it?

It just isn't :-( we've submitted (most of) it to Alan Cox and his kernel=
 is
*much* more up-to-date than Linus'. I don't know just why the patches hav=
en't
been accepted by Linus. He is apparently happy to completely replace the =
VM but
won't fix some fairly serious bugs elsewhere...bizarre.

> 2. Should I write a bug-report to the xfs-guys? If yes, can I include
> your Email, Patrick?

I wouldn't like to claim it's an XFS bug as I haven't had a close look at=
 their
patches. I do know that they include some LVM patches in their distributi=
on so
it's certainly worth asking them nicely to upgrade them I suppose.

Feel free to quote my email..I don't think I wrote anything actionable :-=
)

patrick
