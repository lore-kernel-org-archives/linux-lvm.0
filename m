Return-Path: <thornber@btconnect.com>
Date: Wed, 4 Jul 2001 08:38:00 +0100
Subject: Re: [linux-lvm] LVM on Redhat 2.4.3-12 Kernel
Message-ID: <20010704083759.A294@btconnect.com>
References: <994015538.6465.5.camel@detrius> <Pine.LNX.4.33.0107031707230.15782-100000@leopard.dorfam.ca>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0107031707230.15782-100000@leopard.dorfam.ca>; from gerry@dorfam.ca on Tue, Jul 03, 2001 at 05:13:57PM -0400
From: Joe Thornber <thornber@btconnect.com>
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

On Tue, Jul 03, 2001 at 05:13:57PM -0400, gerry@dorfam.ca wrote:
> I never could get LVM working on the 2.2.19 Redhat kernel.  I had to
> download the generic 2.2.19 kernel from kernel.org and then patch it.
> Those same patches didn't work on RH's kernel.
> 
> I have now upgraded from RH 7.0 to 7.1 and compiled LVM statically in the
> 2.4.3-12 kernel that came with RH 7.1.  When I boot using this kernel LVM
> doesn't work.  It still works if I go back to the 2.2.19 kernel.

All the major distributions have their own versions of the kernel.  We
do not develop or test against these.  So there are no guarantees that
LVM will work out of the box with anything other than Linus' kernels.
Some distributions, notably SuSE, work at making sure that LVM
integrates with their kernel.

> 
> My questions....
> 1. will LVM actually work with RH's 2.4.3-12 kernel?

I don't know, perhaps we need a volunteer to deal with RedHat issues.

> 2. does this kernel have to be patched?

Yes.

> 3. do I just need updated LVM software?

Please use the latest tools.

> In other words, how do I get this going under the new kernel???

Personally I would just use a vanilla kernel.

- Joe
