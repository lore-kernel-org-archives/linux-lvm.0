Message-ID: <01C03701.8B2003C0.smdenton@bellsouth.net>
From: "S. Michael Denton" <smdenton@bellsouth.net>
Reply-To: "smdenton@bellsouth.net" <smdenton@bellsouth.net>
Subject: RE: [linux-lvm] lv inactive after reboot
Date: Sun, 15 Oct 2000 23:42:12 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: Linux LVM mailing list <linux-lvm@msede.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Sunday, 15 October 2000 22:12, Eric M. Hopper
[SMTP:hopper@omnifarious.mn.org] wrote:
> 	I could do without this ability.  RAID, other than RAID0 should
> be done in hardware, or you're fooling yourself about reliability. 
> The  

Possibly, but even hardware RAID has points of failure... some
hardware RAID is even designed so poorly as to inadvertently -create-
more points of failure... 

> only reason to do any RAID besides RAID0 is reliability, so why
> pick an option that so clearly doesn't work?  LVM already does
> RAID0.

On the point of reliability I agree, the only reason to do RAID is
for reliability... and the reliability factor becomes additive so the
more options you have, the better.  None of them are perfect... none
of them work 100% of the time.  But eliminating an option, even if it
is only partially viable, only reduces the tools you have at your
disposal.

Besides, wouldn't it be better to have a single tool for software
volume management instead of multiple?  If we could merge the mdtools
into lvmtools then we'd have one point for software raid AND logical
volume management... much better in my opinion :)

BTW as a side note, RAID0 doesn't provide any reliability enhancement
or protection against failures... it's only striping.

> Have fun (if at all possible),

Always... hope you have the same.

Scott Denton
smdenton@bellsouth.net
EFnet Handle: SteelWyng
ICQ UIN: 24149258
AIM Screen Name: SteelWyng

-----BEGIN PGP SIGNATURE-----
Version: PGPfreeware 6.5.3 for non-commercial use <http://www.pgp.com>

iQA/AwUBOep5FHC+DNfF0nVpEQISGgCfWnsSwETDOnqDwwrcHpLIg3BiZ08AnR6r
4j8UwOwSFh7AW39QJPczpTAR
=zSvA
-----END PGP SIGNATURE-----
