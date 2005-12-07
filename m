Date: Wed, 7 Dec 2005 22:13:54 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM problems
Message-ID: <20051207221354.GL3647@agk.surrey.redhat.com>
References: <43963F45.5060104@ntlworld.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <43963F45.5060104@ntlworld.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kelly.harding@ntlworld.com
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Wed, Dec 07, 2005 at 01:47:49AM +0000, Kelly Harding wrote:
> I've just brought my Debian Linux box back up after a power failure and 
> now my LVM set up seems to be non-functional.
 
> device-mapper ioctl cmd 11 failed: Invalid argument
>   _deps: task run failed for (254:0)
>   Failed to add device (254:0) to dtree
>   1 logical volume(s) in volume group "3diskvolume" now active
 
This development version of LVM2 requires a 2.6 kernel - it relies
on patches added to 2.6 upstream about a year ago.

Either upgrade to a 2.6 kernel or downgrade your lvm2 & device-mapper 
packages.

It would be straightforward to backport the changes to 2.4 but
nobody's done it yet.  Patches welcome!

  ftp://sources.redhat.com/pub/dm/patches/2.6-unstable/2.6.9-rc3/2.6.9-rc3-udm1/00004.patch

Alasdair
-- 
agk@redhat.com
