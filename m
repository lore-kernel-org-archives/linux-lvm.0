Return-Path: <defranco@cup.hp.com>
Message-ID: <3A3A6F84.223714DD@cup.hp.com>
Date: Fri, 15 Dec 2000 11:22:45 -0800
From: John DeFranco <defranco@cup.hp.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM 0.9 patch for 2.2.18
References: <20001215112455.A1314@66bassett.freeserve.co.uk>
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@sistina.com

Hi Joe,

I would be willing to try this out.

Thanks.

Joe Thornber wrote:
> 
> Hi,
> 
> I've made a new kernel patch to get LVM 0.9 working with 2.2.18 and am
> looking for a couple of people to give it a try before I check it into
> CVS.
> 
> The patch is similar to the 2.2.17 patch except it should allow you to
> use a software raid device as a PV.  This also has the pleasant side
> effect of removing a lot of the conditional compiles from
> drivers/block/ll_rw_block.c
> 
> The patch is too big to post on the list (it still contains the
> lvm.[hc] files) so mail me if you want to try it.
> 
> Your help would be appreciated.
> 
> - Joe Thornber
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

-- 
==========
Cheers
   -jdf
