Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qA2BTrnY016358
	for <linux-lvm@redhat.com>; Fri, 2 Nov 2012 07:29:53 -0400
Received: from awh1.active.ee (alfa.active.ee [194.204.30.36])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qA2BTpk1027578
	for <linux-lvm@redhat.com>; Fri, 2 Nov 2012 07:29:52 -0400
Mime-Version: 1.0 (Apple Message framework v1283)
From: Andres Toomsalu <andres@active.ee>
In-Reply-To: <5093AC7B.6060902@redhat.com>
Date: Fri, 2 Nov 2012 13:29:49 +0200
Message-Id: <1C149BFE-6622-4DCF-A354-ABA28A7DC91B@active.ee>
References: <73698D91-B8D4-4F52-ABF3-54542ACB0690@active.ee>
	<5093A260.8000906@redhat.com>
	<71E4DE75-6510-4E4E-B31F-CAEF0CF36771@active.ee>
	<5093AC7B.6060902@redhat.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] strange usage stats for thin LV
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Apparently that does not work - FITRIM ioctl not backported to RHEL6 kernel perhaps?

fstrim -v /backup
fstrim: /backup: FITRIM ioctl failed: Operation not supported

df -h
/dev/mapper/VolGroupL0-thin_backup 591G  104G  458G  19% /backup

mount (added discard option today)
/dev/mapper/VolGroupL0-thin_backup on /backup type ext4 (rw,discard)

Cheers,
-- 
----------------------------------------------
Andres Toomsalu
On 02.11.2012, at 13:20, Zdenek Kabelac wrote:

> Dne 2.11.2012 11:46, Andres Toomsalu napsal(a):
>> Thanks a lot for a detailed explanation - now everything fits into places :)
>> 
>> Some answers:
>> 
>> 1) Filesystem in use is ext4 at all cases
>> 2) Im not using discard option as Im not very aware how to use it  - is it a filesystem mount option for fstab?
>> 3) OS is CentOS 6.3 with RHEL OpenVZ patched kernel (2.6.32-042stab061.2 #1 SMP Fri Aug 24 09:07:21 MSK 2012 x86_64 x86_64 x86_64 GNU/Linux)
>> 
> 
> So check for  'fstrim' command - it's usage is quite simple, and should be already pretty matured tool.
> 
> i.e. you could run it once a week in cron.
> 
> Zdenek
> 
> 
> 
