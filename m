Received: from [10.15.80.229] (dhcp80-229.msp.redhat.com [10.15.80.229])
	by pobox.corp.redhat.com (8.13.1/8.12.8) with ESMTP id kADG5dRS025303
	for <linux-lvm@redhat.com>; Mon, 13 Nov 2006 11:05:40 -0500
Mime-Version: 1.0 (Apple Message framework v624)
In-Reply-To: <902218.58339.qm@web51102.mail.yahoo.com>
References: <902218.58339.qm@web51102.mail.yahoo.com>
Message-Id: <cd2ce2ec22a65c5c76017de31d242c09@redhat.com>
Content-Transfer-Encoding: 7bit
From: Jonathan E Brassow <jbrassow@redhat.com>
Subject: Re: [linux-lvm] pvmove of lvs while filesystems mounted not
	supported?!?
Date: Mon, 13 Nov 2006 10:10:27 -0600
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

I've never tried it using LVM1, but I'm told it is safe.

  brassow

On Nov 13, 2006, at 7:47 AM, Dave wrote:

> Hi David & list readers,
>
> I am still stuck using LVM1 (1.0.8-14) on a RedHat AS3 system (kernel:
> 2.4.21-47.ELsmp) and may need to move all data from the existing disks 
> to a new set
> of disks.
>
> Can I safely use pvmove (under LVM1) to perform this action while the 
> file systems
> are mounted or not?  If not, are there other ways LVM can help move 
> all data to the
> new disks without having to unmount the file systems in use?
>
> Thanks,
> Dave
