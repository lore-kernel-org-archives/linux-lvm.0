Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l6UEeTRq008017
	for <linux-lvm@redhat.com>; Mon, 30 Jul 2007 10:40:29 -0400
Received: from mail1.wpi.edu (MAIL1.WPI.EDU [130.215.36.91])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l6UEeQJL000438
	for <linux-lvm@redhat.com>; Mon, 30 Jul 2007 10:40:26 -0400
Received: from mcafee.wpi.edu (MCAFEE.WPI.EDU [130.215.36.86])
	by mail1.wpi.edu (8.14.1/8.14.1) with SMTP id l6UEe4hY003338
	for <linux-lvm@redhat.com>; Mon, 30 Jul 2007 10:40:04 -0400
Received: from UTILITY4.WPI.EDU (UTILITY4.WPI.EDU [130.215.36.218])
	by SMTP.WPI.EDU (8.13.8/8.13.8) with ESMTP id l6UEe4g9020587
	for <linux-lvm@redhat.com>; Mon, 30 Jul 2007 10:40:04 -0400
	(envelope-from kastein@wpi.edu)
Received: from webmail.wpi.edu (localhost.localdomain [127.0.0.1])
	by UTILITY4.WPI.EDU (8.14.1/8.14.1) with ESMTP id l6UEe4m1020150
	for <linux-lvm@redhat.com>; Mon, 30 Jul 2007 10:40:04 -0400
Message-ID: <51989.192.52.57.33.1185806404.squirrel@webmail.wpi.edu>
In-Reply-To: <46A8FF67.1070405@redhat.com>
References: <63576.192.52.57.33.1185480057.squirrel@webmail.wpi.edu>
	<46A8FF67.1070405@redhat.com>
Date: Mon, 30 Jul 2007 10:40:04 -0400 (EDT)
Subject: Re: [linux-lvm] libLVM progress?
From: "Ken Stein" <kastein@WPI.EDU>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: linux-lvm@redhat.com

> You'd be better off using the existing liblvm2cmd library. This gives
> you a programmatic interface to the command line toolset. It will still
> mean formatting commandlines/parsing returns but it cuts down on your
> forking and allows the library to cache LVM2 internal data across
> command invocations - potentially, that amounts to a big saving.
>
> See doc/example_cmdlib.c in the LVM2 sources for a short example program.

Thanks. Doesn't look too extensive, but it is far better documentation
than some of the closed source I've worked with had.  Along with the
liblvm2cmd header file documentation I think I'll be fine.

> Not a good idea - there's too much complexity involved and duplicating
> that in separate projects would lead to something pretty unmaintainable
> quite quickly.

That's pretty much what I figured, thanks for verifying this.  I've worked
with enough complex, mostly-undocumented, redundant code to know that it
is a Bad Idea (tm) to create more Frankensteins unless it is the only way
possible to support something.

I'm going to see if I can do a bit of code exploration and documentation
in the lib directory, I can't guarantee how much time I'll have to spend
on it though.

Ken Stein @ kastein@wpi.edu
WPI ECE Class of 2008
