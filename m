Received: from ns3.rdu.redhat.com (ns3.rdu.redhat.com [10.11.255.199])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m7TKVqDK006479
	for <linux-lvm@redhat.com>; Fri, 29 Aug 2008 16:31:52 -0400
Received: from [10.32.4.54] (vpn-4-54.str.redhat.com [10.32.4.54])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id m7TKVpJv002451
	for <linux-lvm@redhat.com>; Fri, 29 Aug 2008 16:31:51 -0400
Message-ID: <48B85CB6.1080403@redhat.com>
Date: Fri, 29 Aug 2008 22:31:50 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] 15 snapshot limit?
References: <1c748a490808291310g274df331ifc76fce539b56954@mail.gmail.com>
In-Reply-To: <1c748a490808291310g274df331ifc76fce539b56954@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Larry Dickson wrote:
> With a 768 GB logical volume in a 2235 GB volume group, and 4 GB of
> memory, I try to set up lots of snapshots (of 45 or 50 GB each) and
> can't get past 15. Sometimes I'll succeed in generating more than 15
> COWs in /dev/mapper, but lvdisplay never shows more than 15 snapshots in
> the "LV snapshot status source of" listing under the parent volume. I
> searched and found 15 snapshots mentioned in a couple places like
> wiki.samba.org/index.php/Shadow_Copies_with_Snapshots
> <http://wiki.samba.org/index.php/Shadow_Copies_with_Snapshots> - but
> nothing really authoritative.
>  
> Is there really such a limit? Or is it a memory requirement - I seem to
> remember so many MB memory per GB of storage, but can't find that
> either. Versions are (variants of) lvm2-2.02.38, device-mapper-1.02.26,
> kernel-smp-2.6.20 (64 bit).

Hi,
no, there is no hard limit for snapshots.

But IIRC patches which solves some problems related with this (using private dm-io
mempool) were commited in 2.6.22 kernel.
But anyway, many snapshot from one origin causes serious performance degradation.
(Current snapsot implementation is not ideal in this situation - every write to origin
is replicated N-times to COW snapshot area - iow: every snapshot is independent and
need copy changed area separately.)

(But technically I tested >50 snapshot from one LV - should be limited only by available
memory in recent kernels).

Milan
--
mbroz@redhat.com
