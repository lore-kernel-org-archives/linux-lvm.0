Received: from [10.34.30.250] (dhcp-30-250.brq.redhat.com [10.34.30.250])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q4F8CqEA021829
	for <linux-lvm@redhat.com>; Tue, 15 May 2012 04:12:53 -0400
Message-ID: <4FB21004.9040905@redhat.com>
Date: Tue, 15 May 2012 10:12:52 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <5A672399-BC00-4545-B203-031056EC4CC2@linkfluence.net>
In-Reply-To: <5A672399-BC00-4545-B203-031056EC4CC2@linkfluence.net>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Device mapper does not really remove the references
 to removed LV.
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Dne 14.5.2012 19:37, Germain Maurice napsal(a):
> Hi everybody,
>
> I'm facing to some problems in my virtualization cluster and i need some help to prevent it occurring again.
>
> I know that LVM is not cluster aware and we have to use it with lot of caution.
> However, i have a shared LVM storage between 6 nodes. I use KVM hosts.

Hmm - if you are planing to build your own cluster - assuming you do not want 
to use lvm2 cluster support tools like clmvd - which needs advanced 
configuration) - you will need to write your own daemon, to watch out for 
locks and metadata changes.

>
> Two days ago i rebooted my whole cluster in order to get the same LVM metadata and the same dmsetup table over the cluster. That's ok.
>
> "vgck SATA6To" is ok.
>
> Right now, I have a problem when deleting an LV.
>
> On the node where the VM lives, i did the lvremove command (lv name : SATA6To/vm-306-disk-3), i have a good state of LVM :

You need to propagate such change around your cluster by your daemon - and you 
have to be quite carefully where have you activated such LV before doing lvremove.

lvremove is simple command which does not communicate with other nodes in your 
cluster to let them know something has changed - so you might find some 
inspiration in CLVMD and it's locking technique to distribute locks around the 
cluster.

>
> Any idea how to clear all references to the LV previously removed ?
>

Before you remove LV on any node - you have to make sure all nodes deactivated 
such LV.

IMHO I'd suggest to use clvmd - instead of programming new daemon...

Zdenek
