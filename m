Message-ID: <01C02790.7B671160.smdenton@bellsouth.net>
From: "S. Michael Denton" <smdenton@bellsouth.net>
Reply-To: "smdenton@bellsouth.net" <smdenton@bellsouth.net>
Subject: RE: [linux-lvm] 2.2.17+LVM+online-ext2
Date: Tue, 26 Sep 2000 08:05:05 -0400
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: "'linux-lvm@msede.com'" <linux-lvm@msede.com>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On Tuesday, 26 September 2000 00:42, Andreas Dilger
[SMTP:adilger@turbolinux.com] wrote:
> Scott Denton writes:
> > Well, it appears I was falsely testing the online ext2 patch...
> > apparently ext2online wants a loopback fs mounted on /dev/loopx
> > instead of straight on a file (using losetup to create the loopx
> > device), but oh well I needed to go to .17 anyway
> 
> Why do you say this?  I did almost all of my testing on a real
> block device.  Unless you have a specially patched kernel, you
> can't resize loop devices anyways - they cache the device/file size
> an creation time and never update it.

Apparently I didn't read the docs or the debug output when I was
trying to test the patch; what I was saying was that every time prior
I was -only- using a loop device and didn't try a real block device. 
When I was trying the loop device resize, I was mounting the file
itself instead of doing a losetup command and mounting /dev/loopx. 
After being able to resize /dev/loopx I tried it on a real block
device (lv) and was also successful at resizing.  Didn't care to
backrev to .13 and see if it would've worked but I assume it would
have as the error I got trying to resize a filesystem on a loop
device was the same:

ext2online: error in kernel: invalid argument

Eventually by increasing the debugging output I saw ext2online trying
to reference a /dev/loop device instead of my mounted loopback
filesystem file...

> 
> Maybe some actual error output would be helpful in diagnosing your
> problems?  
> 
> > Thanks for all the info.  Next stop: journaling (ext3/reiser)
> 
> While there are online resize patches for ext3, they aren't really
> complete - I've been working on ext3 itself, but haven't been
> working on the resize code itself.  Adding ext3 resize support
> needs changes to the user tools, so I'm working on the next release
> of ext2resize.  

No rush, journaling isn't all that much of an issue for my system...
it seems to be pretty much stable and the filesystems aren't all that
large so fsck's don't take too long.

> 
> Cheers, Andreas
> -- 
> Andreas Dilger  \ "If a man ate a pound of pasta and a pound of
> antipasto, 
>                  \  would they cancel out, leaving him still
> hungry?" http://www-mddsp.enel.ucalgary.ca/People/adilger/         
>      -- Dogbert  


Scott Denton
smdenton@bellsouth.net
EFnet Handle: SteelWyng
ICQ UIN: 24149258
AIM Screen Name: SteelWyng

-----BEGIN PGP SIGNATURE-----
Version: PGPfreeware 6.5.3 for non-commercial use <http://www.pgp.com>

iQA/AwUBOdCQ8XC+DNfF0nVpEQLoRwCfeLiTa2pw7Cyj90FWESkLj3EGRA4AoMgy
eKVKSOi74rioJEWn3O7cNdO/
=uW5q
-----END PGP SIGNATURE-----
