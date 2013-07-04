Date: Thu, 4 Jul 2013 17:40:16 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20130704164016.GB3344@agk-dp.fab.redhat.com>
References: <CAFrGbuW1NDnsZfm7S5f=wsTbZ4rcb6huPX7MMv_AiZF95xDYSQ@mail.gmail.com>
	<20130704111817.GA3344@agk-dp.fab.redhat.com>
	<CAFrGbuVF_F3y0CMazywv8Y2pavYXjUXJk7_3DE_X6-6hZsNf1w@mail.gmail.com>
	<CAFrGbuWmVKH+N970R6qrCEV1BaSSWyLix-4+66sP_Q84+bAFqQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFrGbuWmVKH+N970R6qrCEV1BaSSWyLix-4+66sP_Q84+bAFqQ@mail.gmail.com>
Subject: Re: [linux-lvm] I can't have the mirror_log mirrored,
	LVM	complains "there is no suitable space"
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alessandro MACUZ <alessandro.macuz@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Jul 04, 2013 at 04:27:51PM +0200, Alessandro MACUZ wrote:
> root@Microknoppix:/tmp/lvm2-2_02_98# lvconvert -vvv -m1 --mirrorlog
> mirrored --alloc normal /dev/lvgrptstnlvm/root /dev/sdb1

So you want to convert an existing LV into a mirror (-m1) with a mirrored log
with the default allocation policy allocating all new extents from /dev/sdb1.

The current layout:

>         /dev/sda1 0:      0   1536: root(0:0)
>         /dev/sda1 1:   1536    767: NULL(0:0)
>         /dev/sdb1 0:      0   2271: NULL(0:0)
>         /dev/sdb2 0:      0     31: NULL(0:0)
>         /dev/sdc 0:      0      7: NULL(0:0)

The Physical Extents that can used for allocation during this process:

>         Adding PE range: start PE 0 length 2271 on /dev/sdb1

Details of the allocation requested:

>         Allowing allocation on /dev/sdb1 start PE 0 length 2271
>         Parallel PVs at LE 0 length 1536: /dev/sda1

>         Still need 1538 total extents:
>           1 (1 data/0 parity) parallel areas of 1536 extents each
>           2 mirror logs of 1 extents each

So it is looking for 1536 extents on a disk that is not /dev/sda1
and 2 further extents for the mirrored log on different disks from each other.

But it only has one disk available - /dev/sdb1 - so this will fail unless
you go down to --alloc anywhere.

So what should you do?
If you want a mirrored log, decide where to put it and provide the command
with additional space on another disk to hold it.

So let it use part of /dev/sda1 perhaps by appending '/dev/sda1:1536' to
the command or if that isn't enough, try something like '/dev/sdb2:0 /dev/sdc:0'.

Alasdair
