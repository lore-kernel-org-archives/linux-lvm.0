Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102122040.f1CKe6w08894@webber.adilger.net>
Subject: Re: [linux-lvm] (no subject)
In-Reply-To: <20010211191615.6223.qmail@web216.mail.yahoo.com> from Pete lamb
 at "Feb 11, 2001 11:16:15 am"
Date: Mon, 12 Feb 2001 13:40:06 -0700 (MST)
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

Pierre writes:
> Is there a utility to convert an existing ext2fs to a
> lvm or do I have to due a complete new install???

It may be possible to use parted to do this.  I don't think it is 100%
finished, but I _think_ it can do "move start of filesystem" kind of
work.  It will NOT do the LVM creation, and you will need to manually
figure out  how much space to put at the beggining of the PV for LVM
metadata.  After that, you will also need to create an LV which is
using exactly the correct PEs to hold the filesystem.

I would make a backup first.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
