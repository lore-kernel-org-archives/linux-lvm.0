Subject: Re: [linux-lvm] problem
From: Daniel Wittenberg <daniel-wittenberg@uiowa.edu>
In-Reply-To: <20030108231014.I28021@uk.sistina.com>
References: <1042049056.1433.29.camel@tux.its.uiowa.edu>
	 <33170000.1042057292@[192.168.200.4]>
	 <1042057991.12153.0.camel@tux.its.uiowa.edu>
	 <20030108214555.F28021@uk.sistina.com>
	 <1042064687.12147.7.camel@tux.its.uiowa.edu>
	 <20030108223008.G28021@uk.sistina.com>
	 <1042065269.12147.10.camel@tux.its.uiowa.edu>
	 <20030108225455.H28021@uk.sistina.com>
	 <20030108231014.I28021@uk.sistina.com>
Message-Id: <1042144011.24713.9.camel@tux.its.uiowa.edu>
Mime-Version: 1.0
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
Date: Thu Jan  9 14:26:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Now this is interesting.  I noticed that when I dumped the config, and
look at it, one of the (largest) pv's isn't showing up at all.  I also
don't see a way to for vgcfgbackup to pull from a specific physical
device, so not sure how I can 'force' it to see the other lvm
partition.  This is what I have now, but partition /dev/hdb1 is not
showing up.  These are 2 partitions I used to move extents from failing
to disk before it completely died.  I'm guessing this is why it doesn't
see the rest of the VG, very little right now isn't listed as "missing"
even those /dev/hdb1 is there, but vgscan doesn't seem to see it.
                
		pv0 {
                        id = "YnfiRa-QnzV-Llio-quX6-UrHQ-WuCl-RiwZWd"
                        device = "/dev/hda7"    # Hint only

                        status = ["ALLOCATABLE"]
                        pe_start = 8576
                        pe_count = 373  # 1.45703 Gigabytes
                }

                pv1 {
                        id = "qFNI3x-yIgQ-Lqco-PDNN-djJ4-UiWw-szmJiW"
                        device = "/dev/hda8"    # Hint only

                        status = ["ALLOCATABLE"]
                        pe_start = 8576
                        pe_count = 444  # 1.73438 Gigabytes
                }

Thanks again for all the help...definitely won't be using this across
disks not on RAID anymore...

Dan

On Wed, 2003-01-08 at 17:10, Alasdair G Kergon wrote:
> Procedure to follow:
>   
>    vgcfgbackup -P -f /tmp/vgbackup rootvg
> 
>    Edit the backup file as follows:
>    Add "WRITE" to the status line and remove "PARTIAL"
> 
> e.g.
>    status = ["RESIZEABLE", "PARTIAL", "READ"]
> becomes
>    status = ["RESIZEABLE", "READ", "WRITE"]
> 
> 
> Remove the whole PV section for your "unknown device"
> - referenced as "pv1" in this example.
> 
>                 pv1 {
>                         id = "TBCgjx-ne5X-4fHP-aHqe-dKJR-Vwnb-kjDhWQ"
>                         device = "unknown device"       # Hint only
> 
>                         status = ["ALLOCATABLE"]
>                         pe_start = 128
>                         pe_count = 5    # 20 Megabytes
>                 }
> 
> 
> Remove the whole LV section for any LVs that refer to the pv you
> removed above (pv1 here referenced inside "stripes") e.g.
> 
>                 tmp {
>                         id = "4eTLYv-PTDr-FXvv-58Xk-Q4Th-p8yi-GeKCHr"
>                         status = ["READ", "WRITE", "VISIBLE"]
>                         segment_count = 1
> 
>                         segment1 {
>                                 start_extent = 0
>                                 extent_count = 3        # 12 Megabytes
> 
>                                 type = "striped"
>                                 stripe_count = 1        # linear
> 
>                                 stripes = [
>                                         "pv1", 0
>                                 ]
>                         }
>                 }
> 
> Write the metadata back to disk:
>   vgcfgrestore -f /tmp/vgbackup rootvg
> 
> Alasdair
-- 
===========================
Daniel Wittenberg
Senior Unix Admin
University of Iowa - ITS
