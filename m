Return-Path: <mason@suse.com>
Date: Fri, 23 Feb 2001 16:16:24 -0500
From: Chris Mason <mason@suse.com>
Subject: Re: [linux-lvm] oops on 2.4.2 with lvm-0.9beta5 and Reiserfs 3.6.25
Message-ID: <703660000.982962984@tiny>
In-Reply-To: <14998.53544.642864.34288@eagle.mh.lucent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
To: linux-lvm@sistina.com


On Friday, February 23, 2001 04:07:52 PM -0500 lvm@winux.com wrote:

> ReiserFS version 3.6.25
> journal-1777: buffer 16 bad state !PREPARED !LOCKED !DIRTY !JDIRTY_WAIT

This oops shows that somebody logged the super block without preparing it.
Could you please run this data through ksymoops so I can track down the
caller?

> Unable to handle kernel NULL pointer dereference at virtual address
> 00000000 printing eip:
> c011370b
> *pde = 00000000
> Oops: 0002
> CPU:    0
> EIP:    0010:[<c011370b>]
> EFLAGS: 00010086
> eax: c697b578   ebx: 00000000   ecx: 00000286   edx: c15bdd68
> esi: c15bdd60   edi: c15bc000   ebp: c697bb90   esp: c15bdd48
> ds: 0018   es: 0018   ss: 0018
> Process lvcreate (pid: 134, stackpage=c15bd000)
> Stack: c697b56c c15bdd60 c01079d9 c697ba00 c697b400 c6879000 00000001
> c15bc000  c697b578 00000000 c0107b38 c697b56c c13b51a0 00000000 c023bf73
>        4004fe20  080989e0 c15bdf9c c6879000 c697ba00 00000001 c68794c4
>        00000004 c68794c4  Call Trace: [<c01079d9>] [<c0107b38>]
> [<c023bf73>] [<c01f3724>] [<c013b967>] [<c0108e2f>] [<c010002b>] 
> 
> Code: 89 13 51 9d 5b 5e c3 89 f6 9c 58 fa 8b 4a 0c 8b 52 08 89 4a 

-chris
