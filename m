Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0QMFTn2018640
	for <linux-lvm@redhat.com>; Mon, 26 Jan 2009 17:15:29 -0500
Received: from eu1sys200aog117.obsmtp.com (eu1sys200aog117.obsmtp.com
	[207.126.144.143])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id n0QMF54c022992
	for <linux-lvm@redhat.com>; Mon, 26 Jan 2009 17:15:06 -0500
Received: by fxm13 with SMTP id 13so1635092fxm.10
	for <linux-lvm@redhat.com>; Mon, 26 Jan 2009 14:15:05 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <f9d530070901260951t131a7291n17d57c62e14edf45@mail.gmail.com>
References: <20090120181112.5523a424@winsoft.fr>
	<f9d530070901260951t131a7291n17d57c62e14edf45@mail.gmail.com>
Date: Mon, 26 Jan 2009 23:15:04 +0100
Message-ID: <ab74ee140901261415n1f1f1453s2542bcb16c90c66f@mail.gmail.com>
Subject: Re: [linux-lvm] starting LVs on RAID stripe boundaries
From: Francois Cami <fcami@winsoft.fr>
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

Keeping stuff aligned on partitions requires playing with fdisk or parted b=
ut
I had already figured that out. In some cases it's better to do so than to =
use
the block device directly as PV.

Is there any way to see the current LVM metadata's size ?

Thanks for the feedback !

F


2009/1/26 unlisted <unlisted@gmail.com>:
> that sounds right... as long as your lvm PVs are entire disks and not ins=
ide
> of another partition.  I spend months trying to understand all this.
>
> Also, isn't your LVM metadata 192k ?
>
> Sam
>
> On Tue, Jan 20, 2009 at 9:11 AM, F-D. Cami <fcami@winsoft.fr> wrote:
>>
>> Hi Linux-LVM,
>>
>> I'm searching for some definitive information about how to make sure that
>> logical
>> volumes start exactly at the beginning of a RAID stripe.
>>
>> My hardware is an EMC Clariion CX3-40F array with a RHEL5 host.
>> The default stripe element size is 64 KB (128 blocks) on the CX3.
>>
>> Both EMC and Red Hat recommend using fdisk or parted  to align the first
>> partition
>> to the start of a stripe boundary (128th block, 128x512=3D64KB) :
>> Red Hat : http://kbase.redhat.com/faq/docs/DOC-2893
>> EMC : "EMC CLARiiON Best Practices", PDF available on emc.com
>>
>> After doing that. the first partition is now aligned, next I need to make
>> sure my logical
>> volumes are similarly aligned. However, after reading the LVM Howto on
>> tldp.org,
>> the LVM wiki at redhat.com, and Alasdair Kergon's LinuxTag presentation =
at
>> :
>> http://people.redhat.com/agk/talks/LVM2-LinuxTag2006/
>> I found no information on how to do that.
>>
>> I'll now use some reasonable (?) assumptions :
>> * the physical extent size is a multiple of 64K (vgcreate's default is
>> 4MB) ;
>> * if physical extents are aligned, logical volumes are themselves aligned
>>  (lvcreate -l, --extents LogicalExtentsNumber) ;
>> * since PV, VG and LV infos are stored in PV metadata, the only possible
>> PE
>>   misalignment culprit is PV metadata ;
>> * PV metadata size is a multiple of 64KB
>>  (
>> http://orezpraw.com/orezpraw.php/blogosphere/your-filesystem-starts-wher=
e )
>>
>> Since 64KB is my stripe size, and metadata size is a multiple of 64KB,
>> pvcreate should do the RightThing(tm) with default options, i.e. start t=
he
>> first PE at a multiple of the stripe size.
>>
>> In other words, aligning the partition the PV uses to the stripe boundary
>> and
>> using a PE size multiple of the stripe size insure that LVs get themselv=
es
>> created
>> on stripe boundaries.
>>
>> Comments, please ?
>>
>> Thanks,
>>
>> Fran=C3=A7ois Cami
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
