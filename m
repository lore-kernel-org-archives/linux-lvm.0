Date: Thu, 5 Sep 2019 11:55:19 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20190905165519.GB30473@redhat.com>
References: <c88b7c49-1046-ae78-4352-fa51e1ef7873@suse.com>
	<20190829143759.GA22659@redhat.com>
	<9280276f-8601-cfbc-db46-1dcb28f92229@suse.com>
	<20190903151705.GA30692@redhat.com>
	<ff7a48ee-221d-d5a3-14ad-074806abf5b8@suse.com>
	<370ba3fa-53df-7213-8876-d37ef1a3b57e@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <370ba3fa-53df-7213-8876-d37ef1a3b57e@suse.com>
Subject: Re: [linux-lvm] system boot time regression when using lvm2-2.03.05
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
To: Heming Zhao <heming.zhao@suse.com>
Cc: Martin Wilck <mwilck@suse.de>, "linux-lvm@redhat.com" <linux-lvm@redhat.com>

On Thu, Sep 05, 2019 at 12:35:53PM +0000, Heming Zhao wrote:
> In pvscan_cache_cmd, the code in below area "#if 0 .. #endif take a huge 
> time. When I used below modified code to boot, the time reduced from 
> 1min to 1.389s.

That stops the command from doing any work.  I suspect that in your tests,
the "fast" case is not doing any activation, and the "slow" case is.
Please check where the LVs are being activated in the fast case.
