Message-ID: <01C0280D.A7A0E800.smdenton@bellsouth.net>
From: "S. Michael Denton" <smdenton@bellsouth.net>
Reply-To: "smdenton@bellsouth.net" <smdenton@bellsouth.net>
Subject: RE: [linux-lvm] LVM on 2.2.17 (again)
Date: Tue, 26 Sep 2000 23:01:06 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: "linux-lvm@msede.com" <linux-lvm@msede.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Tuesday, 26 September 2000 18:07, John DeFranco
[SMTP:defranco@cup.hp.com] wrote:
> Thanks! That helped alot. One other question,
> I wanted to pvcreate a software RAID device
> (/dev/md0 in this case). This is a simple two
> disk mirror (since LVM does not do mirroring).
> It would not let me do this however. The FAQ
> seems to indicate that I can (at least that
> the way I am interpreting the last section: 
> 
>   I recommend to use dedicated hardware RAID 
>   subsystems or Multiple Devices to have the 
>   redundancy below the LVM. In this case you 
>   just don't care about Logical Volume data 
>   redundancy and you don't run into the 
>   dangerous situation that your data is 
>   not redundant by accident.
> ).
> 
> Does anyone know if this is possible and if so how
> to accomplish it?

When I was doing the same thing on my 2.2.13 box a while back, I just
md'd the pv's ie pvcreated on the actual block devices and then
created md0 from the lv devices like so:

pvcreate /dev/hd[a,b]1
vgcreate mirrorvg /dev/hd[a,b]1
lvcreate -n mirrorlv1 mirrorvg /dev/hda1
lvcreate -n mirrorlv2 mirrorvg /dev/hdb1
mdcreate raid1 /dev/md0 /dev/mirrorvg/mirrorlv1
/dev/mirrorvg/mirrorlv2

... this seemed to give me enough redundancy to make it work :)

IMHO I don't see why doing it the other way around wouldn't work too
but perhaps there's something I'm missing in the equation... but I
only tried the above method.

If all else fails, maybe this will work for you?

> Thanks! 
> 
> Andreas Dilger wrote:
> > 
> > John DeFranco writes:
> > > I've checked the LVM email archives so I know there has
> > > been lots of discussions on how to get LVM to work on
> > > 2.2.17, but unfortunately I'm having problems just
> > > building the kernel. I started with Turbolinux Server
> > > 6.0.2 (which is 2.2.14) and then added the 2.2.15-2.2.17
> > > patches. When I build I get:
> > >
> > > lvm-snap.c:28: linux/iobuf.h: No such file or directory
> > > lvm-snap.c: In function `lvm_snapshot_COW':
> > > lvm-snap.c:253: dereferencing pointer to incomplete type
> > > lvm-snap.c:257: warning: implicit declaration of function
> > > `brw_kiovec'
> > > lvm-snap.c: In function `lvm_snapshot_alloc_iobuf_pages':
> > > lvm-snap.c:308: warning: implicit declaration of function
> > > `expand_kiobuf'
> > 
> > Are you using my 2.2 patches (which is a backport of 0.8final
> > from 2.4)? In this case you need to also apply the RAWIO patches
> > available at Stephen Tweedie's site 
> > ftp://ftp.linux.org.uk/pub/linux/sct/
> > Alternately, if you don't need/want LVM snapshots, you can delete
> > lvm-snap.c, and delete the references in lvm.c to any "snap"
> > functions, etc.  There are about half a dozen places where this
> > happens.  If I get around to it, I will update my patch to
> > simplify turning off lvm snapshots...  
> > 
> > Cheers, Andreas
> > --
> > Andreas Dilger  \ "If a man ate a pound of pasta and a pound of
> > antipasto, 
> >                  \  would they cancel out, leaving him still
> > hungry?" http://www-mddsp.enel.ucalgary.ca/People/adilger/       
> >        -- Dogbert 
> 
> -- 
> ==========
> Cheers
>    -jdf


Scott Denton
smdenton@bellsouth.net
EFnet Handle: SteelWyng
ICQ UIN: 24149258
AIM Screen Name: SteelWyng

-----BEGIN PGP SIGNATURE-----
Version: PGPfreeware 6.5.3 for non-commercial use <http://www.pgp.com>

iQA/AwUBOdFi8nC+DNfF0nVpEQJliACglKL9vWACZQ9A7QlueQ1U1a4BDa8AoIwS
xDECQg9zMZ2rHfhGkxOqAscx
=Mz6G
-----END PGP SIGNATURE-----
