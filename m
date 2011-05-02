Date: Mon, 2 May 2011 10:58:11 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20110502145807.GA32155@redhat.com>
References: <20110428075355.GA2190@infradead.org>
	<20110428205935.GA24979@redhat.com>
	<alpine.LFD.2.00.1104291117510.5496@dhcp-27-109.brq.redhat.com>
	<20110429122454.GL32370@agk-dp.fab.redhat.com>
	<alpine.LFD.2.00.1105020857030.3778@dhcp-27-109.brq.redhat.com>
	<20110502081308.GC8642@agk-dp.fab.redhat.com>
	<20110502081925.GA11312@infradead.org>
	<alpine.LFD.2.00.1105021217080.3778@dhcp-27-109.brq.redhat.com>
	<yq1bozl420p.fsf@sermon.lab.mkp.net>
	<alpine.LFD.2.00.1105021631590.3778@dhcp-27-109.brq.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.LFD.2.00.1105021631590.3778@dhcp-27-109.brq.redhat.com>
Subject: Re: [linux-lvm] do not disable ext4 discards on first discard
 failure? [was: Re: dm snapshot: ignore discards issued to the
 snapshot-origin target]
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: Lukas Czerner <lczerner@redhat.com>
Cc: sandeen@redhat.com, "Martin K. Petersen" <martin.petersen@oracle.com>, Christoph Hellwig <hch@infradead.org>, device-mapper development <dm-devel@redhat.com>, DarkNovaNick@gmail.com, linux-lvm@redhat.com, linux-ext4@vger.kernel.org, Alasdair G Kergon <agk@redhat.com>

On Mon, May 02 2011 at 10:39am -0400,
Lukas Czerner <lczerner@redhat.com> wrote:

> On Mon, 2 May 2011, Martin K. Petersen wrote:
> 
> > >>>>> "Lukas" == Lukas Czerner <lczerner@redhat.com> writes:
> > 
> > Lukas> So I gave it a try. First of all the device composed of SSD and
> > Lukas> spinning disk does export discard_support information properly,
> > Lukas> however it also advertise discard_zeroes_data which is wrong and
> > Lukas> possibly dangerous and should be fixed!
> > 
> > I can't reproduce this here. If I mix discard and non-discard devices
> > things work correctly. discard_zeroes_data also gets cleared if I mix
> > discard-capable drives where one zeroes and one doesn't.
> > 
> > 
> 
> [root@trim ~]# hdparm -I /dev/sdb | grep -i trim
> [root@trim ~]# cat /sys/block/sdb/queue/discard_zeroes_data
> 0
> [root@trim ~]# hdparm -I /dev/sdd | grep -i trim
>            *    Data Set Management TRIM supported
>            *    Deterministic read after TRIM
> [root@trim ~]# cat /sys/block/sdd/queue/discard_zeroes_data 
> 1
> [root@trim ~]# pvcreate /dev/sdd1 
>   Physical volume "/dev/sdd1" successfully created
> [root@trim ~]# pvcreate /dev/sdb3 
>   Physical volume "/dev/sdb3" successfully created
> [root@trim ~]# vgcreate vg_test /dev/sdd1 /dev/sdb3 
>   Volume group "vg_test" successfully created
> [root@trim ~]# lvcreate -L 3500M vg_test
>   Logical volume "lvol0" created
> [root@trim ~]# ls -lah /dev/mapper/vg_test-lvol0 
> lrwxrwxrwx. 1 root root 7  2. kvě 10.30 /dev/mapper/vg_test-lvol0 -> ../dm-0
> [root@trim ~]# cat /sys/block/dm-0/queue/discard_zeroes_data 
> 1

Hmm, Strange considering DM just uses blk_stack_limits().

As Martin said, current blk_stack_limits() code is fine:
t->discard_zeroes_data &= b->discard_zeroes_data;

> So I assume it got fixes just recently ?. I'll give it a try with the
> up-to-date kernel.

Hasn't changed at all since it was introduced:
98262f2 v2.6.33-rc1 block: Allow devices to indicate whether discarded blocks are zeroed
