From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] 2  LVM questions -  LVM and 2.4.19, and extent based striping.
Message-ID: <20021126213244.D6509@uk.sistina.com>
References: <OFB3E6E776.74CCEE3A-ON85256C7D.0055BB76@LocalDomain>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OFB3E6E776.74CCEE3A-ON85256C7D.0055BB76@LocalDomain>; from GBanschbach@sandata.com on Tue, Nov 26, 2002 at 02:14:29PM -0500
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
Date: Tue Nov 26 15:52:04 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Nov 26, 2002 at 02:14:29PM -0500, GBanschbach@sandata.com wrote:
> In the linux LVM world, we can't seem to do this......      We get stripes
> WITHIN extents, but the extents are still visited serially:

> 1st  64k on Log. Ext Zero which is Physical Zero on disk1.  The 2nd is on
> LE 1 on disk 1.  

I don't think it's *supposed* to be doing that.  
Have you confirmed this by examining the actual contents of the disks?

If you have 18 extents (PEs) with 6 on each disk numbered:
  disk1:   0  1  2  3  4  5
  disk2:   6  7  8  9 10 11
  disk3:  12 13 14 15 16 17

and the stripesize is 64k, I think it should write the first 64k of 
the LV to disk1 (PE 0), the second 64k to the start of disk2 (PE 6)
the third 64k to the start of disk3 (PE 12) and then the fourth 64k 
to PE 0 again etc.

Alasdair
-- 
agk@uk.sistina.com
