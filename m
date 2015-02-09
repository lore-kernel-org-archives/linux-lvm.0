Received: from [10.34.131.16] (dhcp131-16.brq.redhat.com [10.34.131.16])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t199YmvV029662
	for <linux-lvm@redhat.com>; Mon, 9 Feb 2015 04:34:49 -0500
Message-ID: <54D87F38.4010303@redhat.com>
Date: Mon, 09 Feb 2015 10:34:48 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CAPcfVV_VVvYDf0oa7pZZ1iFkK6XJDBM4wYU9=EnYpCo4ogrbjQ@mail.gmail.com>
In-Reply-To: <CAPcfVV_VVvYDf0oa7pZZ1iFkK6XJDBM4wYU9=EnYpCo4ogrbjQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Volume group inconsistent
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 7.2.2015 v 16:47 Marcos Dutra napsal(a):
> Hi everybody,
>
> Yesterday some storage discs of my VG was with missing status
> /dev/mapper/plt-01                                        platinum       lvm2
> a-m  500.00g   24.95g
>    /dev/mapper/plt-02                                        platinum
> lvm2 a-m  500.00g   12.93g
>
> I tried recover the discs and I used the command:
> # vgextend --restoremissing platinum /dev/mapper/plt-01
>
> It worked, removing missing status, but I did a big mistake, i tried to run
> this command with multiple discs:
> # vgextend --restoremissing platinum /dev/mapper/plt-0[2-9]
>
> After that when I ran pvs command the output shows me checksum error:
>    /dev/mapper/plt-04: Checksum error
>    /dev/mapper/plt-06: Checksum error
>    /dev/mapper/plt-01: Checksum error
>    Couldn't read volume group metadata.
>    /dev/mapper/plt-02: Checksum error
>    Couldn't read volume group metadata.
>    /dev/mapper/plt-03: Checksum error
>
> I tried restore metadata without success:
> # vgcfgrestore -f platinum_02336-1600706364.vg
> <http://platinum_02336-1600706364.vg> platinum


Without having access to your current metadata - it's hard to give
proper advice.


So please attach  'vgcfgbackup' of your current setup.

Have you tried to 'extend' your existing vg   'plt' with referencing LVs from 
itself???
Is 'plt' VG ?

Zdenek
