Message-Id: <200112131200.fBDC0Fg18804@ecdl.ecdl.hut.fi>
From: Mika Lansirinne <Mika.Lansirinne@ecdl.hut.fi>
Subject: Re: [linux-lvm] loop devices
References: <E16ETgg-0004tN-00@hermes.sistina.com>
In-Reply-To: <E16ETgg-0004tN-00@hermes.sistina.com>
MIME-Version: 1.0
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
Date: Thu Dec 13 05:58:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

I made a quick and dirty hack and changed "/proc/partitions" to=20
"/etc/partitions" in tools/lib/lvm_dir_cache.c. Then I copied=20
/proc/partitions to /etc and added a few lines for loop[0,1] to that file=
.=20
That does the trick for me. I could get my job done (they were meant to b=
e=20
temporary anyway). So it seems, like I suggested earlier, that the=20
lvm_dir_cache function just ignores loop devices.

As I see, In lvm_dir_cache.c, only partitions get checked. And only if th=
at=20
fails to add entries to the dir_cache list then will other devices be=20
checked. There is a reason for that isn't there??

Oh yes, I use LVM tools from the package 1.0.1 + nonpatched 2.4.16 kernel.


-Mika


On Wed, 12 Dec 2001 13:58:56 -0600,Tom Brown wrote:
>
> I too tried to make a pv on a loop device when I first downloaded lvm
> and ran into a stone wall. Stepping through the code that Mika pasted
> the debugging output from suggested it was not supported but I didn't
> know how to fix it.
>

--=20
Mika L=E4nsirinne, System Manager / Research Engineer, M.Sc. (E.E.)
Helsinki University of Technology
Electronic Circuit Design Laboratory
P.O. Box 3000				Email: mla@ecdl.hut.fi
FIN-02015 HUT				Tel: +358 9 451 2277
Finland					Fax: +358 9 451 2269
