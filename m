From: "Andy Francke" <afrancke@cisco.com>
Subject: RE: [linux-lvm] Core questions from a LVM neophyte...
Message-ID: <NDBBJIIIAKLGEPBFEKBGAEFOGDAA.afrancke@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <08628CA53C6CBA4ABAFB9E808A5214CB01258A72@mercury.infiniconsys.com>
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
Date: Mon Mar 10 10:45:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> Thanks for the quick reply. It seems that my patching was
> incorrect. I did not get the device-mapper option in menuconfig.
> Not sure if you are aware of Debian's make-kpkg program, but here
> is the command I used to construct my (apparently not very well)
> patched kernel:
>
> make-kpkg --added_patches=xfs,device-mapper --config=menuconfig
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

I had a hell of a time getting XFS and device-mapper to apply (because I am
new to Linux and because I am naturally leery of manually editing things to
make them work). Specifically, XFS and device-mapper did NOT apply cleanly -
they both touched the same area of fs.h (as I recall). Since they were each
interested in extending the same enum list, I simply modified the XFS patch
to make it work. If anybody on this list is interested in seeing the
required change, I would be happy to forward it so that XFS and LVM2 will
play better on 2.4 in their stock configurations.

I don't use make-kpkg (in part because I don't understand it). If you go to
your kernel source tree and run /usr/src/kernel-patches/all/apply/<patch
name> you will be manually patching your tree. Be sure to tar your vanilla
tree first - I made all sorts of mistakes while attempting to patch and I
wanted to be able to revert at a moment's notice. I'm glad I got the 2.4
Xeon rather than using some older CPU & MB because I had to rebuild so many
times!

Now I am happy (apart from a weird error at Linux boot that I have variously
seen attributed to the i7500 chipset - do you see "PCI: Device 00:1f.1 not
available because of resource collisions" in your boot messages?) Also,
there are the multiple mysterious "invalidate: busy buffer" messages, but I
gather from searching the LVM lists that this is a known issue, not an
error, and may be safely ignored.

Andy
