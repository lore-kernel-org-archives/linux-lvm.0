content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] Core questions from a LVM neophyte...
Message-ID: <08628CA53C6CBA4ABAFB9E808A5214CB01258A72@mercury.infiniconsys.com>
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
Date: Mon Mar 10 10:04:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Thanks for the quick reply. It seems that my patching was incorrect. I =
did not get the device-mapper option in menuconfig. Not sure if you are =
aware of Debian's make-kpkg program, but here is the command I used to =
construct my (apparently not very well) patched kernel:

make-kpkg --added_patches=3Dxfs,device-mapper --config=3Dmenuconfig =
kernel_image modules

If anyone sees an error in this please let me know. If I was to bypass =
the make-kpkg method of adding patches, what would be the command to =
apply the patches directly?

PS I do not have an /etc/lvm/config. I do have /etc/lvm/lvm.conf - is =
that what you meant? It looks like the default is to allow all /dev/. I =
think I have a mispatched kernel - that's my guess.


Thanks again,

--
Christopher Barry
Manager of Information Systems
InfiniCon Systems
http://www.infiniconsys.com


-----Original Message-----
From: Joe Thornber [mailto:joe@fib011235813.fsnet.co.uk]
Sent: Monday, March 10, 2003 10:46 AM
To: linux-lvm@sistina.com
Subject: Re: [linux-lvm] Core questions from a LVM neophyte...


On Mon, Mar 10, 2003 at 10:36:31AM -0500, Barry, Christopher wrote:
> In the kernel config, in the RAID section I checked the LVM option to
> be in the kernel. Is this correct? It seems that I'm getting LVM
> version 1. Do/should I select this if I've patched the kernel?

You should just check the 'device-mapper' option.

> I try 'pvcreate /dev/sda' and get an error saying the device is not =
found. However, 'fdisk /dev/sda' shows the device exists.

Check the device filters in /etc/lvm/config

> Should I use pvcreate directly on the raw RAID 5 device, or partition =
it first?

The raw device.

> My plan was to use LVM2 to create several logical volumes on a
> single RAID 5 device that I could adjust for size over time and create
> a snapshot volume to extract backups from. Is this a good idea? I mean
> is this a good use of LVM2, or not?

Sounds fine.

- Joe

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
