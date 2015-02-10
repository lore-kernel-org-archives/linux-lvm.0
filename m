Received: from [10.34.131.16] (dhcp131-16.brq.redhat.com [10.34.131.16])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1A9Sl7N015055
	for <linux-lvm@redhat.com>; Tue, 10 Feb 2015 04:28:48 -0500
Message-ID: <54D9CF4F.5060409@redhat.com>
Date: Tue, 10 Feb 2015 10:28:47 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <54D97C2C.2020602@gmail.com>
In-Reply-To: <54D97C2C.2020602@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] vgextend --restoremissing does not work.
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

Dne 10.2.2015 v 04:34 dE napsal(a):
> Hi!
>
> vgextend --restoremissing sdc_sdd /dev/sdc
>    Couldn't find device with uuid aHSXeM-P1H5-7epv-l1cu-DsCS-K7dC-10Aaco.
>    WARNING: PV /dev/sdc not found in VG sdc_sdd
>    No PV has been restored.
>
> The reason why I'm doing a --restoremissing, is because
>
> Couldn't find device with uuid aHSXeM-P1H5-7epv-l1cu-DsCS-K7dC-10Aaco.


Are you sure  PV signature on  '/dev/sdc' contains your missing uuid
from your volume group  'sdc_sdd' ?

Attach  'pvs' output.

If you want to just 'add'  /dev/sdc to your VG - skip --restoremissing option.

Regards

Zdenek
