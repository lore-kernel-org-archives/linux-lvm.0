Return-Path: <smdenton@bellsouth.net>
Message-ID: <01C07295.55B20EC0.smdenton@bellsouth.net>
From: "S. Michael Denton" <smdenton@bellsouth.net>
Subject: RE: [linux-lvm] Patched kernel sources
Date: Sat, 30 Dec 2000 19:18:46 -0500
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

On Saturday, 30 December 2000 19:14, Andreas Dilger
[SMTP:adilger@turbolinux.com] wrote:
> Scott Denton writes:
> > Does anyone have a tarball of properly-patched kernel sources for
> > 2.2.1[7,8] with LVM 0.8.1, ext3fs, and ext3fs online resizing
> > support?
> 
> You probably DON'T want to use the ext3 online resizing patches. 
> While they work OK in theory, in fact there are some bad
> interactions between the user-space tools writing to the disk and
> the journal causing an OOPS because of safety checking in the ext3
> code.  This really only happens if the filesystem is being written
> to when you are doing the resizing, but if it happens, your
> filesystem is stuck...

Found the reference to that very idea in the src code on sourceforge
for ext2online... how about ext2online resizing of an ext3fs (since
there's supposedly no structural difference between the two)?

> I need to totally re-do how the ext3 online resizing code is done,
> probably in the next month or so.

OK, i'll keep my eye out for when you get it fixed... thanks

> I don't use the 0.8.1 patches anymore, only 0.9.

Seen too many complaints about 0.9 as of late... I'll probably wait
until 0.9.1 (or whatever the next minor ver is) is released...

Thanks again,

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

iQA/AwUBOk57ZnC+DNfF0nVpEQKP3wCfX+TNlxeGo+u5Lj/EFLXA8XrcSPMAnj3K
H/Ft+etlW+evr4w3bzDTnnAm
=4pQc
-----END PGP SIGNATURE-----
