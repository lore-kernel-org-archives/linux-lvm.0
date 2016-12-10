Date: Sat, 10 Dec 2016 10:37:06 +0000
From: "Bryn M. Reeves" <bmr@redhat.com>
Message-ID: <20161210103705.GA7522@localhost.localdomain>
References: <efb9fde8-8120-7098-1784-b9a72e6987f7@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <efb9fde8-8120-7098-1784-b9a72e6987f7@gmail.com>
Subject: Re: [linux-lvm] pvcreate: vfat signature detected on /dev/sda5
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: jlpoole56@gmail.com, LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Dec 09, 2016 at 07:35:24PM -0800, John L. Poole wrote:
>    zeta jlpoole # pvcreate /dev/sda5
>    WARNING: vfat signature detected on /dev/sda5 at offset 54. Wipe it?
> [y/n]: n
>      Aborted wiping of vfat.
>      1 existing signature left on the device.
>      Aborting pvcreate on /dev/sda5.
>    zeta jlpoole #

If you want to confirm what's present on a device, use the blkid or
file commands:

# blkid /dev/sda1
/dev/sda1: UUID="49f9b992-3c68-4b59-a232-e1a3a4482eed" TYPE="ext4" PARTUUID="000298d0-01"

# file -s /dev/sda1
/dev/sda1: Linux rev 1.0 ext4 filesystem data, UUID=49f9b992-3c68-4b59-a232-e1a3a4482eed (needs journal recovery) (extents) (large files) (huge files)

You can also use the wipefs program to manually remove any signature,
and optionally back it up to a file so that it can be restored (it
will also report label offsets as with pvcreate).

Both blkid and wipefs are from util-linux. The file program comes
from the 'file' package on most distros.

Regards,
Bryn.
