From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Urgent, Please help LVM-krash
Message-ID: <20011217122223.A28720@sistina.com>
References: <1008250625.4350.5.camel@detrius>
Mime-Version: 1.0
In-Reply-To: <1008250625.4350.5.camel@detrius>; from Erik.Bagfors@ardendo.se on Thu, Dec 13, 2001 at 02:37:04PM +0100
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
Date: Mon Dec 17 05:22:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

On Thu, Dec 13, 2001 at 02:37:04PM +0100, Erik B=E5gfors wrote:
> Hi all!
>=20
> Yesterday I krashed my lvm.  This is the first time I'm having real
> problems with it.
>=20
> This is what happened.
>=20
> I was going to add a new lv and used the lvcreate-command as usual.=20
> This time I forgot the -n switch and when I realized that I hit ctrl-c..
> BAD idea!

Erik,

that's actually starneg, because the tools intercept ctrl-c and the like =
:-(

>=20
> Now my vg is gone.  I can't get it back whatever I try.  Any help would
> be VERY appreciated.
>=20
> A vgscan just sais "no volume groups found" or something like that.=20
> doing a pvdisplay on the pv's in my vg gives me that they should be in
> "diskvg" (which is correct).  I've tried doing vgcfgrestore from the
> backups in /etc/lvmconf but that doesn't help.  vgscan still doesn't
> find it.

Did you run "pvcreate -ff" on all of your PVs belonging to diskvg *before=
*
you run vgcfgrestore on all of them?  vgscan afetrwards.

>=20
> I looked at the HOWTO and found a program named uuid_fixer that looked
> like it could solve the problem but it died with an "illegal
> instruction" regardless of if I used the precompiled version or compile=
d
> it myself.
>=20
> This is on a mandrake 8.1-box with lvm, xfs, reiserfs and devfs so ther=
e
> are alot of things to think about.
>=20
> When doing stuff I did the following first:
>  reboot into single user, remount / rw, mount /proc, restore some
> standar-stuff into /dev, and start devfsd
>=20
> After that I tried vgcfgrestore, vgscan, uuid_fixer and just about
> everything I could think or.

I think it was just the lack of pvcreate before vgcfgrestore.

>=20
> Please please please help me.  Can anyone solve this.  There are over 6=
0
> GB of stuff on this computer and it needs to work TODAY :(
>=20
> /Erik
>=20
> --=20
> Erik B=E5gfors               | http://www.ardendo.se/
> Erik.Bagfors@ardendo.se    | GSM +46 733 279 273
> fingerprint: 6666 A85B 95D3 D26B 296B 6C60 4F32 2C0B 693D 6E32
>=20
>=20
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
