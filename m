Return-Path: <austin@coremetrics.com>
Date: Fri, 25 May 2001 09:47:34 -0500 (CDT)
From: Austin Gonyou <austin@coremetrics.com>
Subject: Re: [linux-lvm] EMC Storage + LVM + XFS
In-Reply-To: <20010525085816.F18197@babbage.hcsd.de>
Message-ID: <Pine.LNX.4.33.0105250946400.10104-100000@UberGeek.coremetrics.com>
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

I don't think I'm clear on your statement. As far as I know, which is a
lot about EMC, you can definitely plug disks online. Having Linux see
them? Not necessarily so, but I believe the polling interval for the Fibre
driver will take care of that.

-- 
Austin Gonyou
Systems Architect, CCNA
Coremetrics, Inc.
Phone: 512-796-9023
email: austin@coremetrics.com

On Fri, 25 May 2001, Stephan Austermuehle wrote:

> On Thu, May 24, 2001 at 10:57:25PM -0400, S. Michael Denton wrote:
>
> > vgscan is your friend :) (read my earlier post about moving an entire
> > bus around)
>
> This can only be a workaround because you cannot plug disks online
> when you need to vgscan.
>
> Stephan
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
