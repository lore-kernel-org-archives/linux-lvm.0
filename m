Subject: Re: [linux-lvm] Core questions from a LVM neophyte...
Message-ID: <20030310154546.GA19150@fib011235813.fsnet.co.uk>
References: <08628CA53C6CBA4ABAFB9E808A5214CB01258A6C@mercury.infiniconsys.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <08628CA53C6CBA4ABAFB9E808A5214CB01258A6C@mercury.infiniconsys.com>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Mon Mar 10 09:47:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mon, Mar 10, 2003 at 10:36:31AM -0500, Barry, Christopher wrote:
> In the kernel config, in the RAID section I checked the LVM option to
> be in the kernel. Is this correct? It seems that I'm getting LVM
> version 1. Do/should I select this if I've patched the kernel?

You should just check the 'device-mapper' option.

> I try 'pvcreate /dev/sda' and get an error saying the device is not found. However, 'fdisk /dev/sda' shows the device exists.

Check the device filters in /etc/lvm/config

> Should I use pvcreate directly on the raw RAID 5 device, or partition it first?

The raw device.

> My plan was to use LVM2 to create several logical volumes on a
> single RAID 5 device that I could adjust for size over time and create
> a snapshot volume to extract backups from. Is this a good idea? I mean
> is this a good use of LVM2, or not?

Sounds fine.

- Joe
