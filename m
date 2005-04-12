Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3CKBOO07294
	for <linux-lvm@redhat.com>; Tue, 12 Apr 2005 16:11:24 -0400
Received: from percy.comedia.it (percy.comedia.it [212.97.59.71])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j3CKBI4d030765
	for <linux-lvm@redhat.com>; Tue, 12 Apr 2005 16:11:19 -0400
Date: Tue, 12 Apr 2005 22:11:16 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] invalid physical volume
Message-ID: <20050412201116.GD8673@percy.comedia.it>
References: <425B37D8.7060801@cjs226.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <425B37D8.7060801@cjs226.com>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Mon, Apr 11, 2005 at 09:52:08PM -0500, Clif Smith wrote:
>I'm running lvm-1.0.8-9 on RHES3 and am receiving the following when I 
>try to utilize a volume from an EMC array:
># pvcreate /dev/emcpowera
>pvcreate -- invalid physical volume "/dev/emcpowera"
>
>The OS sees the volume fine:
># fdisk -l /dev/emcpowera
>Disk /dev/emcpowera: 10.7 GB, 10737418240 bytes
>255 heads, 63 sectors/track, 1305 cylinders
>Units = cylinders of 16065 * 512 = 8225280 bytes
>
>I can create a partition and then a filesystem without issue, but I 
>really need to use it within LVM.
>
>Any ideas?
>

either ditch powerpath or modify the lvm1 source code to understand it,
second is not difficult, just look at the places where dac960 or ciss
support was implemented.

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
