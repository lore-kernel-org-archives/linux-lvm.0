Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAMMgdu2005456
	for <linux-lvm@redhat.com>; Wed, 22 Nov 2006 17:42:39 -0500
Received: from smtp01.nagra.com (smtp01.nagra.com [212.249.41.203])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id kAMMgWPg021287
	for <linux-lvm@redhat.com>; Wed, 22 Nov 2006 17:42:32 -0500
Received: from smtp01.nagra.com (localhost.localdomain [127.0.0.1])
	by localhost.nagra.com (Postfix) with ESMTP id 6DDB2268003
	for <linux-lvm@redhat.com>; Wed, 22 Nov 2006 23:42:31 +0100 (CET)
Received: from aten.hq.k.grp (unknown [172.31.239.42])
	by smtp01.nagra.com (Postfix) with ESMTP id 6234C268001
	for <linux-lvm@redhat.com>; Wed, 22 Nov 2006 23:42:31 +0100 (CET)
From: Martial Paupe <martial.paupe@nagra.com>
Subject: Re: [linux-lvm] Big question ...
Date: Wed, 22 Nov 2006 23:43:15 +0100
References: <200611222304.28368.martial.paupe@nagra.com>
	<4564CF3F.1060009@redhat.com>
In-Reply-To: <4564CF3F.1060009@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200611222343.16722.martial.paupe@nagra.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello Bryn,

On Wednesday 22 November 2006 23:29, Bryn M. Reeves wrote:
I think that you speak about LVM2. I use RHES 3.5 and the version of lvm are 
lvm-1.0.8-14.


> Hello Martial,
>
> You should be able to remove a PV from a volume group with vgreduce even
> when it is inactive, as long as the PV is still present on the system:
>
> [root ~]# vgchange -an s0
> � 0 logical volume(s) in volume group "s0" now active
> [root ~]# vgreduce s0 /dev/loop1
> � Removed "/dev/loop1" from volume group "s0"

vgchange -an VG_vobs
vgchange -- volume group "VG_vobs" successfully deactivated

 vgreduce VG_vobs /dev/emcpowera1
vgreduce -- ERROR: volume group "VG_vobs" doesn't exist
>
> If the PV is no longer present, this won't work though:
>
> [root ~]# losetup -d /dev/loop1
> [root ~]# vgreduce s0 /dev/loop1
> � Couldn't find device with uuid 'Tzx4n9-iA60-yu3U-9oRe-R0jh-RBb4-Sw8EmF'.
> � Couldn't find all physical volumes for volume group s0.
> � Couldn't find device with uuid 'Tzx4n9-iA60-yu3U-9oRe-R0jh-RBb4-Sw8EmF'.
> � Couldn't find all physical volumes for volume group s0.
> � Volume group "s0" doesn't exist
>
> In this case, you can make the volume group consistent again with
> "--removemissing":
 I don't have this option. I can't do that

>
> [root ~]# vgreduce --removemissing s0
> � Couldn't find device with uuid 'Tzx4n9-iA60-yu3U-9oRe-R0jh-RBb4-Sw8EmF'.
> � Couldn't find all physical volumes for volume group s0.
> � Couldn't find device with uuid 'Tzx4n9-iA60-yu3U-9oRe-R0jh-RBb4-Sw8EmF'.
> � Couldn't find all physical volumes for volume group s0.
> � Couldn't find device with uuid 'Tzx4n9-iA60-yu3U-9oRe-R0jh-RBb4-Sw8EmF'.
> � Wrote out consistent volume group s0
>
> Be aware though that if the PV you want to remove was actually in use
> you risk loosing whatever data was stored on it by this method - if
> possible get the PV back on the system and use the normal vgreduce.
>
> If this doesn't help then it would be useful to know what versions of
> LVM2 and device-mapper you are using and what distribution this is on.
-- 
Martial Paupe
Kudelski Group
[D] +41 21 732 04 55
[E] martial.paupe<AT>nagra.com
