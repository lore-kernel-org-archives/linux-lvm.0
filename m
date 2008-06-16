Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5GJcbET023374
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 15:38:37 -0400
Received: from rv-out-0506.google.com (rv-out-0506.google.com [209.85.198.235])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m5GJcNmg013938
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 15:38:24 -0400
Received: by rv-out-0506.google.com with SMTP id f6so5555665rvb.51
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 12:38:23 -0700 (PDT)
Message-ID: <a71bd89a0806161238l6bb44670tca9e4b0b9635154a@mail.gmail.com>
Date: Mon, 16 Jun 2008 12:38:23 -0700
From: "Dan Kegel" <dank@kegel.com>
Sender: daniel.r.kegel@gmail.com
Subject: Re: [linux-lvm] Server hangs when writing to LVM volume due to LVM
	Snapshots
In-Reply-To: <4856BC88.4060602@wpkg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20080616135319.GA29234@campbell-lange.net>
	<4856715A.6050107@wpkg.org> <20080616141907.GH3765@campbell-lange.net>
	<48567DF8.7080600@wpkg.org> <20080616151014.GJ3765@campbell-lange.net>
	<4856BC88.4060602@wpkg.org>
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

On Mon, Jun 16, 2008 at 12:18 PM, Tomasz Chmielewski <mangoo@wpkg.org> wrote:
> LVM-2 doesn't scale very well.
>
> If you have I/O intensive workloads, I'd discourage using (multiple)
> snapshots.
>
> A single write to the origin mean additional writes to each and every
> snapshot of that origin.

Right.  This is one of the things zumastor.org snapshots do better;
all snapshots for a volume share a common snapshot store,
so performance doesn't fall as you add more snapshots.
You might want to have a look at it... join the zumastor
mailing list or drop in on our irc if you have questions.
- Dan

p.s.
> Tomasz Chmielewski
> http://wpkg.org

wpkg.org looks very cool.  I haven't used it much yet,
but I hope to use it as a kind of automated real world test of
wine sometime.
