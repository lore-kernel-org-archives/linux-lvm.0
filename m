Return-Path: <alden@math.ohio-state.edu>
Date: Tue, 27 Feb 2001 13:23:58 -0500
From: Dave Alden <alden@math.ohio-state.edu>
Subject: Re: [linux-lvm] Possible to raise Max LV?
Message-ID: <20010227132358.A24164@math.ohio-state.edu>
References: <20010227131526.1C48E3FDB@math.ohio-state.edu> <200102271658.f1RGwkl27047@webber.adilger.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200102271658.f1RGwkl27047@webber.adilger.net>; from adilger@turbolinux.com on Tue, Feb 27, 2001 at 09:58:46AM -0700
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

Hi,
  First let me apologize -- I just realized my question was in the FAQ.
I'm usually brighter than this, honest.  :-)  Now on to my new question:

On Tue, Feb 27, 2001 at 09:58:46AM -0700, Andreas Dilger wrote:
> The max LV size is dependent upon the PE size that you select at VG
> creation time.  This is because there is a limit of 64k PEs per LV.

I'm completely new to LVM, so can someone explain to me the purpose of
the PE's and why they default to 4M?  Is there some kind of performance
or space hit if I raise that to 16M (remember my setup: hardware RAID
array that is currently at ~250G, soon to be ~325G)?

...thnx,
...dave alden
