Message-ID: <134690694.1002320843996.JavaMail.root@boots>
Date: 05 Oct 2001 18:21:53 -0000
From: "Karl" <rmvzj001@sneakemail.com>
Subject: [linux-lvm] LVM seems to be causing SCSI errors.
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> People have recently reported similar "hardware" errors on IDE drives
> as well.  Can you verify if the sector in question is really within the
> boundaries of the device (this appears to be /dev/sdc1, sector 12247456)?
> If not, it is possible that LVM is doing math incorrectly somewhere.


Good point. That's a pretty big number. It would also explain the bad noise from the drive...

From fdisk on that drive I count 17767890 sectors so it does seem to fall within the boundaries

fdisk /dev/sdc 

The number of cylinders for this disk is set to 1106.
There is nothing wrong with that, but this is larger than 1024,
and could in certain setups cause problems with:
1) software that runs at boot time (e.g., old versions of LILO)
2) booting and partitioning software from other OSs
   (e.g., DOS FDISK, OS/2 FDISK)

Command (m for help): p

Disk /dev/sdc: 255 heads, 63 sectors, 1106 cylinders
Units = cylinders of 16065 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/sdc1             1      1106   8883913+  83  Linux


-----------------------------------------------------
Protect yourself from spam, use http://sneakemail.com
