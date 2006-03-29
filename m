Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k2TLTsgN025255
	for <linux-lvm@redhat.com>; Wed, 29 Mar 2006 16:29:54 -0500
Received: from bud.tessco.com (bud.Tessco.Com [72.164.90.12])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k2TLTrPk016754
	for <linux-lvm@redhat.com>; Wed, 29 Mar 2006 16:29:53 -0500
Received: from [10.30.10.28] by tessco.com (PMDF V6.2-1x9 #31130)
	with ESMTP id <01M0MTLC76YK8XEF6T@tessco.com> for linux-lvm@redhat.com;
	Wed, 29 Mar 2006 16:29:47 -0500 (EST)
Date: Wed, 29 Mar 2006 16:29:46 -0500
From: Tom Callahan <callahant@tessco.com>
Subject: Re: [linux-lvm] LVM data recovery ?
In-reply-to: <4429F11D.8010404@netopia.pt>
Message-id: <442AFC4A.4040600@tessco.com>
MIME-version: 1.0
Content-transfer-encoding: 7bit
References: <4429F11D.8010404@netopia.pt>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

You may be able to mount the LVM LV's on another system....

I'd take some dd backups just in case, and then try attaching the drives 
to another system.

pvscan to see if it finds the PV's
then vgscan to find the VG's

vgchange -a y will then activate them...but be careful. If the same 
VG/LV names are present on the new system, you'll have to use some 
renaming trickery to get them to actually show up.

Thanks,

Tom Callahan
TESSCO Technologies
Desk: (410)-229-1361
Cell: (410)-588-7605
Email: callahant@tessco.com

A real engineer only resorts to documentation when the keyboard dents on the forehead get too noticeable.



Miguel Bettencourt Dias (Netopia) wrote:

>
> Hi All,
>
> I've been reading the arquives and didn't find an answer to my problem 
> and I was wondering how data recovery could be done... because I have 
> a server that crashed quite badly. It did not have lvm backups from 
> /etc/lvm/archive/ and I wanted to recover the LVM.
>
> I only have two partitions, sda1 and sda2.
> sda1 is the /boot. sda2 is LVM, with swap and / (the machine runs 
> fedora core 4)with root inside the LVM... now I know that's a bad ideia.
>
> The problem is that I don't have any backups of any LVM information and
> all I know is the size of the partitions inside LVM...
>
> Adding 2031608k swap on /dev/VolGroup00/LogVol01.  Priority:-1 
> extents:1 across:2031608k
>
> Filesystem           1K-blocks      Used Available Use% Mounted on
> /dev/mapper/VolGroup00-LogVol00
>                       32963596  24207464   8756132  74% /
> /dev/sda1               101086     56597     39270  60% /boot
> /dev/shm               1037328         0   1037328   0% /dev/shm
>
>
> can I conceivably recover the data ? how ?
>
>
> regards,
> miguel dias
>
>
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
