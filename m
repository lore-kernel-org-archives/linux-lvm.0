Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200103132137.f2DLb6o05452@webber.adilger.int>
Subject: Re: [linux-lvm] Changing device numbers.
In-Reply-To: <005801c0ac4b$a781cc00$0f01a8c0@myplace.net> from Bas at "Mar 13,
 2001 09:57:29 pm"
Date: Tue, 13 Mar 2001 14:37:06 -0700 (MST)
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

Bas writes:
> Rerunning lilo seemed to work, but I had the same problem just a while ago
> without changing anything but adding a LV.

Maybe because you are running "vgscan" on each boot?  It is not really
needed by LVM unless the disk configuration changes.  When you run it,
there is the possibility of the VG and LV devices changing major numbers.

Even so, it is a problem (IMHO) that LVM likes to delete all of the
device files each time vgscan is run.  The correct thing to do would
be to have "pvscan" create a file of UUID->disk mappings on each boot,
and leave the LVM devices alone.  Then vgscan would only be needed if
there is a major disaster.

Another possibility is to use the "UUID root" patch, which can locate
the root filesystem at mount time by the ext2 UUID or LABEL.  I don't
think it is ported to 2.4 yet.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
