Message-ID: <401DB9A7.4030104@wanadoo.es>
From: Xose Vazquez Perez <xose@wanadoo.es>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Sun Feb  1 21:46:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com, linux-kernel@vger.kernel.org, mauelshagen@sistina.com, marcelo.tosatti@cyclades.com, hch@infradead.org

Christoph Hellwig wrote:

> The patch still doesn't get better by that.  And even if it was this
> would clearly be a feature for 2.6, not 2.4.

Without this patch there is no warranty that a LVM_snapshot is updated
like the FS that is trying to replicate. DANGER !!!

I only see one solution:
to stop FS IO, and then # sync; sync; sync; lvcreate -s ...

Maybe it's needed to write, in the code or a doc, some warning about this
or to put a pointer to this patch :-?

--
Software is like sex, it's better when it's bug free.
