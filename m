From: "Erick Calder" <e@arix.com>
Subject: RE: [linux-lvm] read_intr errors
Date: Wed, 17 Oct 2001 14:20:23 -0700
Message-ID: <000901c15751$8839ee70$0300000a@pacbell.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-reply-to: <134783342.1003350775542.JavaMail.root@boots>
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

I haven't tried that but if I unmount the filesystem and check it:

# umount /dev/LVM/mp3z
# fsck /dev/LVM/mp3z

it comes up clean....  is that not an equivalent test?

-----Original Message-----
From:	linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com] On
Behalf Of Karl
Sent:	Wednesday, October 17, 2001 1:22 PM
To:	linux-lvm@sistina.com
Subject:	Re: [linux-lvm] read_intr errors

Have you tried mke2fs with the -c option in LVM and on the drive without
LVM?  I'm seeing a lot of errors on a SCSI disk that has no hardware
problems unless it is in LVM.

On Wed, Oct 17, 2001 at 02:27:21AM -0700, Erick Calder e@arix.com
XXXXXXXXXXXXXXXXXXXX wrote:
> hi everyone, I've read a number of dialogues on the archives concerning
the
> errors below which I'm getting but have not found any answers:
>
> I'm running RedHat 7.0 (2.4.9 kernel + LVM 1.0.1rc1) on a little PIII box
> and I'm using the ide controllers built into the motherboard (drivers
built
> into the kernel - not modules).  I have CONFIG_IDEDISK_MULTI_MODE set to y
> in the .config for the kernel.  The drive is an IBM-DTLA-307030 (as
reported
> by /proc/ide) and is brand new.
>
> here are the errors:
>
> Oct 17 02:00:34 beowulf kernel: hdc: read_intr: error=0x04 {
> DriveStatusError }
> Oct 17 02:00:34 beowulf kernel: hdc: read_intr: status=0x59 { DriveReady
> SeekComplete DataRequest Error }
> Oct 17 02:00:34 beowulf kernel: hdc: read_intr: error=0x04 {
> DriveStatusError }
> Oct 17 02:00:34 beowulf kernel: ide1: reset: success
>
> I've been moving data in and out of the drive and everything seems ok but
I
> get lots of the above errors which leaves me with a queasy feeling...
> anyone know what the deal is with this?
>
> 1k thx - e
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

--
Karl Hakimian
XXXXXXXXXXXXXXXX


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
