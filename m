Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5GMNlCx028085
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 18:23:47 -0400
Received: from yw-out-2324.google.com (yw-out-2324.google.com [74.125.46.31])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m5GMNMkh009891
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 18:23:34 -0400
Received: by yw-out-2324.google.com with SMTP id 5so2854989ywb.81
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 15:23:34 -0700 (PDT)
Message-ID: <a71bd89a0806161523n39705b1cwba3f551fc5707e32@mail.gmail.com>
Date: Mon, 16 Jun 2008 15:23:34 -0700
From: "Dan Kegel" <dank@kegel.com>
Sender: daniel.r.kegel@gmail.com
Subject: Re: [linux-lvm] Server hangs when writing to LVM volume due to LVM
	Snapshots
In-Reply-To: <4856C6E1.6080804@wpkg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20080616135319.GA29234@campbell-lange.net>
	<4856715A.6050107@wpkg.org> <20080616141907.GH3765@campbell-lange.net>
	<48567DF8.7080600@wpkg.org> <20080616151014.GJ3765@campbell-lange.net>
	<4856BC88.4060602@wpkg.org>
	<a71bd89a0806161238l6bb44670tca9e4b0b9635154a@mail.gmail.com>
	<4856C6E1.6080804@wpkg.org>
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

On Mon, Jun 16, 2008 at 1:02 PM, Tomasz Chmielewski <mangoo@wpkg.org> wrote:
> Speaking of Zumastor - is it equivalent (or just a part of something bigger)
> of still discussed, future LVM-3?

I think it's more like a preview of a small part of it
(e.g. improved COW scheme for snapshots).

> There was supposed to be a presentation titled "LVM3 Advanced Volume Manager
> for Linux" by Daniel Phillips on LinuxTag 2008 in May[1] - do you know if
> it's available anywhere (yet)?

He says he'll put the slides online in the next couple days.

See also the talk by the LVM2 maintainer there,
http://www.linuxtag.org/2008/de/conf/events/vp-events/vortragsdetails.html?talkid=75
(No, I don't know if his slides are online.)
I think he and Daniel are in violent agreement about
what LVM needs :-)
- Dan
