Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3KFnmp11151
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2004 11:49:48 -0400
Received: from superman.pns.networktel.net (mail.networktel.net
	[216.83.236.232])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i3KFnlMc032618
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2004 11:49:47 -0400
Received: from JERRY (216-107-103-155.wan.networktel.net [216.107.103.155])
	by superman.pns.networktel.net (8.12.9/8.12.6) with SMTP id
	i3KFnfx0006831
	for <linux-lvm@redhat.com>; Tue, 20 Apr 2004 15:49:43 GMT
	(envelope-from jerry@thomasappliance.com)
Message-ID: <002201c426ef$184daf00$6401a8c0@JERRY>
From: "Jerry Hardwick" <jerry@thomasappliance.com>
References: <20040420174154.7565e081.julien.combes@i-carre.net>
Subject: Re: [linux-lvm] Ext3, 2.4.26 and lvm snapshot
Date: Tue, 20 Apr 2004 11:49:41 -0400
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

    I WOULD LIKE TO CANCEL MY SUBSCRIPTION THE THIS EMAIL SERVICE. CAN
ANYONE TELL ME HOW IT IS ACCOMPLISHED?  YOUR HELP IS APPRECIATED
----- Original Message ----- 
From: "COMBES Julien (SSII) (VRAIE MELANIE), CETE Lyon/DI/ET/PAMELA"
<julien.combes@i-carre.net>
To: <linux-lvm@redhat.com>
Sent: Tuesday, April 20, 2004 11:41 AM
Subject: [linux-lvm] Ext3, 2.4.26 and lvm snapshot


> Hello,
>
> I have some trouble with lvm snapshot with a logical volume formated with
> ext3 file system on a linux 2.4.26. This logical volume is active and
> mounted. The snapshot is created correctly (with a command like this for
> example : lvcreate -L 100M -s -n lvsnap0 /dev/vg01/lv01). But when I try
> to mount it, I have this error :
>    mount: wrong fs type, bad option, bad superblock on
>    /dev/vgt01/tsnap01, or too many mounted file systems
> If I format this logical volume in ext2, I can use snapshot without
> problem.
>
> I searched on internet and I found some information but it let me
> confused. I found many informations about a VFS-patch which seems to be
> necessary, but I don't found this patch for a linux kernel 2.4.26 (I only
> found it for version up to 2.4.22).
>
> So I wonder if this patch is always necessary ?
> Do you have some links which can help me ?
>
> Regards,
> Julien
> P.S: Sorry for my english which isn't very good.
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
