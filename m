Date: Tue, 2 Oct 2001 23:15:24 +0200
From: Markus Dobel <mdobel@kawo2.rwth-aachen.de>
Subject: Re: [linux-lvm] Re: linux2.4.10/lvm1.0.1rc3 does not compile
Message-ID: <20011002231524.A1020@balu.kawo2.rwth-aachen.de>
References: <20011002200722.18323.qmail@web14404.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011002200722.18323.qmail@web14404.mail.yahoo.com>; from shahi_aman@yahoo.com on Tue, Oct 02, 2001 at 01:07:22PM -0700
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

On Tue, Oct 02, 2001 at 01:07:22PM -0700, Aman Shahi wrote:
> 
> so changing __update_hardblocksize(lv_t *lv)
> in ~/LVM/1.0.1-rc3/kernel/lvm.c and
> ~linux-2.4.10/drivers/md/lvm.c 
> to  __update_hardsectsize(lv_t *lv)
> should resolve this compilation problem.

Thanks, that did the trick for me. 

After that vgscan did not find any Volume Groups in 2.4.10, while it
did in 2.4.7 (with LVM 1.0). Interesting: using "vgrename" on 2.4.7
helped here at last (After trying lots of other non-destructive changes
to the VG/underlying PVs) . I just renamed the Group vg1 to vg0 and now
vgscan detects it on 2.4.10, too.

This incident leaves a bitter taste somehow...

Regards, Markus
