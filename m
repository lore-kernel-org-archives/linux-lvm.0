From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm]  lvextend for striped volume extension
Message-ID: <20021122144036.A26900@uk.sistina.com>
References: <050901c27f79$36778c90$a6a5f88f@oboe> <20021122132137.A13642@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20021122132137.A13642@sistina.com>; from mauelshagen@sistina.com on Fri, Nov 22, 2002 at 01:21:37PM +0100
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
Date: Fri Nov 22 08:41:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Nov 22, 2002 at 01:21:37PM +0100, Heinz J . Mauelshagen wrote:
> On Wed, Oct 30, 2002 at 03:30:09AM +0900, shlim wrote:
> > Current LVM version support the lv extension for STRIPED VOLUME ??
> LVM1 is limited: you can't extend a stripe beyond a physical volume.
> Give LVM2 a try which doesn't suffer from this constraint unless
> you stay with the LVM1 ondisk format.

And when using the new metadata format in LVM2, 'lvextend' accepts the 
same stripe parameters as 'lvcreate'.  If the number of stripes and/or
stripesize aren't given, it uses the values used by the last segment
of the existing LV.

A simple example:

lvm> lvcreate --stripes 3 --extents 12 vg1
lvm> lvextend --stripes 2 --extents +12 vg1/lvol0
lvm> lvdisplay --maps

  --- Segments ---
  Logical extent 0 to 11:
    Type		striped
    Stripes		3
    Stripe size		32
    Stripe 0:
      Physical volume	/dev/sdb1
      Physical extents	0 to 3
    Stripe 1:
      Physical volume	/dev/sdb6
      Physical extents	0 to 3
    Stripe 2:
      Physical volume	/dev/sdb7
      Physical extents	0 to 3
   
  Logical extent 12 to 23:
    Type		striped
    Stripes		2
    Stripe size		32
    Stripe 0:
      Physical volume	/dev/sdb1
      Physical extents	4 to 9
    Stripe 1:
      Physical volume	/dev/sdb6
      Physical extents	4 to 9

And you can still specify a restricted list of PVs in the VG to use:
lvm> lvextend --stripes 2 --extents +12 vg1/lvol0 /dev/sdb6 /dev/sdb7

Alasdair
-- 
agk@uk.sistina.com
