content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] Core questions from a LVM neophyte...
Message-ID: <08628CA53C6CBA4ABAFB9E808A5214CB01258A8E@mercury.infiniconsys.com>
From: "Barry, Christopher" <cbarry@infiniconsys.com>
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
Date: Mon Mar 10 14:16:11 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Andy,
OK, so I RTFM'd and have the LVM2 patch created against the vanilla =
kernel.org 2.4.20. Sorry for asking such a dumb question. Also, just got =
the latest xfs patch from sgi too, and am awaiting your instructions on =
what to change before applying either.

Patiently Yours,

--
Christopher Barry
Manager of Information Systems
InfiniCon Systems
http://www.infiniconsys.com

-----Original Message-----
From: Barry, Christopher=20
Sent: Monday, March 10, 2003 1:30 PM
To: linux-lvm@sistina.com
Subject: RE: [linux-lvm] Core questions from a LVM neophyte...


Andy,

Cool! I wanted to use 2.4.20, but had trouble finding the correct =
patches for it. Could you send to me - or better, post - the XFS patch =
you hacked to work? I'll pull down 2.4.20 now as a package from =
debian.org (it likely has some fixes from vanilla). Also, if you have a =
link to the 2.4.20 device-mapper patch, that would be appreciated as =
well.

As far as make-kpkg goes, it's fairly easy, and very slick. I use it all =
the time, however this is the first time I've used it to apply patches. =
I recommend it highly.

And yes, I do get the same 'resource collision' error, which I have not =
even bothered to research yet. But otherwise, the Tyan board is sweet. =
Once I get this up and running, my plan is to create a how-to site with =
pictures of the construction, links to vendors, and configuration info =
so others can get a great big storage device for minimal cost too.

Thanks,

--
Christopher Barry
Manager of Information Systems
InfiniCon Systems
http://www.infiniconsys.com


-----Original Message-----
From: Andy Francke [mailto:afrancke@cisco.com]
Sent: Monday, March 10, 2003 11:44 AM
To: linux-lvm@sistina.com
Subject: RE: [linux-lvm] Core questions from a LVM neophyte...


> Thanks for the quick reply. It seems that my patching was
> incorrect. I did not get the device-mapper option in menuconfig.
> Not sure if you are aware of Debian's make-kpkg program, but here
> is the command I used to construct my (apparently not very well)
> patched kernel:
>
> make-kpkg --added_patches=3Dxfs,device-mapper --config=3Dmenuconfig
> kernel_image modules
>
> If anyone sees an error in this please let me know. If I was to
> bypass the make-kpkg method of adding patches, what would be the
> command to apply the patches directly?
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

Hi Christopher,

I constructed the "baby brother" of your NAS box a few months ago (great
minds think alike - or it was just a coincidence :)):
- Tyan 2721 ThunderPro i7500 w/single 2.4 CPU
- 1GB RAM
- 3ware 7500-8
- 4 Maxtor 80GB drives
- 9 drive hotswap case (looks just like yours, only 3U)

I am running Debian 2.4.20 unstable + XFS + LVM2

I had a hell of a time getting XFS and device-mapper to apply (because I =
am
new to Linux and because I am naturally leery of manually editing things =
to
make them work). Specifically, XFS and device-mapper did NOT apply =
cleanly -
they both touched the same area of fs.h (as I recall). Since they were =
each
interested in extending the same enum list, I simply modified the XFS =
patch
to make it work. If anybody on this list is interested in seeing the
required change, I would be happy to forward it so that XFS and LVM2 =
will
play better on 2.4 in their stock configurations.

I don't use make-kpkg (in part because I don't understand it). If you go =
to
your kernel source tree and run /usr/src/kernel-patches/all/apply/<patch
name> you will be manually patching your tree. Be sure to tar your =
vanilla
tree first - I made all sorts of mistakes while attempting to patch and =
I
wanted to be able to revert at a moment's notice. I'm glad I got the 2.4
Xeon rather than using some older CPU & MB because I had to rebuild so =
many
times!

Now I am happy (apart from a weird error at Linux boot that I have =
variously
seen attributed to the i7500 chipset - do you see "PCI: Device 00:1f.1 =
not
available because of resource collisions" in your boot messages?) Also,
there are the multiple mysterious "invalidate: busy buffer" messages, =
but I
gather from searching the LVM lists that this is a known issue, not an
error, and may be safely ignored.

Andy


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
