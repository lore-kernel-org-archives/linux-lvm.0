Date: Mon, 1 Nov 2004 14:32:25 -0800
From: Dave Olien <dmo@osdl.org>
Message-ID: <20041101223225.GA31803@osdl.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] increase raid0 stripe size limit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dm-devel@redhat.com, agk@redhat.com, linux-lvm@redhat.com



The last I looked, LVM2 had an upper limit on it's raid0 strip size
of 512k.  This seems way too small.  Modern disks often have track caches
that are several megabytes big.  It's my understanding raid0 strip sizes
frequently want to be on the order of the disk cache size.

It looks like the limit is not in the kernel's device mapper, but in
the lvm2 tools.  Any reason this limit can't just be raised, maybe to
10 or more megabytes?

Thanks,
Dave Olien
