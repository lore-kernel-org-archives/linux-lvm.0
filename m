Message-ID: <3EF78BFF.9040004@free.fr>
From: Emmanuel Varagnat <emmanuel.varagnat@free.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM2 Rescue Disk
References: <008501c338da$d3d232e0$6501a8c0@ajf> <3EF731DC.6060706@free.fr> <000c01c339a9$e13d40d0$3470f6ce@silver>
In-Reply-To: <000c01c339a9$e13d40d0$3470f6ce@silver>
Content-Transfer-Encoding: 7bit
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
Date: Mon Jun 23 18:24:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Andrew Fabian wrote:
> Excellent, thanks in advance.

Try this: http://coredump.free.fr/linux/lvm2_floppy.img
Then (sorry if I assume that you don't know how to do) :

# dd if=lvm2_floppy.img of=/dev/fd0 bs=10k

The kernel is compiled with all IDE interfaces. No SCSI is available.

-=( manu )=-
