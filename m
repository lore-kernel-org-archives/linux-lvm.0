Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i36DmFj00318
	for <linux-lvm@redhat.com>; Tue, 6 Apr 2004 09:48:15 -0400
Received: from host1.appws.com ([216.136.72.3])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i36DmD5D007151
	for <linux-lvm@redhat.com>; Tue, 6 Apr 2004 09:48:14 -0400
Received: from grandmother.littlebald.com (localhost.localdomain [127.0.0.1])
	by grandmother.littlebald.com (8.12.8/8.12.8) with ESMTP id
	i36Dm3bq015215
	for <linux-lvm@redhat.com>; Tue, 6 Apr 2004 09:48:03 -0400
Received: (from david@localhost)
	by grandmother.littlebald.com (8.12.8/8.12.8/Submit) id i36Dm3W3015213
	for linux-lvm@redhat.com; Tue, 6 Apr 2004 09:48:03 -0400
Subject: Re: [linux-lvm] Converting the root filesystem to ReiserFS on LVM...
From: David Johnston <david@littlebald.com>
In-Reply-To: <40717062.6050401@alteeve.com>
References: <40717062.6050401@alteeve.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1081259282.14982.2.camel@grandmother.littlebald.com>
Mime-Version: 1.0
Date: 06 Apr 2004 09:48:03 -0400
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Mon, 2004-04-05 at 10:42, Madison Kelly wrote:
> Hi all,
> 
> I am officially stumped... 
> When I use the FC1 cd I can't unmount '/mnt/sysimage' which is seen 
> as the LVM device '/dev/VG00/LV00', it keeps saying the device or 
> resource is busy
> Under Fedora the devices I need to mount are on:
> /dev/VG00/LV00 = '/' (currently ext3)
> /dev/VG00/LV01 = '/backup' (reiserfs)
> /dev/VG00/LV02 = '/snapshot' (reiserfs)

Madison,
do you by any chance have /mnt/sysimage/backup or /mnt/sysimage/snapshot
mounted when you get the "resource busy" error?
-- 
David Johnston <david@littlebald.com>
Little Bald Consulting, LLC
