Message-ID: <3C0416DF.2080509@larsshack.org>
From: Lars Kellogg-Stedman <lars@larsshack.org>
MIME-Version: 1.0
References: <20011127010049.B15105@piglet.house> <20011126235210.Y730@lynx.no> <20011127112929.A8340@sistina.com> <20011127090310.A16544@piglet.house> <20011127110925.B730@lynx.no> <20011127141509.C17062@piglet.house> <20011127132716.H730@lynx.no> <20011127160350.D17062@piglet.house> <20011127142920.L730@lynx.no>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] SUMMARY: Help! All PVs present but vgscan fails to assemble volume group
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
Date: Tue Nov 27 16:40:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: lvm-devel@sistina.com, linux-lvm@sistina.com

Everything is working once again, and I wanted to summarize my 
experience to the list in the hopes that someone else will find it helpful.

There appear to have been two problems at work here:

(1) The list compacting code in pv_read_all_pv_of_vg() is buggy, and in 
common situations would lose track of some PVs.  I submitted a very 
simple patch for this to Heinz earlier today, but I've since put a 
cleaner version up at <http://larsshack.freeservers.com/lvm/>.

(2) It looks as if the 'vgmerge' command may have trodded upon on-disk 
information on /dev/md0, erasing both the LV table and the mappings for 
the first 173 PEs.

Andreas provided the information I needed to manually reconstruct the 
data lost due to (2).  In fact, Andreas has been extraordinarily helpful 
in tracking down both the cause and a solution to this problem, and I'd 
like to thank him here for his time and effort.

I have not yet investigated the vgmerge problem in any detail, so I 
don't know why it corrupted the on-disk data.

-- Lars
