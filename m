From: Tim <tim@connectlive.com>
Subject: Re: [linux-lvm] Best way to create a 540GB LVM Volume?
Message-ID: <20020624142200.A12454@connectlive.com>
References: <1024945627.6892.7.camel@UberGeek>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1024945627.6892.7.camel@UberGeek>; from austin@coremetrics.com on Mon, Jun 24, 2002 at 02:07:07PM -0500
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
Date: Mon Jun 24 14:22:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

use bigger physical extents to create volumes up to the (LVM-limited?)
max size of 1TB.  my physical extents are (I think) 64MB so logically I
should be able to make an 8TB volume (no pun intended) but presumably
due to wackiness in the kernel (VFS or VM, don't know) Heinz chose not
to allow that.  probably preventing me from shooting myself in the foot.

I think this is in the FAQ, regardless, a careful read of the manpage
will reveal this and other useful tidbits.  I think you will have to
recreate your VG and/or LV, but the initialized PV's should be okay.

try it and see :-)



Quoth Austin Gonyou:
> I've got 14 FC1 disks in a PV660F. I want to take 7 of them and make a
> large volume. I can't seem to make a > 450 GB volume though, even though
> lvdisplay is showing xxMB PE free. 
> 
> I'm using default 4mb and also 8mb extentsize when creating the VG.
> Please advise.
> 
> 
> -- 
> Austin Gonyou <austin@coremetrics.com>
> Coremetrics, Inc.



-- 
     "Any good rope will last you a lifetime,
      which may not be as long as you'd wish."

                --Stefan Axelsson, on climbing ropes
