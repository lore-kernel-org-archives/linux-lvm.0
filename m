Date: Thu, 5 May 2011 10:33:44 +0200
From: Karel Zak <kzak@redhat.com>
Message-ID: <20110505083344.GA1114@nb.net.home>
References: <20110429122454.GL32370@agk-dp.fab.redhat.com>
	<alpine.LFD.2.00.1105020857030.3778@dhcp-27-109.brq.redhat.com>
	<20110502081308.GC8642@agk-dp.fab.redhat.com>
	<20110502081925.GA11312@infradead.org>
	<alpine.LFD.2.00.1105021217080.3778@dhcp-27-109.brq.redhat.com>
	<yq1bozl420p.fsf@sermon.lab.mkp.net>
	<alpine.LFD.2.00.1105021631590.3778@dhcp-27-109.brq.redhat.com>
	<yq1tydd2g5h.fsf@sermon.lab.mkp.net>
	<alpine.LFD.2.00.1105031036090.4250@dhcp-27-109.brq.redhat.com>
	<yq1sjsuzebu.fsf@sermon.lab.mkp.net>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yq1sjsuzebu.fsf@sermon.lab.mkp.net>
Subject: Re: [linux-lvm] [dm-devel] do not disable ext4 discards on first
	discard	failure? [was: Re: dm snapshot: ignore discards
	issued to the	snapshot-origin target]
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
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: sandeen@redhat.com, Mike Snitzer <snitzer@redhat.com>, Christoph Hellwig <hch@infradead.org>, device-mapper development <dm-devel@redhat.com>, DarkNovaNick@gmail.com, linux-lvm@redhat.com, Lukas Czerner <lczerner@redhat.com>, linux-ext4@vger.kernel.org, Alasdair G Kergon <agk@redhat.com>

On Wed, May 04, 2011 at 11:16:05AM -0400, Martin K. Petersen wrote:
> >>>>> "Lukas" == Lukas Czerner <lczerner@redhat.com> writes:
> 
> I got tired of poking around in sysfs to find the discard topology.
> Here's a patch against lsblk that adds a -D option to present this
> information in a human-readable form:

Applied, thanks.

> # lsblk -D
> NAME                  DISC-ALN DISC-GRAN DISC-MAX DISC-ZERO
> sda                          0        0B       0B         0
> └─sda1                       0        0B       0B         0
> sdb                          0      512B       2G         1
> └─sdb1                       0      512B       2G         1

I have a question, 2.6.35 on my ThinkPad, non-SSD disk:

NAME                   DISC-ALN DISC-GRAN DISC-MAX DISC-ZERO
sda                           0        0B       0B         0
├─sda1               4294935040        0B       0B         0
├─sda2               4188038656        0B       0B         0
├─sda3               1346205184        0B       0B         0
├─sda4               3231165440        0B       0B         0
├─sda5               4188006400        0B       0B         0
│ └─kzak-home (dm-0)          0        0B       0B         0
└─sda6               2035725312        0B       0B         0


Does is make sense? The DISC-ALN is non-zero but DISC-GRAN is zero.

Note that cat /sys/block/sda/sda*/discard_alignment returns the same
numbers.

    Karel

-- 
 Karel Zak  <kzak@redhat.com>
 http://karelzak.blogspot.com
