Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102170016.f1H0GMc16491@webber.adilger.net>
Subject: Re: [linux-lvm] lvm -- lvm_blk_ioctl: Unknown Command 21264
In-Reply-To: <019501c098bc$d8782540$0f01a8c0@myplace.net> from "B. ten Berge"
 at "Feb 17, 2001 00:37:21 am"
Date: Fri, 16 Feb 2001 17:16:21 -0700 (MST)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

B. ten Berge writes:
> The output comes from dmesg. Does anyone know whether this is a problem --
> unkown command 21264 -- and if not, how do I remove this entry ?
> 
> devfs: devfs_register(): existing non-device/file entry: "root"
> devfs: devfs_register(): device already registered: "group"

The devfs errors should be disappearing from LVM soon, if they haven't
already.

> lvm -- lvm_blk_ioctl: unknown command 21264

If you convert this to hex (which the lvm.c driver should do), then it is
0x5310, which happens to be "CDROMMULTISESSION" ioctl (or possibly a SCSI
ioctl).  This is probably being called by one of the user tools.

You can find which one is doing this by running each command like:

strace <command>

and it should tell you which one is calling ioctl with this number.
The fault does not lie with LVM, except maybe that it prints an error
message for an unknown ioctl.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
