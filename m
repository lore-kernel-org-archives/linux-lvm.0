Return-Path: <terjekv@ifi.uio.no>
Subject: Re: [linux-lvm] LVM 1.0 release decision
References: <20010511155311.A17689@sistina.com> <wxxoft055j0.fsf@fjorir.ifi.uio.no> <20010517080900.5240B15CB6@mail.linux-new-media.de>
From: Terje Kvernes <terjekv@math.uio.no>
Date: 17 May 2001 22:11:59 +0200
In-Reply-To: Harald Milz's message of "Thu, 17 May 2001 10:08:58 +0200 (CEST)"
Message-ID: <wxxitizag6o.fsf@fimm.ifi.uio.no>
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

Harald Milz <hmilz@linux-magazin.de> writes:

> In article <wxxoft055j0.fsf@fjorir.ifi.uio.no>, Terje Kvernes <terjekv@math.uio.no> wrote:
>
> > this reminds me of XFS to be honest -- and that annoys me a great
> > deal. I want to test XFS, but currently I can't. because after LVM
> > and ReiserFS are patched (they pull rank :), the XFS-patches botch
> > badly. and they're far from in sync with current kernels.
> 
> That seems to depend. I recently patched 2.4.2-SuSE (not famous for
> being a vanilla kernel, and containing LVM and Reiserfs) with the
> 2.4.2 XFS patch, and just got 1 reject in a Makefile which I could
> safely ignore because the SuSE kernel already contained that patch.

  yes, well. I often want the latest kernel (down to -ac). try
  grabbing a totally vanilla kernel and patching it up. I've tried a
  few times but not bothered in the end. especially with the
  knfsd-patch to ReiserFS. 

> And guess what: XFS and Reiserfs work nicely together with LVM on
> the same machine!

  goodie. that's something I'll need to test a new 600GB raid system
  soonish. I certainly hope it'll be doable, and easier than the last
  two attempts... another worry is that if someone (XFS / ReiserFS /
  LVM or someone else) comes up with a critical fix, how easy will it
  be to make the new kernel again?

  it's not enough that I can get _one_ kernel to work, I need to be
  able to get new kernels to work. within a day or so if it's anything
  like ptrace with friends.
  
  LVM isn't bad in this manner at all. it's just not "perfect". I'm
  very impressed with the way the LVM-crew have handled the kernel
  issue, and the criticism regarding the mailinglist and everything...
  the only thing left is that LVM is the key for a lot of mainstream
  server usage. there are several filesystems that can be used, but
  there isn't much to take the place of LVM.

-- 
Terje
