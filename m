From: Christoph Hellwig <hch@infradead.org>
Message-ID: <20040107161251.A30329@infradead.org>
References: <3FFC2B15.4000803@wanadoo.es>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3FFC2B15.4000803@wanadoo.es>; from xose@wanadoo.es on Wed, Jan 07, 2004 at 04:51:49PM +0100
Subject: [linux-lvm] Re: [PATCH] 2.4.25--pre4 VFS lvm_snapshots
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
Date: Thu Jan  8 10:40:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Xose Vazquez Perez <xose@wanadoo.es>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, "Heinz J . Mauelshagen" <mauelshagen@sistina.com>, Marcelo Tosatti <marcelo.tosatti@cyclades.com>, LVM <linux-lvm@sistina.com>

On Wed, Jan 07, 2004 at 04:51:49PM +0100, Xose Vazquez Perez wrote:
> hi,
> 
> This patch is necessary to be able to mount snapshots of journalling
> filesystems. It was flying around lvm for long time, years!!.
> And LiNUX distributions bring it, Red Hat at least since 7.x.
> So, it should be sure.

The patch still doesn't get better by that.  And even if it was this
would clearly be a feature for 2.6, not 2.4.
