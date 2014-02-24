Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s1O3TVu8013759
	for <linux-lvm@redhat.com>; Sun, 23 Feb 2014 22:29:32 -0500
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s1O3TUgE030272
	for <linux-lvm@redhat.com>; Sun, 23 Feb 2014 22:29:31 -0500
Received: by mail-yk0-f172.google.com with SMTP id 200so13030903ykr.3
	for <linux-lvm@redhat.com>; Sun, 23 Feb 2014 19:29:30 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20140224031336.GB13829@localhost.localdomain>
References: <20140222071408.GA10598@localhost.localdomain>
	<CAAMCDed94+WJa5Ms9CG+gtxKmfzuWw39yHLD1uj2xXGa89J3ag@mail.gmail.com>
	<20140224031336.GB13829@localhost.localdomain>
From: Roger Heflin <rogerheflin@gmail.com>
Date: Sun, 23 Feb 2014 21:29:10 -0600
Message-ID: <CAAMCDeeR9QnRp=v724QRfPjtmq29=ZH3kyU0EoN++=0VmL-8HQ@mail.gmail.com>
Subject: Re: [linux-lvm] LV mirror extents on same physical device
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

This indicates that it "worked" that way on some versions rhel5 but
does not work that way on rhel6 in a number of versions.

https://bugzilla.redhat.com/show_bug.cgi?id=594525

I would suspect depending on exactly what version you are using that
it is a bug.

I know up to at least 5.7 there are some bad LVM bugs when you are
doing abnormal things (mirroring, pvmoves with lv with multiple
extents), there are probably other bugs I don't know about.

I would suggest unmirroring it, and just doing a straight pvmove to
the new device, mirroring it in the middle would just appear to
complicate things.


On Sun, Feb 23, 2014 at 9:13 PM, Julie Ashworth <ashworth@berkeley.edu> wrote:
>
> On 23-02-2014 20.16 -0600, Roger Heflin wrote:
>> If I am reading what I can find correctly - -alloc=anywhere defeats
>> the mirror code from attempting to put on 2 different physical
>> devices.
> ---end quoted text---
>
> -alloc=anywhere just refers to the logs, which isn't important at this point.
> best,
> Julie
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
