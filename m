Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1E6ABi03997
	for <linux-lvm@redhat.com>; Sat, 14 Feb 2004 01:10:11 -0500
Received: from ecstasy.winternet.com (CPE-65-25-248-192.mn.rr.com [65.25.248.192])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1E6ABb32275
	for <linux-lvm@redhat.com>; Sat, 14 Feb 2004 01:10:11 -0500
Message-Id: <200402140619.i1E6JDs03680@ecstasy.winternet.com>
From: Ken Fuchs <kfuchs@winternet.com>
In-reply-to: <49849.129.33.49.251.1076733336.squirrel@www.fusion-hosting.net>
	(message from Chris Wells on Fri, 13 Feb 2004 23:35:36 -0500 (EST))
Subject: Re: [Fwd: [linux-lvm] Problems importing volume group]
References: <49849.129.33.49.251.1076733336.squirrel@www.fusion-hosting.net>
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Sat Feb 14 01:09:05 2004
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Chris Wells wrote:

>After exporting and before replacing the system drive and re-installing,
>Redhat.. my pvscan output was the following:

>pvscan -- reading all physical volumes (this may take a while...)
>pvscan -- inactive PV "/dev/hde"  is in EXPORTED VG "kbvg" [233.72 GB / 0
>free]
>pvscan -- inactive PV "/dev/hdf"  is in EXPORTED VG "kbvg" [167.62 GB / 32
>MB fr
>ee]
>pvscan -- total: 2 [401.44 GB] / in use: 2 [401.44 GB] / in no VG: 0 [0]

>Now of course I get:

>pvscan
>pvscan -- reading all physical volumes (this may take a while...)
>pvscan -- inactive PV "/dev/hde"  is in EXPORTED VG "kbvg" [0 / 0 free]
>pvscan -- inactive PV "/dev/hdf"  is in EXPORTED VG "kbvg" [0 / 0 free]
>pvscan -- total: 2 [37.46 MB] / in use: 2 [37.46 MB] / in no VG: 0 [0]

>This is VERY frightening :)  Someone please tell me there is a way to get
>to my data.. Any help appreciated..

The data should still be on extents of the physical volumes.  The
simplist course of action is reconstructing the LVM metadata.

In the worst case, the data should be recoverable from the physical
extents by using dd to copy them in the proper order to the logical
volume of another volume group or to a raw partition of another disk.

Sincerely,

Ken Fuchs <kfuchs@winternet.com>
