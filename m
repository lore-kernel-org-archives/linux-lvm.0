Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i36Gjlj29496
	for <linux-lvm@redhat.com>; Tue, 6 Apr 2004 12:45:47 -0400
Received: from magic.alttech.com ([207.13.196.227])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i36Gjj5D012897
	for <linux-lvm@redhat.com>; Tue, 6 Apr 2004 12:45:45 -0400
Received: from dogberry.ossmann.com (magic.alttech.com [64.140.60.35])
	by magic.alttech.com (Postfix) with ESMTP id 210F92FE98
	for <linux-lvm@redhat.com>; Tue,  6 Apr 2004 10:46:56 -0600 (MDT)
Date: Tue, 6 Apr 2004 10:45:40 -0600
From: Michael Ossmann <mike@ossmann.com>
Subject: Re: [linux-lvm] Converting the root filesystem to ReiserFS on LVM...
Message-ID: <20040406164540.GB17338@ossmann.com>
References: <40717062.6050401@alteeve.com>
	<1081259282.14982.2.camel@grandmother.littlebald.com>
	<4072BB82.4020706@alteeve.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4072BB82.4020706@alteeve.com>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Apr 06, 2004 at 10:15:30AM -0400, Madison Kelly wrote:
> 
> I am trying now to figure out how to properly use 'chroot /mnt/sysimage' 
> followed by 'lvcreate_initrd' to write a new boot loaded but despit 
> double checking that the file name was right Grub still fails to find 
> the file...

Can you post your grub.conf and an ls of your boot
filesystem?

mossmann
