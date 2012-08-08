Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q787nqkT010276
	for <linux-lvm@redhat.com>; Wed, 8 Aug 2012 03:49:53 -0400
Received: from mail-bk0-f46.google.com (mail-bk0-f46.google.com
	[209.85.214.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q787noCN029919
	for <linux-lvm@redhat.com>; Wed, 8 Aug 2012 03:49:51 -0400
Received: by bkwj10 with SMTP id j10so179144bkw.33
	for <linux-lvm@redhat.com>; Wed, 08 Aug 2012 00:49:50 -0700 (PDT)
Received: by lagy9 with SMTP id y9so254717lag.33
	for <linux-lvm@redhat.com>; Wed, 08 Aug 2012 00:49:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAH+HAhxg1ArkSG0DguGj5OBvxwL4CRBZzV8HVUvYDo+wMrOsWg@mail.gmail.com>
References: <CAH+HAhxg1ArkSG0DguGj5OBvxwL4CRBZzV8HVUvYDo+wMrOsWg@mail.gmail.com>
From: Scott Merrilees <scott@merrilees.net>
Date: Wed, 8 Aug 2012 17:49:26 +1000
Message-ID: <CANN7Ug1vjrx9uNioay54pbMEEdtesvuptU7ngi8bckoyfB=AfA@mail.gmail.com>
Subject: Re: [linux-lvm] Translating device name from sar to a filesystem
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Try the following commands:

df -h
sudo  pvs -o +lv_name
ls -lL /dev/mapper /dev/sd*

which will allow you to map:
dev253-17 to /dev/mapper/vg-lv with device number 253, 17
dev8-0 to /dev/sda with device number 8, 0

then you can map these back up thru the lvm data provided by pvs,
and then up to file systems from df

--
Scott Merrilees


On Tue, Aug 7, 2012 at 11:18 PM, Reza Gholdor <gholdorreza@gmail.com> wrote:
> Hi All,
> I am a DBA trying to determine if I/O is a bottleneck for an Oracle 11g
> database running on RHEL 5.7 x64 on VmWare ESXi 4.1. I monitor disk activity
> using "sar -d" and get device names like dev8-0 and dev253-17. I have tried
> to translate these device names to filesystem names without succes. Can
> someone provide instructions on how to find filesystem build on a device
> name from "sar -d"? Are there any giudeline or better commands for
> determining if I/O is a bottleneck?
> Appreciate any help.
> Regards,
> Reza
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
