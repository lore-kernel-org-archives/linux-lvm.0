Return-Path: <tack@orion.dok.org>
Date: Thu, 26 Jul 2001 16:07:01 -0400
From: Jason Tackaberry <tack@linux.com>
Subject: Re: [linux-lvm] Nasty bug in lvm and/or md and/or reiserfs
Message-ID: <20010726160701.H1779@linux.com>
References: <20010726131928.D1779@linux.com> <20010726134732.A27706@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010726134732.A27706@sistina.com>; from lewis@sistina.com on Thu, Jul 26, 2001 at 01:47:32PM -0500
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

> Umm...try this one:
> 
>   mkreiserfs /dev/md3
>   mount /dev/md3 /space
>   cd /space
>   dd if=/dev/zero of=/dev/md3 bs=1024k count=500
> 
> is that a bug?

Good point.

Still, the bugs that surface in md and reiserfs make me a little
worried.  md has been around for a while now, hasn't it?  I get the
feeling it's a bit fragile.  Well, maybe it's just me.

Jason.
