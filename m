From: Daniel Bayer <daniel.bayer@stud.uni-rostock.de>
Subject: Re: [linux-lvm] Problems with snapshots on sparc64
In-reply-to: <20030602170507.B6678@sistina.com>
Message-id: <20030603193935.GA16294@wh9155.stw.uni-rostock.de>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-disposition: inline
References: <20030602131232.GB9679@wh9155.stw.uni-rostock.de>
 <20030602170507.B6678@sistina.com>
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
Date: Tue Jun  3 14:38:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Mon, Jun 02, 2003 at 05:05:07PM +0200, Heinz J . Mauelshagen wrote:
> On Mon, Jun 02, 2003 at 03:12:32PM +0200, Daniel Bayer wrote:
> > But this problem:
> > > > Another related problem is, that "cat /proc/lvm/global" in the most
> > > > cases doesn't output the usual data but some random memory. Its really
> > > > odd. But if I try often enough I sometimes also get the right output
> > > > (and no, I didn't calculated the probability). The other files in
> > > > /proc/lvm work fine.
> > 
> > appears also if there are no snapshots at all. (This time I only had
> > to try 2 times to get the version-string.)

I just did the update of the kernel (1.0.7(28/03/2003)) and tools
(1.0.7-3).

The problem with /proc/lvm/global still appears:
| tau:~ # hexdump -C < /proc/lvm/global
| 00000000  00 06 d9 84 00 00 00 00  00 00 00 00 00 00 00 00  |................|
| 00000010  00 06 d9 40 00 00 00 00  00 04 f4 08 00 00 00 00  |...@............|
| 00000020  00 06 e6 fc 00 00 00 00  00 06 da bc 00 00 00 00  |................|
| 00000030  00 06 f1 70 00 00 00 00  00 06 f0 94 00 00 00 00  |...p............|
| 00000040  00 06 db f0 00 00 00 00  00 06 f5 88 00 00 00 00  |................|
| 00000050  00 06 d8 a0 00 00 00 00  00 00 00 00 00 00 00 00  |................|
| 00000060  00 06 e6 a0 00 00 00 00  00 00 00 00 00 00 00 00  |................|
| 00000070  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
| 00000080  00 00 00 00 00 00 00 00  00 06 d9 08 00 00 00 00  |................|
| 00000090  00 00 00 00 00 00 00 00  00 06 ea dc 00 00 00 00  |................|
| 000000a0  00 00 00 00 00 00 00 00  00 06 fb cc 00 00 00 00  |................|
| 000000b0  00 06 f9 88 00 00 00 00  00 06 f5 88 00 00 00 00  |................|
| 000000c0  00 07 b0 9c 00 00 00 00  00 00 00 00 00 00 00 00  |................|
| 000000d0  00 06 db 50 00 00 00 00  00 06 c7 d8 00 00 00 00  |...P............|
| 000000e0  00 06 f3 bc 00 00 00 00  00 00 00 00 00 00 00 00  |................|
| 000000f0  00 00 00 00 00 00 00 00  00 06 d9 84 00 00 00 00  |................|
| 00000100  00 00 00 00 00 00 00 00  00 06 f5 70 00 00 00 00  |...........p....|
| 00000110  00 06 d8 68 00 00 00 00  00 06 fc e8 00 00 00 00  |...h............|
| 00000120  00 06 e6 c4 00 00 00 00  00 06 da bc 00 00 00 00  |................|
| 00000130  00 06 f1 70 00 00 00 00  00 06 f0 94 00 00 00 00  |...p............|
| 00000140  00 06 db f0 00 00 00 00  00 06 f5 88 00 00 00 00  |................|
| 00000150  00 00 00 00 00 00 00 00  00 06 c1 e0 00 00 00 00  |................|
| 00000160  00 06 e7 38 00 00 00 00  00 06 d2 a4 00 00 00 00  |...8............|
| 00000170  00 06 d4 1c 00 00 00 00  00 06 c1 5c 00 00 00 00  |...........\....|
| 00000180  00 06 fc 88 00 00 00 00  00 06 d9 08 00 00 00 00  |................|
| 00000190  00 00 00 00 00 00 00 00  00 06 ea dc 00 00 00 00  |................|
| 000001a0  00 00 00 00 00 00 00 00  00 06 f8 94 00 00 00 00  |................|
| 000001b0  00 06 f9 88 00 00 00 00  00 06 f5 88 00 00 00 00  |................|
| 000001c0  00 06 d8 50 00 00 00 00  00 04 f3 00 00 00 00 00  |...P............|
| 000001d0  00 06 db 50 00 00 00 00  00 06 f4 94 00 00 00 00  |...P............|
| 000001e0  00 06 f3 bc 00 00 00 00  00 00 00 00 00 00 00 00  |................|
| 000001f0  00 00 00 00 00 00 00 00  00 06 eb 88 00 00 00 00  |................|
| 00000200  00 00 00 00 00 00 00 00  00 06 e9 60 00 00 00 00  |...........`....|
| 00000210  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
| *
| 000003b0  00 00 00 00 00 00 00                              |.......|
| 000003b7
| tau:~ # 

At the moment there are four or five outputs that appears often.
Others are more seldom. Sometimes there are strings in the output,
that (at least I believe so) belong to some userspace programm.

If I do a "lvdisplay" on a snapshot I still get the vfree-error:
| Jun  3 20:58:16 tau kernel: Trying to vfree() nonexistent vm area (00000001401a8000)
| Jun  3 20:58:45 tau last message repeated 5 times

As I'm only logged in remotely I wont try to crash the system now.


Daniel
