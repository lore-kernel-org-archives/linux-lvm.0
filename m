From: "William Blunn" <bill@tao-group.com>
Subject: Re: [linux-lvm] lvm and 'poor mans raid' on heterogenous hard drives!
Message-Id: <000e01c1bab8$e046f520$216410ac@tao.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <m3zo23u0o7.fsf@shakti.rupa.com>
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
Date: Thu Feb 21 03:19:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> Andreas Dilger <adilger@turbolabs.com> writes:
>=20
> > Swap is a bad move, since you can just add multiple swap spaces with =
the
> > same priority (if you so choose) and it will do the striping for =
you.
> > Likewise, you could put each of the above trees on their own drive =
and
> > you would probably get better overall performance than striping.
>=20
> This suggestion has always bothered me.  Yes, if all you care about
> performance, setting up swap this way works fine.  However, for every
> drive you add you increase the likelyhood that you're system will fail
> due to a drive failure (what happens when one of the swap slices
> suddenly dissapears?).

For this situation, we are considering drives failing entirely. (If you
consider grown defect bad blocks appearing, then it is probably no more
likely for a bad block to appear inside 1G of disk spread across two
disks than it is for a bad block to appear inside 1G of disk on one
disk.)

Swap devices only contain volatile data anyway.

I wouldn't mind losing the contents of my swap device. The machine will
probably crash. It's the same as if the machine went down through a
power outage. Not a big problem. Assuming only the swap device failed, I
could just re-boot and run with a bit less swap space.

If the drive fails, I lose the contents of any filesystems on the same
drive. Much more significant. The fact that the machine went down
because the swap device failed pales into insignificance, because now
all the data has disappeared. No-one can do any work until we have
replaces disk(s), sorted out the filesystems, restored from backups etc.

If the swap had been configured on a different disk, we would have the
marginal benefit of the machine probably not crashing, but the
filesystems on the failed disk would still have disappeared, and we
would still have the same problem.

So I spread my swap over all the fast disks, by putting them directly
on to disk paritions and setting the same priority value.

Regards,

Bill
--=20
William H. Blunn - bill@tao-group.com - Developer Support
Tao
62/63 Suttons Business Park, Earley, READING, RG6 1AZ, United Kingdom
Tel: +44 118 901 2999 - Fax: +44 118 901 2963 - http://tao-group.com/
