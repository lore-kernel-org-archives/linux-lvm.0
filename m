Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j8FG2sV03997
	for <linux-lvm@redhat.com>; Thu, 15 Sep 2005 12:02:54 -0400
Received: from gwia-smtp.id2.novell.com
	(public.id2-vpn.continvity.gns.novell.com [195.33.99.129])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j8FG2njR029808
	for <linux-lvm@redhat.com>; Thu, 15 Sep 2005 12:02:50 -0400
Message-ID: <43299B1A.3090200@novell.com>
Date: Thu, 15 Sep 2005 18:02:34 +0200
From: Fabian Herschel <fabian.herschel@novell.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Device mapper problems..
References: <432986DA.50107@gmail.com>
In-Reply-To: <432986DA.50107@gmail.com>
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
To: suleyman.kutlu@gmail.com, LVM general discussion and development <linux-lvm@redhat.com>

You have a look which device path is used when mounting your both file
systems (using mount).
Than you can have a look at the major and minor device number of these
devices (using ls -la).
If these devices are using the same major/minor combination the kernel
assumes these devices
the be the same. This would show the effects you mentioned.

ls -la /dev/mapper/*
brw-------  1 root root 253, 3 Jun 21 16:09 /dev/mapper/rootvg-homlv
brw-------  1 root root 253, 2 Jun 21 16:09 /dev/mapper/rootvg-optlv

in this case rootvg-homlv has major 253 and minor 3, while rootvg-optlv
has major 253 and minor 2.

best regards
Fabian Herschel


Suleyman Kutlu schrieb:

> Hello all,
>
>
> I have an AMD-64 machine running SuSE 9.2. I have one SATA disk (for
> now, will add another later on) and a VG on it. I have created some LVs.
>
> Sometimes later, I realized that when I mount an LV (say lv_a) I see
> the directory structure of another LV (say lv_b). If I issue a df -k,
> I see a wrong size for lv_a, it is the size of lv_b. But in lvdisplay
> output, the size for lv_a is correct.
>
> The file systems on lv_a and lv_b is JFS.
>
> /mnt is mounted as lv_b
> /mnt2 is mounted as lv_a but has contents of lv_b
>
>
> I thought that, filesystem structure is corrupted and started to work
> on some filesystem level utilities, but later I see that,
> another filesystem pair also got the same problem.
>
>
> So I think it is a problem in device-mapper level, not the filesystem
> level.
>
> What can be the possible works to get what is wrong and how to fix ?
> If the corruption is at filesystem level, do you have any experience
> on JFS-utils ? I just want to see what was stored in lv_a, what I lost
> in lv_a...
>
>
> I am new at device-mapper, I don't have enough experience on it and I
> do not want to loose everything while there is something that can be
> recovered...
>
> Any help is appreciated.
>
> Thanks and regards..
>
> * Suleyman Kutlu
> * mailto: suleyman.kutlu@gmail.com
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
