From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] problem
Message-ID: <20030108231014.I28021@uk.sistina.com>
References: <1042049056.1433.29.camel@tux.its.uiowa.edu> <33170000.1042057292@[192.168.200.4]> <1042057991.12153.0.camel@tux.its.uiowa.edu> <20030108214555.F28021@uk.sistina.com> <1042064687.12147.7.camel@tux.its.uiowa.edu> <20030108223008.G28021@uk.sistina.com> <1042065269.12147.10.camel@tux.its.uiowa.edu> <20030108225455.H28021@uk.sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030108225455.H28021@uk.sistina.com>; from agk@uk.sistina.com on Wed, Jan 08, 2003 at 10:54:55PM +0000
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
Date: Wed Jan  8 17:09:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Procedure to follow:
  
   vgcfgbackup -P -f /tmp/vgbackup rootvg

   Edit the backup file as follows:
   Add "WRITE" to the status line and remove "PARTIAL"

e.g.
   status = ["RESIZEABLE", "PARTIAL", "READ"]
becomes
   status = ["RESIZEABLE", "READ", "WRITE"]


Remove the whole PV section for your "unknown device"
- referenced as "pv1" in this example.

                pv1 {
                        id = "TBCgjx-ne5X-4fHP-aHqe-dKJR-Vwnb-kjDhWQ"
                        device = "unknown device"       # Hint only

                        status = ["ALLOCATABLE"]
                        pe_start = 128
                        pe_count = 5    # 20 Megabytes
                }


Remove the whole LV section for any LVs that refer to the pv you
removed above (pv1 here referenced inside "stripes") e.g.

                tmp {
                        id = "4eTLYv-PTDr-FXvv-58Xk-Q4Th-p8yi-GeKCHr"
                        status = ["READ", "WRITE", "VISIBLE"]
                        segment_count = 1

                        segment1 {
                                start_extent = 0
                                extent_count = 3        # 12 Megabytes

                                type = "striped"
                                stripe_count = 1        # linear

                                stripes = [
                                        "pv1", 0
                                ]
                        }
                }

Write the metadata back to disk:
  vgcfgrestore -f /tmp/vgbackup rootvg

Alasdair
-- 
agk@uk.sistina.com
