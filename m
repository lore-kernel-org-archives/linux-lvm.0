Return-Path: <fzzgrr@gmx.net>
Date: Tue, 21 Aug 2001 15:03:31 +0200
From: Ulrich Wiederhold <U.Wiederhold@gmx.net>
Subject: Re: [linux-lvm] vgscan && vgchange -ay at startup
Message-ID: <20010821150331.B763@sky.net>
References: <20010821130033.D402@sky.net> <20010821070403.A16248@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20010821070403.A16248@sistina.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hello,
* AJ Lewis <lewis@sistina.com> [010821 14:04]:
> On Tue, Aug 21, 2001 at 01:00:33PM +0200, Ulrich Wiederhold wrote:
>=20
> > Anybody else had this problems with debian unstable?
>=20
> There's a good chance that your startup script is running either before r=
oot
> is mounted read/write (in which case the LVM tools can't write to /etc) or
> before /proc is mounted (which is less likely because this usually just
> makes vgscan really slow, not fail).  Check your init scripts and verify
> that root is writable before the S25lvm script runs.

I thaught about this problem too and disabled the "read-only" entry in
/etc/lilo.conf, this hasn=B4t solved the problem.

Now I looked into /etc/rcS.d/ and found out that root in mounted ro in
S10checkroot.sh together with /proc.
Lvm runs in S25lvm and I think root will be mount rw in S35mountall.sh,
so I think it=B4s a bug in the debian-packages.
Right?

Thanks.
Uli


--=20
'The box said, 'Requires Windows 95 or better', so i installed Linux - TKK 5
