Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200104201031.f3KAVT05030575@webber.adilger.int>
Subject: Re: [linux-lvm] LVM and DRDB
In-Reply-To: <20010420111022.C6133@cistron.nl> "from Wichert Akkerman at Apr
 20, 2001 11:10:22 am"
Date: Fri, 20 Apr 2001 04:31:29 -0600 (MDT)
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
Cc: linux-openlvm@nl.linux.org

Wichert writes:
> Does anyone know if LVM will work correctly on top of DRDB? I
> need to keep an off-site copy of a 5TB fileserver synchronized
> and that might be an usefull approach.

Probably not out of the box.  You will need to add the DRDB major
number to the list of devices that LVM will check for PVs/VGs.
Other than that (and the fact that the Linux kernel doesn't support
block devices > 2TB) you should be fine.  Hopefully you have some
sort of journaled filesystem for this?

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
