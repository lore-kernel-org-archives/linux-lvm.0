Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102272022.f1RKMIk27598@webber.adilger.net>
Subject: Re: [linux-lvm] Possible to raise Max LV?
In-Reply-To: <20010227132358.A24164@math.ohio-state.edu> from Dave Alden at "Feb
 27, 2001 01:23:58 pm"
Date: Tue, 27 Feb 2001 13:22:18 -0700 (MST)
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

Dave Alden writes:
> I'm completely new to LVM, so can someone explain to me the purpose of
> the PE's and why they default to 4M?  Is there some kind of performance
> or space hit if I raise that to 16M (remember my setup: hardware RAID
> array that is currently at ~250G, soon to be ~325G)?

Basically, the PE size is the minimum allocation unit of LVM.  If you
make PE size very large, then you are generally wasting PE/2 disk space
for each PV.  If (as in your case) the HW raid appears as a single large
disk, then a large PE size may be appropriate, since you will only waste
PE/2 once and it will still let you grow the LV to the current 2TB block
device limit (kernel limit).

However, LVM DOES NOT handle PVs that change size!!!  In this case you
need to make the new disk space appear as a new PV (via a new LUN number
or something) and add that PV to the VG.  Sorry.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
