Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200102121935.f1CJZxd08517@webber.adilger.net>
Subject: Re: [linux-lvm] Weird corruption of volume group configuration with
 LVM
In-Reply-To: <Pine.LNX.4.20.0102120702400.5354-100000@menswerk.cyclone.se> from
 Hans Engren at "Feb 12, 2001 07:09:49 am"
Date: Mon, 12 Feb 2001 12:35:59 -0700 (MST)
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

Hans, you write:
> Very true. I did not. New attached output has, although your code was
> beta3 instead of beta4. I guess that won't make a difference in my
> case. See the attached file (which actually has 44889 lines .. ?) with
> output from 'your' vgscan.
> 
> Using beta3, vgscan doesn't segfault. It does with beta4. :/

The output you sent ends with:

<4444> pv_read_all_pv_of_vg -- LEAVING with ret: -267

and error 267 is "LVM_EPV_READ_ALL_PV_OF_VG_PV_NUMBER" which means it
found fewer PVs than it should have (my code outputs an error at this
point, and it also says why the PVs were removed from the list, likely
due to missing UUIDs).  I would suggest removing the UUID checking from
pv_read_all_pv_of_vg and re-running vgscan.  It may fix your problem.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
