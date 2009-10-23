Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9NFcusV013419
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 11:38:56 -0400
Received: from fg-out-1718.google.com (fg-out-1718.google.com [72.14.220.157])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9NFcdT3005300
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 11:38:40 -0400
Received: by fg-out-1718.google.com with SMTP id d23so266057fga.9
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 08:38:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <f6d6a910910230803g54c095bbwe1c4df66573f8678@mail.gmail.com>
References: <f6d6a910910230803g54c095bbwe1c4df66573f8678@mail.gmail.com>
Date: Fri, 23 Oct 2009 17:38:39 +0200
Message-ID: <29ae894c0910230838o755803d9td6211d953ac343e5@mail.gmail.com>
Subject: Re: [linux-lvm] How do I use free PE?
From: brem belguebli <brem.belguebli@gmail.com>
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

Hi,

your underlying disk /dev/sdb2 cannot be part of more than one volume
group, it'll have to be under VolGroup00.

When you say I don't want to add it to VolGroup00, you may be
confusing some concepts.

You certainly don't want to add free space under / (which is a
filesystem) on top of a Logical Volume (LogVol0) which itself is built
on top of your VolGroup00, isn't it ?

If so, you can create a new Logical volume (let's say
logvolgeneralstorage, man lvcreate) on top of VolGroup00 which will be
mounted on /otherstroragethanslash.

Everything is in the man pages (lvcreate, lvs, lvdisplay, mke[234]fs, fstab)

2009/10/23 Rod Rook <rod.rook@gmail.com>:
> I've installed Fedora 10 on a 250GB SATA hard drive.
> I want to use the unused portion (free PE= 4378, about 140GB), but I don't
> know how I go about doing it.
> I don't want to add it to VolGroup00, but I want it made accessible as a
> general storage space.
>
>>
>> [root@localhost Documents]# pvdisplay /dev/sdb2
>
> � --- Physical volume ---
> � PV Name�������������� /dev/sdb2
> � VG Name�������������� VolGroup00
> � PV Size�������������� 232.69 GB / not usable 4.58 MB
> � Allocatable���������� yes
> � PE Size (KByte)������ 32768
> � Total PE������������� 7446
> � Free PE�������������� 4376
> � Allocated PE��������� 3070
>>
>> � PV UUID�������������� DBf14Y-SLFe-cwZy-m1O7-3Jw9-Xhdf-3u42iX
>>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
