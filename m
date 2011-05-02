From: "Martin K. Petersen" <martin.petersen@oracle.com>
References: <20110413224025.GA18589@redhat.com>
	<20110413234854.GA19793@redhat.com>
	<20110426173213.GA19604@redhat.com>
	<20110428001912.GA14659@redhat.com>
	<20110428075355.GA2190@infradead.org>
	<20110428205935.GA24979@redhat.com>
	<alpine.LFD.2.00.1104291117510.5496@dhcp-27-109.brq.redhat.com>
	<20110429122454.GL32370@agk-dp.fab.redhat.com>
	<alpine.LFD.2.00.1105020857030.3778@dhcp-27-109.brq.redhat.com>
	<20110502081308.GC8642@agk-dp.fab.redhat.com>
	<20110502081925.GA11312@infradead.org>
	<alpine.LFD.2.00.1105021217080.3778@dhcp-27-109.brq.redhat.com>
	<yq1bozl420p.fsf@sermon.lab.mkp.net>
	<alpine.LFD.2.00.1105021631590.3778@dhcp-27-109.brq.redhat.com>
Date: Mon, 02 May 2011 10:50:03 -0400
In-Reply-To: <alpine.LFD.2.00.1105021631590.3778@dhcp-27-109.brq.redhat.com>
	(Lukas Czerner's message of "Mon, 2 May 2011 16:39:31 +0200 (CEST)")
Message-ID: <yq139kx40o4.fsf@sermon.lab.mkp.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] [dm-devel] do not disable ext4 discards on first
	discard failure? [was: Re: dm snapshot: ignore discards
	issued to the snapshot-origin target]
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
To: Lukas Czerner <lczerner@redhat.com>
Cc: sandeen@redhat.com, "Martin K. Petersen" <martin.petersen@oracle.com>, Mike Snitzer <snitzer@redhat.com>, Christoph Hellwig <hch@infradead.org>, device-mapper development <dm-devel@redhat.com>, DarkNovaNick@gmail.com, linux-lvm@redhat.com, linux-ext4@vger.kernel.org, Alasdair G Kergon <agk@redhat.com>

>>>>> "Lukas" == Lukas Czerner <lczerner@redhat.com> writes:

Lukas> So I assume it got fixes just recently ?. I'll give it a try with
Lukas> the up-to-date kernel.

Ok, turns out the SSD I used for the test predates advertising
TRIM. Beats me why this is broken for the zeroes/!zeroes case. I'll get
it fixed...

-- 
Martin K. Petersen	Oracle Linux Engineering
