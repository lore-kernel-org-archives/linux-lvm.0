Received: from [10.33.0.40] (breeves.fab.redhat.com [10.33.0.40])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n6MDB5HS029556
	for <linux-lvm@redhat.com>; Wed, 22 Jul 2009 09:11:05 -0400
Subject: Re: [linux-lvm] Can't mount or run fdisk on an existing logical 
	volume, help!
From: "Bryn M. Reeves" <bmr@redhat.com>
In-Reply-To: <2473b43f0907211301m7e4092b3t8ccd496bb1371fe7@mail.gmail.com>
References: <2473b43f0907211255u7c116b1er9c3483bec2472cd@mail.gmail.com>
	<20090721195830.GA30206@esri.com>
	<2473b43f0907211301m7e4092b3t8ccd496bb1371fe7@mail.gmail.com>
Date: Wed, 22 Jul 2009 14:17:09 +0100
Message-Id: <1248268629.14407.132.camel@breeves.fab.redhat.com>
Mime-Version: 1.0
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 2009-07-21 at 14:01 -0600, Adam Olsen wrote:
> imgserv:/storage/# vgchange -ay
>   device-mapper: resume ioctl failed: Invalid argument
>   Unable to resume storage-storage (254:0)
>   1 logical volume(s) in volume group "storage" now active

Did something appear in dmesg right after the tools printed this
message? The failed ioctl should have left some more information about
the problem in the logs.

Before you ran this command did you notice any other error messages or
warning from the lvm2 tools about suspended devices?

Regards,
Bryn.
