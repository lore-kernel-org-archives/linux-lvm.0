Date: Fri, 25 Jan 2013 12:29:22 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20130125122922.GG3122@agk-dp.fab.redhat.com>
References: <20130124155312.GA10563@daedalus.cslab.ece.ntua.gr>
	<20130124180834.GA3122@agk-dp.fab.redhat.com>
	<51017F0C.20100@bmsi.com>
	<20130124234235.GB3122@agk-dp.fab.redhat.com>
	<20130125084410.GB10563@daedalus.cslab.ece.ntua.gr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20130125084410.GB10563@daedalus.cslab.ece.ntua.gr>
Subject: Re: [linux-lvm] Sparse LVs, --virtualsize equal to --size
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
To: Vangelis Koukis <vkoukis@grnet.gr>
Cc: synnefo-devel@googlegroups.com, LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Jan 25, 2013 at 10:44:10AM +0200, Vangelis Koukis wrote:
> this seems to fit the bill perfectly, it's a shame it's
> not yet merged upstream.
 
One of the reasons the zeroed  target is not upstream is because,
although we thought it would be useful, we had nobody actually
asking to test and use it.

If we bring it up-to-date and prepare to merge it upstream, would you 
test it?

Alasdair
