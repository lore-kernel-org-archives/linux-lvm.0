From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Snapshot attempt causes kernel BUG
Message-ID: <20030516130418.D24422@sistina.com>
References: <37885B2630DF0C4CA95EFB47B30985FB0187FFAF@exchange-1.umflint.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <37885B2630DF0C4CA95EFB47B30985FB0187FFAF@exchange-1.umflint.edu>; from jlauro@umflint.edu on Tue, May 13, 2003 at 04:08:06PM -0400
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
Date: Fri May 16 06:13:01 2003
List-Id: <linux-lvm.redhat.com>
content-type: text/plain
To: linux-lvm@sistina.com

John,

this is a known VM flaw you're faced with.
There are no VM hackers fixing it right now TTBOMK, because
of the little priority this seems to have.


On Tue, May 13, 2003 at 04:08:06PM -0400, Lauro, John wrote:
> ?Hello,
> =20
> When I try to create a snapshot (of a 400GB logical volume)
> (command: lvreate --size 200M --snapeshot -n snap
> /dev/Volume00/LogVol00)
> =20
> I receive a kernel bug.
> ...
> kernel BUG at vmalloc.c:242!
> ....   (ask if you want stack trace, etc)
> Segmentation fault
> =20
> I also treid with a default install of RedHat 9 (I need to build my
> own kernel, but figured it should be working out of the box, so tried
> virgin RH9 for testing....)  It didn't give the kernel bug, but a
> memory allocation error (and this server has 12GB of RAM).
> =20
> I then built my own kernel, with a standard 2.4.20 kernel and patches
> for LVM 1.0.7, and the VFS-LOCK patch.  That produces the bug when
> lvcreate for a snapshot is run...  On the off chance it was system
> related I tried many different things, with no luck.  I finally was
> able to get it to work after I turned off the BIGMEM support (so only
> using 1GB of RAM instead of 12GB), and brought the CPU down to 486
> instead of P-4.  It then worked!  Not sure if it's the P-4 or the
> BIGMEM that causes the problem yet...
> =20
> =20
> =20
> ????????????????????????????????????{??[???x%??e?{??[????)???&??i????l???=
)???&?f??f??X??)??b?????y?m???0s??3??=1Bm????Wi????s?L??T??9d
--=20

Regards,
Heinz    -- The LVM Guy --

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-
