From: Mike Williams <mike@gaima.co.uk>
Subject: Re: [linux-lvm] once again about 2.6 kernel
References: <20031015130801.49215.qmail@web41307.mail.yahoo.com>
In-Reply-To: <20031015130801.49215.qmail@web41307.mail.yahoo.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Message-Id: <200310151909.15425.mike@gaima.co.uk>
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
Date: Wed Oct 15 13:10:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/Plain; charset="us-ascii"
To: linux-lvm@sistina.com

=2D----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Wednesday 15 October 2003 14:08, Valentine Kouznetsov wrote:
> Hi,
> I had a look at lvm mailing list about kernel 2.6
> questions. So far I understood that in order to run
> 2.6 kernel with LVM2 on a system which previously run
> 2.4 kernel with LVM1 you need
> 1) patch 2.4 kernel with device-mapper patch
> 2) use new LVM2 tools (LVM2.2.00.07) which need to be
> installed separetly on the system to allow
> simulteneously use LVM1 and LVM2
>
> Is it correct?

Not from what little I know.
LVM2 can read LVM1 metadata, and convert it to LVM2. I've done this myself=
=20
too, so I know it works! :)
Take a look at vgconvert.
The only problem you may have if you convert the metadata is not being able=
 to=20
go back to 2.4 without the patching you mention.

=2D --=20
Mike Williams
=2D----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQE/jY1LInuLMrk7bIwRAr0vAJwNRAfnU2VH2KanHSgQ+tCn4ZAKPACeLZRN
oLmkQ4QUsMsTmkwv7fhMoWI=3D
=3DYNCy
=2D----END PGP SIGNATURE-----
