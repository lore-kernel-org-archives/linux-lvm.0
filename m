Message-ID: <20010830134914.13181.qmail@web14401.mail.yahoo.com>
Date: Thu, 30 Aug 2001 06:49:14 -0700 (PDT)
From: Aman Shahi <shahi_aman@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] Problem with Snapshot or something else ?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> >>Chris Mason posted a new VFA lock patch for 2.4.8+
> >>heer:
>
>>http://lists.sistina.com/pipermail/lvm-devel/2001-August/000612.html

I have linux kernel 2.4.8-ac8 and applied the VFS lock
patch. I am having a problem when having snapshots.

1. I create a VG over three disk partitions
sda2,sdb2,sdc2 ( total size being around 90G)
2. I then create a LV of size 10G. 
3. I create a reiser file system over this LV and
mount it.
4. I copy around 1.2G of data to this LV.
5. I take a snapshot of this LV.
6. I leave the snapshot and try copying another 1.2G
of data to the LVM. I am doing the I/O using cp
command. The cp command gives segmentation fault and I
get a kernel message...

Code: 8b 0b eb 12 eb 0d 90 90 90 90 90 90 90 90 90 90
90 90 90 8b
 <1>Unable to handle kernel paging request at virtual
address 0001d108
 printing eip:
c01c65cd
*pde = 00000000
Oops: 0000
CPU:    0
EIP:    0010:[<c01c65cd>]
EFLAGS: 00010246
eax: 00003a21   ebx: 0001d108   ecx: c0da5800   edx:
00000000
esi: 00000000   edi: 007919f8   ebp: 00000812   esp:
cc911d34
ds: 0018   es: 0018   ss: 0018
Process cp (pid: 1341, stackpage=cc911000)
Stack: 00000080 cc910000 00000040 00000000 c0da5970
c0da5800 00790178 00000001
       c01c3580 cc911d8e cc911d84 00790178 c0da5800
000000ff 00000080 00000000
       cd073400 ccee0000 00790178 00003c70 00791a38
00791a38 08120000 00000000
Call Trace: [<c01c3580>] [<c01695e2>] [<c01c366f>]
[<c0192c92>] [<c015b5c7>]
   [<c01323b1>] [<c0192cec>] [<c0192f17>] [<c0111f42>]
[<c0134118>] [<c0132fb6>]
   [<c01334e3>] [<c015e9a5>] [<c0133491>] [<c012631a>]
[<c01244f0>] [<c01305c6>]
   [<c0106ebb>]

Code: 8b 0b eb 12 eb 0d 90 90 90 90 90 90 90 90 90 90
90 90 90 8b

When I do not have any snapshot, I am able to copy any
amount of data to the LV. But I am consistently
getting this error when I have sometimes one, or more
than snapshot in the system. 

Am I doing something wrong ??
I am not sure whether this is a problem with snapshot
or some other problem. But as I see it only when I
have snapshots in the system, I am reporting it here.

I would also like to know how do I get the latest VFS
lock patch ? I mean with normal source code we get
linux-2.4.4-VFS-lock.patch. I found that it was
different from the one mentioned above(start of this
mail), which is supposed to be for 2.4.8-ac8. But when
I tried this(2.4.8-ac8) with kernel 2.4.8-ac9 it
failed. So which patch do I use for generic purpose ?

regards,
Aman Shahi.



__________________________________________________
Do You Yahoo!?
Get email alerts & NEW webcam video instant messaging with Yahoo! Messenger
http://im.yahoo.com
