Return-Path: <smdenton@bellsouth.net>
Message-ID: <01C072A5.C4DF1B20.smdenton@bellsouth.net>
From: "S. Michael Denton" <smdenton@bellsouth.net>
Subject: RE: [linux-lvm] Patched kernel sources
Date: Sat, 30 Dec 2000 21:16:25 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Saturday, 30 December 2000 20:25, Andreas Dilger
[SMTP:adilger@turbolinux.com] wrote:
> Scott Denton writes:
> > > > Andreas Dilger writes:
> > > > > You probably DON'T want to use the ext3 online resizing
> > > > > patches.
> > > >
> > > > Found the reference to that very idea in the src code on
> > > > sourceforge for ext2online... how about ext2online resizing
> > > > of an ext3fs (since there's supposedly no structural
> > > > difference between the two)?
> > >
> > > I'm not quite sure what you mean...  Maybe ext2resize (offline)
> > > resizing of an ext3 fs?  This is already possible (I do it
> > > regularly).
> > 
> > Not offline, online... resizing the ext2/3 fs while mounted... it
> > works rather well with ext2fs but I haven't yet tried or seen
> > reference to using ext2online on a mounted ext3fs... looking
> > through the reiserfs src now to see if i can find reference to
> > online-resizing as well... what I really am looking for is LVM
> > with MDs and a journaled filesystem with online AND offline
> > resizing capability... preferably both extension and reduction
> > abilities, but i can live with only extension for the time being.
> 
> That's exactly what I was trying to tell you before - online
> resizing of an ext3 filesystem doesn't work at present because of
> bad interaction with the journal - it needs to be rewritten.  There
> are 2 parts to the resizer - the kernel patch(es), and user part -
> ext2online.
> 
> There IS online extension for reiserfs, but not online reduction.

OK, perhaps I'll just go with reiserfs... or wait until ext3 online
resizing code is completed.

Thanks again!

> Cheers, Andreas
> -- 
> Andreas Dilger  \ "If a man ate a pound of pasta and a pound of
> antipasto, 
>                  \  would they cancel out, leaving him still
> hungry?" http://www-mddsp.enel.ucalgary.ca/People/adilger/         
>      -- Dogbert _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm


Scott Denton
smdenton@bellsouth.net
EFnet Handle: SteelWyng
ICQ UIN: 24149258
AIM Screen Name: SteelWyng

-----BEGIN PGP SIGNATURE-----
Version: PGPfreeware 6.5.3 for non-commercial use <http://www.pgp.com>

iQA+AwUBOk6W+XC+DNfF0nVpEQL+gACfafC+o2iWB/+Pm8mFG/Ey0saWGh8AmMPk
FLJhzz0VsCSQ+OW6Nf9fWpY=
=IWlb
-----END PGP SIGNATURE-----
