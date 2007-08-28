Received: from [192.168.1.100] (vpn-248-115.boston.redhat.com [10.13.248.115])
	by pobox.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7SLhv1B015864
	for <linux-lvm@redhat.com>; Tue, 28 Aug 2007 17:43:59 -0400
Mime-Version: 1.0 (Apple Message framework v752.3)
In-Reply-To: <46D2910D.7050908@theendofthetunnel.de>
References: <46D2910D.7050908@theendofthetunnel.de>
Message-Id: <46E02D31-CD01-4184-9664-B727C16C9ABB@redhat.com>
Content-Transfer-Encoding: 7bit
From: Jonathan Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] Snapshot COW area on different PV / device
Date: Tue, 28 Aug 2007 16:40:08 -0500
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
Content-Type: text/plain; charset="us-ascii"; delsp="yes"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

you will need more than on device in your volume group.  Example:
$> pvcreate /dev/sd[ab]
$> vgcreate vg /dev/sd[ab]
$> lvcreate -n lv -L 200G vg /dev/sda
$> lvcreate -s -n snap -L 20G vg/lv /dev/sdb

The cow will be located on sdb, while the origin will be located on sda.

  brassow

On Aug 27, 2007, at 3:53 AM, Hannes Dorbath wrote:

> Hello,
>
> I suffer from massive I/O trashing, due to the snapshot COW area  
> being located on the same physical device as the origin. The  
> machine now has a second disk array, that I'd like to dedicate to  
> snapshot COW data. My problem now is that I fail to see from the  
> documentation how to create a snapshot, which has its COW area  
> located on another device. The setup currently looks like:
>
> VG     #PV #LV #SN Attr   VSize   VFree
> data     1   1   0 wz--c- 437.62G      0
> cow1     1   0   0 wz--c- 232.82G 232.82G
> cow2     1   0   0 wz--c- 232.82G 232.82G
>
> LV     VG     Attr   LSize   Origin Snap%  Move Log Copy%
> data   data   -wc-ao 437.62G
>
> data is the LV where production data is located, and the cow1 and  
> cow2 VGs should be used for snapshots. Can someone give me an  
> example on the lvcreate syntax to archive this? I tried various  
> things, but end up with error messages like "Could not fine LV  
> <foo> in PV <bar>".
>
> Thanks in advance.
>
>
> -- 
> Regards,
> Hannes Dorbath
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
