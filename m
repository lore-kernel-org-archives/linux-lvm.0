content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <08628CA53C6CBA4ABAFB9E808A5214CB01258A6C@mercury.infiniconsys.com>
From: "Barry, Christopher" <cbarry@infiniconsys.com>
Subject: [linux-lvm] Core questions from a LVM neophyte...
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
Date: Mon Mar 10 09:37:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "Lvm (E-mail)" <linux-lvm@sistina.com>

Greetings all,

	I have built a very cool NAS box, and want to use LVM2 on it. My =
machine is as follows:

Tyan Thunder i7500 w/ 2-2.4GHz XEON processors.
2GB RAM
3ware Escalade 7500-12 IDE RAID controller
12-160GB Maxtor IDE HDs
System on a separate 20GB Maxtor HD
Floppy, slimline CDROM, and a DVDRW drive.
All in a 12-bay chassis from =
http://www.rackmountpro.com/productpage.cfm?prodid=3D1460

This config gives me 1.8TB of RAID 5 for under $8K - not too shabby.

The box is up and running Debian. I compiled 2.4.19, adding in the =
device-mapper patch, and the latest xfs patch.

My questions are as follows:

In the kernel config, in the RAID section I checked the LVM option to be =
in the kernel. Is this correct? It seems that I'm getting LVM version 1. =
Do/should I select this if I've patched the kernel?

I try 'pvcreate /dev/sda' and get an error saying the device is not =
found. However, 'fdisk /dev/sda' shows the device exists.

Should I use pvcreate directly on the raw RAID 5 device, or partition it =
first?

My plan was to use LVM2 to create several logical volumes on a single =
RAID 5 device that I could adjust for size over time and create a =
snapshot volume to extract backups from. Is this a good idea? I mean is =
this a good use of LVM2, or not?


Sorry if these questions are really basic, and thanks to all of you for =
any assistance you can throw my way.

Cheers,


--
Christopher Barry
Manager of Information Systems
InfiniCon Systems
http://www.infiniconsys.com
