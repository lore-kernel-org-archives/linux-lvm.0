Date: Mon, 22 Apr 2019 14:25:44 -0400
From: Mike Snitzer <snitzer@redhat.com>
Message-ID: <20190422182544.GA27249@redhat.com>
References: <20190419193036.GA24986@chatter.i7.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190419193036.GA24986@chatter.i7.local>
Subject: Re: [linux-lvm] Network-attached block storage and local SSDs for
	dm-cache
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: linux-lvm@redhat.com

On Fri, Apr 19 2019 at  3:30pm -0400,
Konstantin Ryabitsev <konstantin@linuxfoundation.org> wrote:

> Hi, all:
> 
> I know it's possible to set up dm-cache to combine network-attached
> block devices and local SSDs, but I'm having a hard time finding any
> first-hand evidence of this being done anywhere -- so I'm wondering
> if it's because there are reasons why this is a Bad Idea, or merely
> because there aren't many reasons for folks to do that.
> 
> The reason why I'm trying to do it, in particular, is for
> mirrors.kernel.org systems where we already rely on dm-cache to
> combine large slow spinning disks with SSDs to a great advantage.
> Most hits on those systems are to the same set of files (latest
> distro package updates), so dm-cache hit-to-miss ratio is very
> advantageous. However, we need to build newest iterations of those
> systems, and being able to use network-attached storage at providers
> like Packet with local SSD drives would remove the need for us to
> purchase and host huge drive arrays.
> 
> Thanks for any insights you may offer.

Only thing that could present itself as a new challenge is the
reliability of the network-attached block devices (e.g. do network
outages compromise dm-cache's ability to function).

I've not done any focused testing for, or thinking about, the impact
unreliable block devices might have on dm-cache (or dm-thinp, etc).
Usually we advise people to ensure the devices that they layer upon are
adequately robust/reliable.  Short of that you'll need to create your
own luck by engineering a solution that provides network storage
recovery.

If the "origin" device is network-attached and proves unreliable you
can expect to see the dm-cache experience errors.  dm-cache is not
raid.  So if concerned about network outages you might want to (ab)use
dm-multipath's "queue_if_no_path" mode to queue IO for retry once the
network-based device is available again (dm-multipath isn't raid
either, but for your purposes you need some way to isolate potential for
network based faults).  Or do you think you might be able to RAID1 or
RAID5 N of these network attached drives together?

Mike
