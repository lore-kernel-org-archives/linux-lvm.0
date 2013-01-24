Date: Thu, 24 Jan 2013 18:08:34 +0000
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20130124180834.GA3122@agk-dp.fab.redhat.com>
References: <20130124155312.GA10563@daedalus.cslab.ece.ntua.gr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20130124155312.GA10563@daedalus.cslab.ece.ntua.gr>
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
Cc: synnefo-devel@googlegroups.com, linux-lvm@redhat.com

If you've got the capacity to test, create one that's quite a bit
larger and see how much space it actually uses up when full, then use
that size in future.  There's a header, and then the blocks are written
sequentially with an index block inserted ahead of each group of
data blocks.

Or try out thin LVs available in recent LVM releases/kernels for
an alternative 'sparse' approach.

Alasdair
