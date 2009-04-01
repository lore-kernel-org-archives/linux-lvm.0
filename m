Received: from jeltz.chrissie.net (vpn-6-27.fab.redhat.com [10.33.6.27])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n317qJNE026026
	for <linux-lvm@redhat.com>; Wed, 1 Apr 2009 03:52:19 -0400
Message-ID: <49D31D32.70907@redhat.com>
Date: Wed, 01 Apr 2009 08:52:18 +0100
From: Chrissie Caulfield <ccaulfie@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Call dlm_release_lockspace with force=1
	in	clvmd-corosync.c
References: <1cafab770903311911p63f962afybfd39137e61344d1@mail.gmail.com>
In-Reply-To: <1cafab770903311911p63f962afybfd39137e61344d1@mail.gmail.com>
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
To: linux-lvm@redhat.com

Xinwei Hu wrote:
> Hi all,
> 
>     All calls to dlm_release_lockspace in clvmd-corosync.c use
> force=0. This may cause the problem when
> the node is the "lock master" of lockspace, the lockspace won't be
> release then, and there'll be no any error
> information from libdlm.
> 
>     Issues' found and analysied by Lars Marowsky-Bree and David Teigland.
> 
>     The patch tries to call dlm_release_lockspace with force = 1 in all cases.
> 
>     Please consider it for inclusion.


You're right (as usual). Force should also be set to 1 for consistency
with clvmd-cman.

The patch is now in CVS

Thank you.

Chrissie
