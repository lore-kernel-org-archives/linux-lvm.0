From: Jan Niehusmann <list039@gondor.com>
Subject: Re: [linux-lvm] pvmove hangs
Message-ID: <20030817231415.GA4328@gondor.com>
References: <20030816102005.GA12916@gondor.com> <20030816195606.B25758@uk.sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030816195606.B25758@uk.sistina.com>
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
Date: Sun Aug 17 18:15:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Aug 16, 2003 at 07:56:06PM +0100, Alasdair G Kergon wrote:
> If pvmove process itself freezes, then a long/wide 'ps' output for that
> process, kcopyd & kmirrord (incl cols: NI, VSZ, RSS, STAT 
> and symbolic WCHAN).

I noticed the WCHAN fields in my ps output were not very useful, because
they pointed to a module and were not decoded.

So I took the numeric value (92fa83) and looked it up by hand. It seems
to point to the schedule() call in line 56 of dm-daemon.c for both
kcopyd and kmirrord. 

And then, I made a quite worrying observation: When the hanging happens,
the device being copied is in a completely garbled state. In this case,
/dev/vgraid/lvol5 didn't look like an ext3 filesystem at all. 

So I looked at the underlying devices, and both /dev/hda4 and /dev/md2 had
a copy of the actual filesystem, only differing in the last 512K. This
conforms to the fact that the mirroring was done for all but one 512K
block. But these 512K are completely different (target device all zeroes).

However, these are only the underlying devices. Looking at
/dev/vgraid/lvol5 a little bit closer revealed that it contained parts
of some other filesystem. Very strange. And worrying. I don't even want
to know if writing to this LV would overwrite some unrelated partition.

Jan
