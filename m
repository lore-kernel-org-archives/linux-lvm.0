Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o177w5cF008901
	for <linux-lvm@redhat.com>; Sun, 7 Feb 2010 02:58:05 -0500
Received: from maude.comedia.it (maude.comedia.it [77.93.254.181])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o177vqSM027115
	for <linux-lvm@redhat.com>; Sun, 7 Feb 2010 02:57:53 -0500
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id AC52E870F3
	for <linux-lvm@redhat.com>; Sun,  7 Feb 2010 08:57:51 +0100 (CET)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id 4umHecQOVajG for <linux-lvm@redhat.com>;
	Sun,  7 Feb 2010 08:57:51 +0100 (CET)
Date: Sun, 7 Feb 2010 08:57:51 +0100
From: Luca Berra <bluca@comedia.it>
Message-ID: <20100207075751.GB468@maude.comedia.it>
References: <4B6CC8ED.2070107@alteeve.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4B6CC8ED.2070107@alteeve.com>
Subject: Re: [linux-lvm] pvscan connect() failed on local socket:	Connection
	refused
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Fri, Feb 05, 2010 at 08:42:05PM -0500, Madison Kelly wrote:
> Hi all,
>
>   I've got a two-node Xen cluster I am trying to setup with a DRBD 
> partition under an LVM pv. My layout is:
>
> * Both node's hard drive is a PV used by one VG.
> * Each node has the host OS  (dom0) install on an LV using a small portion 
> of the available space.
> * The majority of the space is assigned to an LV on either node that DRBD 
> uses.
> * The DRBD partition is itself setup as a new PV.
>
>   The problem is; Once I setup '/dev/drbd0' as a VG, I had to enable 
> cluster-aware mode by changing lvm.conf to:
>
I'm not sure what you are trying to achieve there.
Active-Active drbd as shared storage???

> [root@an_san02 ~]# pvscan
>   connect() failed on local socket: Connection refused
>   WARNING: Falling back to local file-based locking.
>   Volume Groups with the clustered attribute will be inaccessible.
>   PV /dev/drbd0                      lvm2 [399.99 GB]
>   Total: 1 [399.99 GB] / in use: 0 [0   ] / in no VG: 1 [399.99 GB]
sounds like the cluster daemon is not running

L.
-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \
