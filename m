Subject: Re: [linux-lvm] Urgent, Please help LVM-krash
From: Erik =?ISO-8859-1?Q?B=E5gfors?= <erik@bagfors.nu>
In-Reply-To: <20011217122223.A28720@sistina.com>
References: <1008250625.4350.5.camel@detrius> 
	<20011217122223.A28720@sistina.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <1008589296.18947.4.camel@detrius>
Mime-Version: 1.0
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
Date: Mon Dec 17 05:40:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: Linux LVM Mailinglist <linux-lvm@sistina.com>

m=E5n 2001-12-17 klockan 12.22 skrev Heinz J . Mauelshagen:
> On Thu, Dec 13, 2001 at 02:37:04PM +0100, Erik B=E5gfors wrote:
> > Hi all!
> >=20
> > Yesterday I krashed my lvm.  This is the first time I'm having real
> > problems with it.
> >=20
> > This is what happened.
> >=20
> > I was going to add a new lv and used the lvcreate-command as usual.=20
> > This time I forgot the -n switch and when I realized that I hit ctrl-c.=
.
> > BAD idea!
>=20
> Erik,
>=20
> that's actually starneg, because the tools intercept ctrl-c and the like =
:-(

Hmm.. well .. it did break the program for me..  Maybe it's an old
version with mandrake 8.1??

I know that the kernel lvm-stuff is NOT the latest version.  Is it ok to
run an old version or do I risk damage to the system??
=20
> > Now my vg is gone.  I can't get it back whatever I try.  Any help would
> > be VERY appreciated.
> >=20
> > A vgscan just sais "no volume groups found" or something like that.=20
> > doing a pvdisplay on the pv's in my vg gives me that they should be in
> > "diskvg" (which is correct).  I've tried doing vgcfgrestore from the
> > backups in /etc/lvmconf but that doesn't help.  vgscan still doesn't
> > find it.
>=20
> Did you run "pvcreate -ff" on all of your PVs belonging to diskvg *before=
*
> you run vgcfgrestore on all of them?  vgscan afetrwards.

At first I didn't, but I tried that later.  Same thing.
=20
> >=20
> > I looked at the HOWTO and found a program named uuid_fixer that looked
> > like it could solve the problem but it died with an "illegal
> > instruction" regardless of if I used the precompiled version or compile=
d
> > it myself.
> >=20
> > This is on a mandrake 8.1-box with lvm, xfs, reiserfs and devfs so ther=
e
> > are alot of things to think about.
> >=20
> > When doing stuff I did the following first:
> >  reboot into single user, remount / rw, mount /proc, restore some
> > standar-stuff into /dev, and start devfsd
> >=20
> > After that I tried vgcfgrestore, vgscan, uuid_fixer and just about
> > everything I could think or.
>=20
> I think it was just the lack of pvcreate before vgcfgrestore.

Perhaps.

But I think there was another problem. I've had a few small problems
with xfs under mandrake 8.1.  Sometimes I've lost some files.  I really
don't know why but the data in them have been corrupted or they were 0
bytes in size.  I have been really mean to the computer and killing the
power on it while it was running and so on. But that was never a problem
under reiserfs so I'm back with 100% reiserfs now.  I think the files in
/etc/lvmconf were strange.
=20
> >=20
> > Please please please help me.  Can anyone solve this.  There are over 6=
0
> > GB of stuff on this computer and it needs to work TODAY :(
> >

Like I said I needed that computer back the same day.  I ended up
reinstalling the box.  Loosing the data I had on it.  Luckily most data
was either not important or could be restored from backup. The only
thing I really lost was the system with all it's services and the like.=20
So I guess I need to resetup samba/appleshare/web/nfs/dns and so on. =20

/Erik
--=20
Erik B=E5gfors               | erik@bagfors.nu
Supporter of free software | GSM +46 733 279 273
fingerprint: 6666 A85B 95D3 D26B 296B 6C60 4F32 2C0B 693D 6E32
