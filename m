Return-Path: <iafilius@xs4all.nl>
Date: Sun, 15 Apr 2001 20:14:30 +0200 (CEST)
From: Arjan Filius <iafilius@xs4all.nl>
In-Reply-To: <20010415162451.F1982@suse.de>
Message-ID: <Pine.LNX.4.31.0104152010320.1047-100000@sjoerd.sjoerdnet>
MIME-Version: 1.0
Subject: [linux-lvm] Re: 2.4.4-pre3: lvm.c patch results in "hanging" mount or swapon
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
To: Jens Axboe <axboe@suse.de>
Cc: linux-kernel@vger.kernel.org, linux-lvm@sistina.com

Hello,

On Sun, 15 Apr 2001, Jens Axboe wrote:

> On Sun, Apr 15 2001, Arjan Filius wrote:
> > Hello,
> >
> > While trying kernel 2.4.4-pre3 i found a "hanging" swapon (my swap is on
> > LVM), same effect for "mount -a". 2.4.3 works properly.
> >
> > I found ./drivers/md/lvm.c is patched, and restoring the lvm.c from 2.4.3
> > resulted in normal operation.
> >
> > I Found LVM/0.9.1_beta7 makes some notes about the patch, so i tried that
> > (beta7), but no luck, only 2.4.3:lvm.c worked ok.
>
> Small buglet in the buffer_IO_error out path, I maybe that's it...

Dunno, i did som 'strace'ing and found it is waiting in read():
open("/dev/vg_4/lv_images", O_RDONLY)   = 4
lseek(4, 1024, SEEK_SET)                = 1024
read(4,
      (killed with SAK)


Greatings,



-- 
Arjan Filius
mailto:iafilius@xs4all.nl
