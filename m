From: James Hawtin <oolon@ankh.org>
Subject: Re: [linux-lvm] LVM tool limitation on using whole disk
In-Reply-To: <Pine.LNX.4.33.0204161526330.25253-100000@cobalt.deepthought.org>
Message-Id: <Pine.LNX.4.44.0204161951550.28284-100000@pzat.meep.org>
MIME-Version: 1.0
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
Date: Tue Apr 16 15:00:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, 16 Apr 2002, Dustin Cooper wrote:

> You can make MD devices out of entire disks, but they won't be
> autodetected by the kernel.  For MD autodetection to work you have to have
> partitions of type 0xfd on your disks.
>
> If you still want to use whole disks, make sure /etc/raidtab is up to date
> and use raidstart before vgscan.
>

In that case i recon you should use a partition table just for simplity.
A partition table only wastes one disk block at the end of the day, you
going to lose much more space with lvm and the raid in rounding. I have to
admit I aways use a partition table even when a whole disk has been used
for lvm.

What kind of raid you going to use? Lvm does do striping and
Concatination on PEs. (forget what "numbers" those are called ;-)

Mirroring or raid 5 your going to have to use the the linux raid to make
those devices.

James
