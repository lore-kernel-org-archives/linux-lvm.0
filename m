Message-ID: <3D7DE10F.733BFCE6@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] software mirroring
References: <4808.24.46.54.254.1031320260.squirrel@mail.scottsavarese.com> <20020906201136.GB5094@localhost> <3256.24.46.54.254.1031409280.squirrel@mail.scottsavarese.com> <20020907204200.GA3481@localhost>
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
Date: Tue Sep 10 07:10:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Jos=E9 Luis Domingo L=F3pez wrote:
> =

> On Saturday, 07 September 2002, at 10:34:40 -0400,
> Scott Savarese wrote:

> There shouldn't be any problems at all, except for bootup: it can be
> tricky (complex, prone to error or simply impossible, I don't know ;)
> to get a box boot off a LV on top of a software RAID1. But technically,=

> it should be as simple as creating a partition on each disk, creating
> the RAID1 from them, initialize /dev/md0 as a PV for use with LVM,
> create a VG consisting of just this PV, and finally create as many LV a=
s
> you need (size permitting).

Thats the way to do it.

 =

> I have not had the chance to try it by myself, due to lack of hardware,=

> but should work. Maybe the hard part is to do it at install time and ge=
t
> the system to boot from a LV created this way.

I have tried it, and it works fine.




JonB
