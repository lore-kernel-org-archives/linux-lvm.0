Message-ID: <01C036EB.4AA7CFA0.smdenton@bellsouth.net>
From: "S. Michael Denton" <smdenton@bellsouth.net>
Reply-To: "smdenton@bellsouth.net" <smdenton@bellsouth.net>
Subject: RE: [linux-lvm] lv inactive after reboot
Date: Sun, 15 Oct 2000 21:02:55 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: Linux LVM mailing list <linux-lvm@msede.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Sunday, 15 October 2000 19:34, Paul Jakma [SMTP:paul@clubi.ie]
wrote:
> On Wed, 11 Oct 2000, Andreas Dilger wrote:
> 
> > I will see Heinz this week, so maybe I can convince him to make a
> > new release.  It may well be that he will debut 0.9 at the Miami
> > Storage Workshop, so the point may be moot.  If not, I'll do my
> > best.
> > 
> 
> yes please. i've been advocating LVM at work for quite a while now,
> and it's getting to the stage where i will be allowed to move a
> live server over to it to test it out in production use.

If it hasn't already been mentioned, perhaps you could suggest to
Heinz:

The ability to do raid, specifically raid1, with LVM should be
included if linux LVM is to mimic the LVM used on HPUX; perhaps
merging linux md tools/drivers with lvm tools/drivers?
The ability to create > 256 items (lv's, vg's, etc), perhaps by using
multiple majors?
Storing lvm information for each group in entirety on each group's
pv's headers as such:
	vgtest members: /dev/hda /dev/hdb /dev/hdc
	vgtest lv's: testlv thislv thatlv
	vgtest lv pe boundaries: testlv ...
				thislv ...
				thatlv ...
	ad nauseum so that the kernel and the /etc files are not the only
authoritative sources of lvm structures (3 sources allows for a
quorum)
Storing lvm native host information so that vgs could be
exported/imported from host to host in MI scsi configs
Deeper integration into the kernel such that / can be an lv without
an initrd (this may already exist?)
[Deeper] integration into bootloaders such as lilo, grub, etc so one
can boot from a secondary (ie mirror) boot device, potentially
automatically.
	(ie primary boot device: /dev/vg00/root which is raid1 consisting of
/dev/hda and /dev/hdb... if /dev/hda becomes inaccessible, boot from
/dev/hdb half of /dev/vg00/root automatically)

Again, these things may already be in the TODO list, wish lists,
whatever... but in case someone hasn't thought of them, these are a
few ideas my colleagues and I have had regarding linux LVM.

Thanks,

Scott Denton
smdenton@bellsouth.net
EFnet Handle: SteelWyng
ICQ UIN: 24149258
AIM Screen Name: SteelWyng

-----BEGIN PGP SIGNATURE-----
Version: PGPfreeware 6.5.3 for non-commercial use <http://www.pgp.com>

iQA/AwUBOepTv3C+DNfF0nVpEQIAtwCgjLm1e+ZMKLnZjGSpprztplnQN9kAnA2N
ObiA+iL6cIkNWM9wxuLBWT+r
=Pgor
-----END PGP SIGNATURE-----
