Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200106090011.f590BTpT002272@webber.adilger.int>
Subject: Re: [linux-lvm] pvmove failure ...
In-Reply-To: <20010609004002.B3656@knoll.ln> "from Timshel Knoll at Jun 9, 2001
 00:40:02 am"
Date: Fri, 8 Jun 2001 18:11:29 -0600 (MDT)
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

Timshel writes:
> I am having problems trying to pvmove stuff from one physical volume to
> another. I first experienced this using kernel 2.4.3 with lvm
> 0.9.1beta6 and the 0.9.1beta7 Debian package of the lvm tools. I then
> updated to 2.4.4 with the CVS version of lvm (as of 08/06/2001 +1000),
> and I am still experiencing the same problems. Basically, pvmove simply
> reports:
> 
> pvmove -- ERROR "pv_move_pe(): PE lock" pv_move_pe
 [Note error return is -6 => ENXIO]
> 
> pvmove -- ERROR "pv_move_pe(): PE lock" moving physical extents
> 
> and nothing is moved :-(

The ENXIO error is returned if the vg you are trying to move does not
exist (at least that's what it looks like).  This is returned from
within the kernel when vg_ptr = NULL inside lvm_do_pe_lock_unlock().

It would _appear_ that /dev/vg0/group is pointing to a bogus device.
In lvm_chr_open() you are allowed to open non-existent devices (so
that you can create new devices if desired).

When was the last time you ran vgscan and/or rebooted?  Did you do anything
strange in the meantime?

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
