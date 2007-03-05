Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l25ImuFV004325
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2007 13:48:56 -0500
Received: from lnx130.hrz.tu-darmstadt.de (root@lnx130.hrz.tu-darmstadt.de
	[130.83.174.24])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l25Imrdr015402
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2007 13:48:54 -0500
Received: from iss1.vlsi.informatik.tu-darmstadt.de
	(iss1.vlsi.informatik.tu-darmstadt.de [130.83.164.1])
	by lnx130.hrz.tu-darmstadt.de (8.13.4/8.12.10) with ESMTP id
	l25ImmmN011776
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2007 19:48:48 +0100
Received: from localhost (localhost [127.0.0.1])
	by iss1.vlsi.informatik.tu-darmstadt.de (Postfix) with ESMTP id
	97CD28007
	for <linux-lvm@redhat.com>; Mon,  5 Mar 2007 19:48:48 +0100 (CET)
Received: from iss1.vlsi.informatik.tu-darmstadt.de ([127.0.0.1])
	by localhost (iss1 [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 07803-01 for <linux-lvm@redhat.com>;
	Mon, 5 Mar 2007 19:48:48 +0100 (CET)
Received: from iss17.vlsi.informatik.tu-darmstadt.de
	(iss17.vlsi.informatik.tu-darmstadt.de [130.83.164.17])
	by iss1.vlsi.informatik.tu-darmstadt.de (Postfix) with ESMTP id
	7E6EB8006
	for <linux-lvm@redhat.com>; Mon,  5 Mar 2007 19:48:48 +0100 (CET)
Date: Mon, 5 Mar 2007 19:47:52 +0100
From: Tom Assmuth <ml-lvm@iss.tu-darmstadt.de>
Subject: Re: [linux-lvm] severe problems to remove invalid/full snapshots
	with	debian-etch
Message-ID: <20070305184742.GA22467@iss.tu-darmstadt.de>
References: <20070302210230.GA10659@iss.tu-darmstadt.de>
	<45E8A2B5.3020103@wpkg.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <45E8A2B5.3020103@wpkg.org>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Tomasz!

On Fri, 02 Mar 2007, Tomasz Chmielewski wrote:

> Tom Assmuth schrieb:
> >hi,
> >
> >i gave up using lvm2 with debian sarge cause to a lot of problems
> >concerning stability but now i gave it another try with my debian-etch
> >box. but here problems with snapshots are still severe.
> >
> >--
> >used system:
> >kernel: 2.6.18-3-686 (normal kernel version in etch)
> >lvm version
> >  LVM version:     2.02.07 (2006-07-17)
> >  Library version: 1.02.08 (2006-07-17)
> >  Driver version:  4.7.0
> >--
> >
> >problem: 
> >
> >if a snapshot runs full (having attributes like this calling
> >lvs: Swi-I- ) I of course try to remove it with lvremove:
> >
> >this will throw something like this on all consoles:
> >
> > kernel BUG at mm/slab.c:595!
> > invalid opcode: 0000 [#1]
> > EIP is at kmem_cache_free+0x29/0x6d
> > esi: daa2f28c   edi: d9439a88   ebp: 00036c68   esp: c593fdb0
> > Process lvremove (pid: 25402, ti=c593e000 task=c533aaa0 task.ti=c593e000)
> > Stack: 15f529ae daa2f28c dd08dc68 dc86c94e dbf84220 00006d8d 00008000 
> > daa2f240
> > ...
> > EIP: [<c0156f55>] kmem_cache_free+0x29/0x6d SS:ESP 0068:c593fdb0
> > ...
> 
> (...)
> 
> Check the answer to my earlier post ("moving logical volumes to another 
> system *remotely* - how?") by Bryn M. Reeves:
> 
>   This is a known issue in older kernels that was fixed upstream in
>   2.6.19. See:

thank you! I have tried 2.6.20 and this works now :-)

> 
>   http://www.uwsg.iu.edu/hypermail/linux/kernel/0612.1/2301.html
>   https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=204791

-- 
___________  __  ____          ___    
 / _   __   /_/ ( (   /|/| / / /  /_/ 
/ (_) ///  / / __)_) /   |/_/ /  / /  
