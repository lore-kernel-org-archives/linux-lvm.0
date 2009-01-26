Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0QNjNsr011693
	for <linux-lvm@redhat.com>; Mon, 26 Jan 2009 18:45:23 -0500
Received: from mckesson.com (mailgw01.mckesson.com [143.112.144.27])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n0QNiL56005477
	for <linux-lvm@redhat.com>; Mon, 26 Jan 2009 18:44:22 -0500
From: "Allen, Jack" <Jack.Allen@mckesson.com>
Content-class: urn:content-classes:message
In-Reply-To: <ab74ee140901261433p4f3056d5wa55e601afbef9872@mail.gmail.com>
References: <4905EFD192EEDF4A9A19EEE98C32B7F70EC5207D@DBQV3005.na.corp.mckesson.com>
	<ab74ee140901261433p4f3056d5wa55e601afbef9872@mail.gmail.com>
Content-class: urn:content-classes:message
MIME-Version: 1.0
Subject: RE: [linux-lvm] Why is part of a PV not usable?
Date: Mon, 26 Jan 2009 17:43:00 -0600
Message-ID: <4905EFD192EEDF4A9A19EEE98C32B7F70EC52D0B@DBQV3005.na.corp.mckesson.com>
In-Reply-To: <ab74ee140901261433p4f3056d5wa55e601afbef9872@mail.gmail.com>
References: <4905EFD192EEDF4A9A19EEE98C32B7F70EC5207D@DBQV3005.na.corp.mckesson.com>
	<ab74ee140901261433p4f3056d5wa55e601afbef9872@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Thanks. I guess I have just always used a PE size or the default and the
PV size was just the right size, because this was the first time I had
seen this. This was on a customer's system that was connected to a SAN.

----
Jack Allen 

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Francois Cami
Sent: Monday, January 26, 2009 5:34 PM
To: LVM general discussion and development
Subject: Re: [linux-lvm] Why is part of a PV not usable?

Hi Jack,

Your PE size is 4096KB and your PV's size is 2559x4096KB+3.98 MB.
In other words, your PV's size is not an exact multiple of the PE size
and
all you lose is always less than the PE.
( http://tldp.org/HOWTO/LVM-HOWTO )

F


2009/1/26 Allen, Jack <Jack.Allen@mckesson.com>:
> Hello:
>         When I do "vgdisplay -v" or pvdisplay to see the PV, why is
part of
> the PV not usable?
>
>  --- Physical volume ---
>   PV Name               /dev/sdd1
>   VG Name               vg01
>   PV Size               10.00 GB / not usable 3.98 MB
>   Allocatable           yes
>   PE Size (KByte)       4096
>   Total PE              2559
>   Free PE               740
>   Allocated PE          1819
>   PV UUID               Q3LoGB-474h-ztit-HBA7-AUEX-OxpE-xoRo0J
>
> -----
> Thanks
> Jack Allen
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
