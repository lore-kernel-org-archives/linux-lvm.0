Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200105222325.f4MNPJVw012336@webber.adilger.int>
Subject: Re: [linux-lvm] Converting my Root file system to LVM
In-Reply-To: <990547328.1133.1.camel@localhost> "from Rupert Heesom at May 22,
 2001 12:02:03 pm"
Date: Tue, 22 May 2001 17:25:19 -0600 (MDT)
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Rupert Heesom writes:
> Now, when I boot up into the LVM partition, I get the following error
> msgs -
> 
> lvm - Module successfully initialised.
> /sbin/vgscan: sed: command not found.
> /sbin/vgscan: /lib/lvm-iop10/: is a directory
> /sbin/vgscan: exec: /lib/lvm-iop10/: cannot execute:  permission denied.
> 
> /sbin/vgchange:  <same msgs>
> 
> Obviously the kernel can't find the LVM tools.  Would these not be
> included in the lvm initrd?  If they are, and the kernel still can't
> find them, what do I change so that the kernel CAN find the LVM tools?

No, the problem is in the wrapper script for the LVM tools.  It is using
"sed" in the script, but that is not on the initrd.  I don't see sed in
my LVM wrapper script, so you must have a different one.  Either fix the
wrapper script (edit /sbin/vgscan should be enough), or add "sed" to the
list of required files, INITRDFILES, in lvmcreate_initrd.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
