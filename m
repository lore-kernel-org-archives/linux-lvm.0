Return-Path: <jweber@valinux.com>
Date: Wed, 16 May 2001 03:50:33 -0700 (PDT)
From: Jay Weber <jweber@valinux.com>
Subject: Re: [linux-lvm] lvm deadlock with 2.4.x kernel?
In-Reply-To: <20010516093929.B482@66bassett.freeserve.co.uk>
Message-ID: <Pine.LNX.4.30.0105160340450.6579-100000@shells.valinux.com>
MIME-Version: 1.0
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
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, 16 May 2001, Joe Thornber wrote:

> On Tue, May 15, 2001 at 09:17:06PM -0400, Chris Mason wrote:
> > You're right though, pv_flush certainly doesn't look like it could cause
> > any deadlocks.
>
> I must admit I'm struggling to understand why PV_FLUSH even exists.
> It does *exactly* the same thing as a BLKFLSBUF ioctl to the pv device
> itself.  As such I agree that it's unlikely to be the culprit.

I don't think it is, I think it just appears as such.  I've actually
hacked up my LVM here so that lvm_do_pv_flush() just returns 0.  I don't
get the problem there anymore. :)

I'm digging in the userland code now.  It looks to me as though somewhere
around the vg_copy_to_disk or lseek and write to pv_handle in vg_write.c
is where I see the first instance of a BUF_LOCKED buffer being set to
B_FREE.  I added a printk to my put_last_free() function in buffer.c to
denote when such odd symptoms occur.  Again, only LVM userland tool usage
seems to generate output from that printk, nothing else that I do on the
machine.

And it looks as though vg_write.c in tools/lib is just dropping the VG
offset data and such onto the physical PV itself.  I've noted that
following this I get alot more printk messages regarding BUF_LOCKED being
set to B_FREE, the next massive hunk of write is in regards to
lv_write_all_lv, so I gather it's during the writeout of LV information to
a PV?

Not sure why writing data to the raw device would generate these printk's.
Thats the best I've been able to come up with overnight though.

>
> - Joe
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
>
