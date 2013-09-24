Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r8OFF1WA024212
	for <linux-lvm@redhat.com>; Tue, 24 Sep 2013 11:15:01 -0400
Received: from mail-yh0-f47.google.com (mail-yh0-f47.google.com
	[209.85.213.47])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8OFEwL6016830
	for <linux-lvm@redhat.com>; Tue, 24 Sep 2013 11:14:59 -0400
Received: by mail-yh0-f47.google.com with SMTP id l109so2030165yhq.34
	for <linux-lvm@redhat.com>; Tue, 24 Sep 2013 08:14:58 -0700 (PDT)
Message-ID: <5241AC6F.5030602@gmail.com>
Date: Tue, 24 Sep 2013 11:14:55 -0400
From: =?ISO-8859-15?Q?Jorge_F=E1bregas?= <jorge.fabregas@gmail.com>
MIME-Version: 1.0
References: <5238A190.2050000@gmail.com>
	<alpine.LFD.2.00.1309241512590.2049@localhost.localdomain>
In-Reply-To: <alpine.LFD.2.00.1309241512590.2049@localhost.localdomain>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] LVM & fstrim behaviour (Fedora 19)
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

On 09/24/2013 09:20 AM, Luk� Czerner wrote:
> I can confirm that fstrim on ext4 works as expected with loop image
> and I do not see behaviour described by Jorge. I'll try thinp as
> well to see what's going on.

Hi Luk�,

I'm sorry I forgot to update this thread.  Fstrim over LVM is working
totally fine.  After a bunch of updates and a restart it started working
for me again.  Now the issue is really with thin LVs for which I opened
a bugzilla last week:

https://bugzilla.redhat.com/show_bug.cgi?id=1009546

There you would see all the details (file sizes, package versions etc).
 I can recreate the problem 100% of the time.

Please let me know if you still need any more information.

Thanks,
Jorge
