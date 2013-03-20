Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r2K9cfcF013407
	for <linux-lvm@redhat.com>; Wed, 20 Mar 2013 05:38:41 -0400
Received: from jajo.eggsoft.pl (eggsoft.sp.imz.pl [212.106.158.142])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r2K9ccYS001024
	for <linux-lvm@redhat.com>; Wed, 20 Mar 2013 05:38:39 -0400
Received: from jajo.eggsoft (localhost [127.0.0.1])
	by jajo.eggsoft.pl (Postfix) with ESMTP id 29B7DB002
	for <linux-lvm@redhat.com>; Wed, 20 Mar 2013 10:38:37 +0100 (CET)
Date: Wed, 20 Mar 2013 10:38:36 +0100
From: Jacek Konieczny <jajcus@jajcus.net>
Message-ID: <20130320103836.58451646@jajo.eggsoft>
In-Reply-To: <CAHkw+LfrqkbZ8GUnEfz8umL22NJHep0xTmYkQ3wb-gr3rSFNhA@mail.gmail.com>
References: <CAHkw+LfrqkbZ8GUnEfz8umL22NJHep0xTmYkQ3wb-gr3rSFNhA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Error Attempting to Create LV on Clustered VG
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
To: linux-lvm@redhat.com

On Tue, 19 Mar 2013 12:58:53 -0400
Marc Smith <marc.smith@mcc.edu> wrote:
> Hi,
> 
> I'm attempting to create a logical volume on a clustered volume group
> in a (2) node Pacemaker + Corosync cluster (active/active). I have
> successfully created the VG and it appears available on both hosts:
> 
> [root@bill ~]# vgs
>   VG   #PV #LV #SN Attr   VSize   VFree
>   r0     1   0   0 wz--nc 203.24g 203.24g
> 
> [root@ben ~]# vgs
>   VG   #PV #LV #SN Attr   VSize   VFree
>   r0     1   0   0 wz--nc 203.24g 203.24g
> 
> When I attempt to create a LV on this VG from one of the hosts, I get
> the following error message:
> [root@ben ~]# lvcreate -L 150G -n testvmfs1 r0
>   Error locking on node 40e6640a: Invalid argument
>   Error locking on node 31e6640a: Invalid argument
>   Failed to activate new LV.

[...]

> I've Google'd around a bit but haven't found any other posts quite
> like this one. Here are the software versions I'm using on these
> hosts:
> Linux kernel: 3.7.8
> LVM2: 2.02.97
> DLM User Tools (dlm_controld): 4.0.1
> Corosync: 2.3.0
> Pacemaker: 1.1.8

Are you using a 64-bit environment. If so, then this might be the bug in the
3.7 kernel DLM driver.

http://www.redhat.com/archives/cluster-devel/2013-February/msg00060.html

And here is the patch:

http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=d4b0bcf32b946590afd29e202d6a399b84fe6c67


Greets,
	Jacek
