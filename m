Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l22MJ2xa030772
	for <linux-lvm@redhat.com>; Fri, 2 Mar 2007 17:19:02 -0500
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l22MJ0HE009220
	for <linux-lvm@redhat.com>; Fri, 2 Mar 2007 17:19:00 -0500
Received: from localhost (localhost [127.0.0.1])
	by mail2.syneticon.net (Postfix) with ESMTP id CCF2D5468B
	for <linux-lvm@redhat.com>; Fri,  2 Mar 2007 23:18:48 +0100 (CET)
Received: from mail2.syneticon.net ([127.0.0.1])
	by localhost (linux [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 07542-10 for <linux-lvm@redhat.com>;
	Fri,  2 Mar 2007 23:18:33 +0100 (CET)
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Fri,  2 Mar 2007 23:18:33 +0100 (CET)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id C199B94EE
	for <linux-lvm@redhat.com>; Fri,  2 Mar 2007 23:18:32 +0100 (CET)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id 72n8c2PnxnWc for <linux-lvm@redhat.com>;
	Fri,  2 Mar 2007 23:17:30 +0100 (CET)
Received: from [84.44.218.233] (xdsl-84-44-218-233.netcologne.de
	[84.44.218.233]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Fri,  2 Mar 2007 23:18:30 +0100 (CET)
Message-ID: <45E8A2B5.3020103@wpkg.org>
Date: Fri, 02 Mar 2007 23:18:29 +0100
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] severe problems to remove invalid/full snapshots
	with	debian-etch
References: <20070302210230.GA10659@iss.tu-darmstadt.de>
In-Reply-To: <20070302210230.GA10659@iss.tu-darmstadt.de>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Tom Assmuth schrieb:
> hi,
> 
> i gave up using lvm2 with debian sarge cause to a lot of problems
> concerning stability but now i gave it another try with my debian-etch
> box. but here problems with snapshots are still severe.
> 
> --
> used system:
> kernel: 2.6.18-3-686 (normal kernel version in etch)
> lvm version
>   LVM version:     2.02.07 (2006-07-17)
>   Library version: 1.02.08 (2006-07-17)
>   Driver version:  4.7.0
> --
> 
> problem: 
> 
> if a snapshot runs full (having attributes like this calling
> lvs: Swi-I- ) I of course try to remove it with lvremove:
> 
> this will throw something like this on all consoles:
> 
>  kernel BUG at mm/slab.c:595!
>  invalid opcode: 0000 [#1]
>  EIP is at kmem_cache_free+0x29/0x6d
>  esi: daa2f28c   edi: d9439a88   ebp: 00036c68   esp: c593fdb0
>  Process lvremove (pid: 25402, ti=c593e000 task=c533aaa0 task.ti=c593e000)
>  Stack: 15f529ae daa2f28c dd08dc68 dc86c94e dbf84220 00006d8d 00008000 daa2f240
>  ...
>  EIP: [<c0156f55>] kmem_cache_free+0x29/0x6d SS:ESP 0068:c593fdb0
>  ...

(...)

Check the answer to my earlier post ("moving logical volumes to another 
system *remotely* - how?") by Bryn M. Reeves:

   This is a known issue in older kernels that was fixed upstream in
   2.6.19. See:

   http://www.uwsg.iu.edu/hypermail/linux/kernel/0612.1/2301.html
   https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=204791


-- 
Tomasz Chmielewski
http://wpkg.org
