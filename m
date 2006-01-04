Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k04APf124057
	for <linux-lvm@redhat.com>; Wed, 4 Jan 2006 05:25:41 -0500
Received: from mail.laferspa.com (host106-231.pool82188.interbusiness.it
	[82.188.231.106])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k04APPiq010822
	for <linux-lvm@redhat.com>; Wed, 4 Jan 2006 05:25:26 -0500
Message-ID: <43BBA500.7040205@email.it>
Date: Wed, 04 Jan 2006 11:35:44 +0100
From: Massimiliano <max.fontana@email.it>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How can I expand a physical volume ?
References: <43B39A85.7060107@email.it>
	<20051229214451.GB6629@percy.comedia.it>
In-Reply-To: <20051229214451.GB6629@percy.comedia.it>
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

Luca Berra ha scritto:

> On Thu, Dec 29, 2005 at 09:12:53AM +0100, Massimiliano wrote:
>
>> Hi !
>
>
> two ways, either create a new partition with the free space,
> pvcreate it and vgextend your volume group
> or
> edit your partition table and make the 2nd partition bigger.
> (you might need to reboot here)
> then

Did what you suggested (following the first solution) . Now vgdisplay 
shows me :
VG Name               VolGroup00
  System ID
  Format                lvm2
  Metadata Areas        2
  Metadata Sequence No  12
  VG Access             read/write
  VG Status             resizable
  MAX LV                0
  Cur LV                2
  Open LV               2
  Max PV                0
  Cur PV                2
  Act PV                2
  VG Size               203,34 GB
  PE Size               32,00 MB
  Total PE              6507
  Alloc PE / Size       4336 / 135,50 GB
  Free  PE / Size       2171 / 67,84 GB
  VG UUID               hVHrwV-Dt53-wbGa-ZwHQ-ZWcX-t5Tm-vQIVUu

How can I Allocate now the Free PE /Size ? The filesystem available 
space is still 135 GB...
Thanks
Max (Italy)
