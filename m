Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1REZf113982
	for <linux-lvm@redhat.com>; Mon, 27 Feb 2006 09:35:41 -0500
Received: from aragorn.bbn.com (aragorn.bbn.com [128.33.0.62])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1REZest014806
	for <linux-lvm@redhat.com>; Mon, 27 Feb 2006 09:35:40 -0500
Received: from [128.89.72.74] (mgillen2.dsl.bbn.com [128.89.72.74])
	by aragorn.bbn.com (8.12.7/8.12.7) with ESMTP id k1REZYWT009006
	for <linux-lvm@redhat.com>; Mon, 27 Feb 2006 09:35:34 -0500 (EST)
Message-ID: <44030E36.5020902@mattgillen.net>
Date: Mon, 27 Feb 2006 09:35:34 -0500
From: Matthew Gillen <me@mattgillen.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Disk size reporting.
References: <4402E842.9070509@watford53.freeserve.co.uk>
	<4402EBFE.3080807@gmx.net>
In-Reply-To: <4402EBFE.3080807@gmx.net>
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

Klaus Strebel wrote:
> Hi Jim,
> 
> Jim Ford schrieb:
>> I think I've extended a logical volume correctly, but DF shows no change.
>>
>> lvs output:
>>  LV     VG     Attr   LSize   Origin Snap%  Move Copy%
>>  root   Ubuntu -wi-ao  25.13G
>>  swap_1 Ubuntu -wi-ao 656.00M
>>
>> df output:
>> Filesystem           1K-blocks      Used Available Use% Mounted on
>> /dev/mapper/Ubuntu-root
>>                      18715076   2909852  14854544  17% /
>> tmpfs                   112264         0    112264   0% /dev/shm
>> tmpfs                   112264     12588     99676  12%
>> /lib/modules/2.6.12-10-386/volatile
>> /dev/hda1               233335     19166    201721   9% /boot
>>
>> Have I extended my Ubuntu volume correctly, please?
>>
>> <sigh> Life was _so_ much simpler without lvm and udev! </sigh>
> You just extended your volume, not your filesystem, don't you ;-). I
> don't know, which filesystem Ubunto uses for root and if it's ext2/ext3,
> if they use the online-resize patches.
> 
> So, seak for into how to resize/extend the filesystem you use.

The LVM FAQ entry for "Extending a Logical Volume" even covers this issue, and
tells you how to do it for several filesystems:
http://tldp.org/HOWTO/LVM-HOWTO/extendlv.html

Matt
