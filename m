Message-ID: <4DBACB23.80607@redhat.com>
Date: Fri, 29 Apr 2011 09:28:51 -0500
From: Eric Sandeen <sandeen@redhat.com>
MIME-Version: 1.0
References: <20110412234706.GA11244@redhat.com>
	<20cf301cbef67d323104a0c2ff52@google.com>
	<20110413224025.GA18589@redhat.com>
	<20110413234854.GA19793@redhat.com>
	<20110426173213.GA19604@redhat.com>
	<20110428001912.GA14659@redhat.com>
	<20110428075355.GA2190@infradead.org>
	<20110428205935.GA24979@redhat.com>
	<alpine.LFD.2.00.1104291117510.5496@dhcp-27-109.brq.redhat.com>
	<20110429122454.GL32370@agk-dp.fab.redhat.com>
	<20110429122906.GA7381@infradead.org>
In-Reply-To: <20110429122906.GA7381@infradead.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [dm-devel] do not disable ext4 discards on first
 discard failure? [was: Re: dm snapshot: ignore discards issued to the
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
Content-Type: text/plain; charset="us-ascii"
To: Christoph Hellwig <hch@infradead.org>
Cc: Mike Snitzer <snitzer@redhat.com>, dm-devel@redhat.com, DarkNovaNick@gmail.com, linux-lvm@redhat.com, Lukas Czerner <lczerner@redhat.com>, linux-ext4@vger.kernel.org

On 4/29/11 7:29 AM, Christoph Hellwig wrote:
> FYI, that disable discard on failure seems to be an ext4 special and no
> one else picked up that stupid idea.  If ext4 wants to misbehave for
> that just let them..

It was my "stupid idea," and I'm ok with reverting it ;)

-Eric
