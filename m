Return-Path: <jweber@valinux.com>
Date: Tue, 27 Feb 2001 11:18:49 -0800 (PST)
From: Jay Weber <jweber@valinux.com>
Subject: Re: [linux-lvm] Possible to raise Max LV?
In-Reply-To: <20010227132358.A24164@math.ohio-state.edu>
Message-ID: <Pine.LNX.4.30.0102271116450.21037-100000@beefcake.hdqt.valinux.com>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I gather 4M was just a default starting point.  I personally use 64M so I
can theoretically grow to at least 2TB in the future or beyond even. :)

I have several JBODs in the back that are 500G each and ideally I'd like
to merge a few together and hit 1TB and 2TB filesystems when the time is
right.

I've seen no real difference in performance regarding the PE size myself,
granted large PE's means larger chunks of allocation when you're adding
PE's to a LV, etc.

On Tue, 27 Feb 2001, Dave Alden wrote:

> Date: Tue, 27 Feb 2001 13:23:58 -0500
> From: Dave Alden <alden@math.ohio-state.edu>
> Reply-To: linux-lvm@sistina.com
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Possible to raise Max LV?
>
> Hi,
>   First let me apologize -- I just realized my question was in the FAQ.
> I'm usually brighter than this, honest.  :-)  Now on to my new question:
>
> On Tue, Feb 27, 2001 at 09:58:46AM -0700, Andreas Dilger wrote:
> > The max LV size is dependent upon the PE size that you select at VG
> > creation time.  This is because there is a limit of 64k PEs per LV.
>
> I'm completely new to LVM, so can someone explain to me the purpose of
> the PE's and why they default to 4M?  Is there some kind of performance
> or space hit if I raise that to 16M (remember my setup: hardware RAID
> array that is currently at ~250G, soon to be ~325G)?
>
> ...thnx,
> ...dave alden
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
>
