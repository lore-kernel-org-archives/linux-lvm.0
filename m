Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9K9OFV05577
	for <linux-lvm@redhat.com>; Thu, 20 Oct 2005 05:24:15 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de
	[212.227.126.186])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j9K9O8Tv011289
	for <linux-lvm@redhat.com>; Thu, 20 Oct 2005 05:24:09 -0400
Message-ID: <43576233.8030605@gmx.net>
Date: Thu, 20 Oct 2005 11:24:03 +0200
From: Klaus Strebel <klaus.strebel@gmx.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] setting up LVM, lost everything with a typo
References: <80d985600510191907na711430v24a1fe95264ebd48@mail.gmail.com>
In-Reply-To: <80d985600510191907na711430v24a1fe95264ebd48@mail.gmail.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Craig Hagerman schrieb:
> ... vgchange can't help out....
> 
> % vgchange -a y media_vg
>   Couldn't find device with uuid 'ZHl4Ak-mGS4-wFlF-4neF-G1Ed-GxWB-C4Smj6'.
>   Couldn't find all physical volumes for volume group media_vg.
>   Couldn't find device with uuid 'ZHl4Ak-mGS4-wFlF-4neF-G1Ed-GxWB-C4Smj6'.
>   Couldn't find all physical volumes for volume group media_vg.
>   Unable to find volume group "media_vg"
> 
> ....vgdisplay can't see either disc (exact same story with lvdisplay)...
> 
> vgdisplay
>   Couldn't find device with uuid 'ZHl4Ak-mGS4-wFlF-4neF-G1Ed-GxWB-C4Smj6'.
>   Couldn't find all physical volumes for volume group media_vg.
>   Couldn't find device with uuid 'ZHl4Ak-mGS4-wFlF-4neF-G1Ed-GxWB-C4Smj6'.
>   Couldn't find all physical volumes for volume group media_vg.
>   Volume group "media_vg" doesn't exist
> 
> ... and pvdisplay gives me...
> 
> % pvdisplay
>   Couldn't find device with uuid 'ZHl4Ak-mGS4-wFlF-4neF-G1Ed-GxWB-C4Smj6'.
>   --- Physical volume ---
>   PV Name               /dev/sdb1
>   VG Name               media_vg
>   PV Size               233.75 GB / not usable 0
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              59841
>   Free PE               193
>   Allocated PE          59648
>   PV UUID               rlnV4y-B4eJ-Pyc0-RLJm-2Zbv-t04C-dxzU1A
 > ...

What says vgscan in debug mode (you need vgscan before doing a vgchange).

Ciao
Klaus
--
Klaus Strebel, Dipl.-Inform. (FH), mailto:klaus.strebel@gmx.net

/"\
\ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
/ \
