Return-Path: <tack@orion.dok.org>
Date: Wed, 15 Aug 2001 09:13:29 -0400
From: Jason Tackaberry <tack@linux.com>
Subject: Re: [linux-lvm] Adding a mirror after-the-fact
Message-ID: <20010815091329.A29902@linux.com>
References: <20010814171159.B28266@linux.com> <20010815105623.A29693@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010815105623.A29693@sistina.com>; from mauelshagen@sistina.com on Wed, Aug 15, 2001 at 10:56:23AM +0200
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

> You could either mirror the whole disk using MD *without* persistent
> superblocks

This sounds like the best and most transparent solution.  But
Documentation/md.txt says:

raid level = -1 linear mode
              0 striped mode
  	      other modes are only supported with persistant super blocks

So it sounds like this won't work?  I'll give it a try and see what
happens anyway.

Thanks,
Jason.
