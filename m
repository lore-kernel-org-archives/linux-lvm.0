Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBA71vkh010222
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 10 Dec 2016 02:01:57 -0500
Received: from smtp1.dds.nl (smtp1.dds.nl [83.96.147.43])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 565907F7CE
	for <linux-lvm@redhat.com>; Sat, 10 Dec 2016 07:01:54 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id 983B535CA9
	for <linux-lvm@redhat.com>; Sat, 10 Dec 2016 08:01:52 +0100 (CET)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sat, 10 Dec 2016 08:01:52 +0100
From: Xen <list@xenhideout.nl>
In-Reply-To: <efb9fde8-8120-7098-1784-b9a72e6987f7@gmail.com>
References: <efb9fde8-8120-7098-1784-b9a72e6987f7@gmail.com>
Message-ID: <5f3dc6e2d38d3d4dfddf6728302769a6@xenhideout.nl>
Subject: Re: [linux-lvm] pvcreate: vfat signature detected on /dev/sda5
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
To: linux-lvm@redhat.com

John L. Poole schreef op 10-12-2016 4:35:

>    zeta jlpoole # pvcreate /dev/sda5
>    WARNING: vfat signature detected on /dev/sda5 at offset 54. Wipe it? 
> [y/n]: n
>      Aborted wiping of vfat.
>      1 existing signature left on the device.
>      Aborting pvcreate on /dev/sda5.
>    zeta jlpoole #
> 
> Is the warning something I need to be concerned about when
> creating a physical volume on /dev/sda5?  I'm wondering if it was
> looking at another
> partition and bubbling up just as a precaution.

I am assuming this is a pretty standard thing; and nothing you need to 
worry about. If you wanted to be sure, you could create a dd of the 2nd 
partition, or of the first 131 MB.

Then after PV create you could do a diff on the saved data and the real 
data still on disk, but I am going to assume -- as a layman -- that LVM 
is not messing up the messages; it is really talking about sda5, and 
there is nothing going to happen. I encounter spurious signatures all 
the time, most of the time I do not even worry how it got there.

Regards.
