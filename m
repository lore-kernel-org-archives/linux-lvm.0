Subject: Re: [linux-lvm] raid1+lvm
Message-ID: <20020924112350.GA21473@weissel.dyndns.org>
References: <20020923152349.GA22130@kluge.net> <30810.1032845190@www7.gmx.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <30810.1032845190@www7.gmx.net>
From: Wolfgang Weisselberg <weissel@netcologne.de>
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
Date: Tue Sep 24 06:25:50 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Gerwin Lienert (gerwin.lienert@gmx.de) wrote 37 lines:

> But what do you do, when your swap becomes to small.

- use a swapfile (can be on LVM) with a low priority
- use a swap partition on LVM with a low priority

> Shure, you can start,
> having one swap device outside of your lvm, but in case of increased memory
> leak, you will be happy, if you can easily define another swap device on your
> lvm. I did so, and for me it worked fine.

How about fixing the memory leak?  :-)

Anyway, in most cases HD space is cheap and you can easily
allocate 3-4 times your RAM -- if you need more, you have a
bad leak or should definitively buy more RAM.

In all other cases, you can add swap space on the fly.  And if
you have multiple fast hard disks, do make a swap space on them
all (or even better on each raid system) and use the kernel's
inbuild ability to strip over them (set the priority identical).

-Wolfgang
