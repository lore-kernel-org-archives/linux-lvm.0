From: Steve McIntyre <smcintyre@software.plasmon.com>
Subject: Re: [linux-lvm] Oops when running snapshots
Message-ID: <20040121102732.GA1037@software.plasmon.com>
References: <20040105103500.GA7540@software.plasmon.com> <20040112143507.GK15034@software.plasmon.com> <1074018946.627.19.camel@bluto.andrew>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1074018946.627.19.camel@bluto.andrew>
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
Date: Wed Jan 21 05:35:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: andrew@fc.hp.com
Cc: linux-lvm@sistina.com

On Tue, Jan 13, 2004 at 11:35:46AM -0700, Andrew Patterson wrote:
>
>We worked over this problem with Heinz on LVM 1.07.  One of our kernel
>hackers (along with Heinz) came up with several possible solutions to a
>race condition in the snapshot code.  They are presented below.  We
>found that option #1 worked, but sometimes it could take a long time to
>create multiple snapshots of the same LV under extremely heavy load. 
>The first snapshot is fine, but the second or more can take hours. 
>Option #2 created a huge performance penalty to writes on the original
>LV (90-99%).  I don't remember that option #3 helped any, and we never
>tried #4.  We settled with option #1 and solved the long snapshot
>creation time by stopping I/O while creating the snapshot.

Ok, thanks. We had another hard lockup overnight caused by this
problem. I've just applied #1; I'll let you know how it goes.

<snip>

>Options to fix (included as attachments and inline):
>
>1) don't do the hash table optimization in lvm_find_exception_table,
>which
>we tried last night.  No crashes, but slow.  Doesn't fix the "get the
>write
>semaphore while holding the read semaphore" problem in
>__remap_snapshot().
>
>--- lvm-snap.c~ Mon Aug 25 15:28:50 2003
>+++ lvm-snap.c-erik     Thu Aug 28 13:33:28 2003
>@@ -130,11 +130,13 @@ static inline lv_block_exception_t *lvm_
>                exception = list_entry(next, lv_block_exception_t,
>hash);
>                if (exception->rsector_org == org_start &&
>                    exception->rdev_org == org_dev) {
>+#if 0
>                        if (i) {
>                                /* fun, isn't it? :) */
>                                list_del(next);
>                                list_add(next, hash_table);
>                        }
>+#endif
>                        ret = exception;
>                        break;
>                }

-- 
Steve McIntyre, Plasmon                      smcintyre@software.plasmon.com
Getting a SCSI chain working is perfectly simple if you remember that there
must be exactly three terminations: one on one end of the cable, one on the
far end, and the goat, terminated over the SCSI chain with a silver-handled
knife whilst burning *black* candles. --- Anthony DeBoer
