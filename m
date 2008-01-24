Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0ODJPtX006131
	for <linux-lvm@redhat.com>; Thu, 24 Jan 2008 08:19:25 -0500
Received: from rv-out-0910.google.com (rv-out-0910.google.com [209.85.198.191])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0ODIxvY004290
	for <linux-lvm@redhat.com>; Thu, 24 Jan 2008 08:19:00 -0500
Received: by rv-out-0910.google.com with SMTP id k15so215536rvb.51
	for <linux-lvm@redhat.com>; Thu, 24 Jan 2008 05:18:59 -0800 (PST)
Message-ID: <a71bd89a0801240518i78f9d5fcj6173f663931fff55@mail.gmail.com>
Date: Thu, 24 Jan 2008 05:18:58 -0800
From: "Dan Kegel" <dank@kegel.com>
Sender: daniel.r.kegel@gmail.com
Subject: Re: [linux-lvm] Re: [RFC] Multiple Snapshots - Manageability problem
In-Reply-To: <4798705C.4080802@wpkg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <4797686A.4000306@wpkg.org>
	<a71bd89a0801231436k3653acfw9bd0a63f027daacf@mail.gmail.com>
	<4798705C.4080802@wpkg.org>
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
Cc: dm-devel@redhat.com

Tomasz Chmielewski <mangoo@wpkg.org> wrote:
> Dan Kegel schrieb:
> > Yes.  Dan Phillips has implemented a shared snapshot exception store.
> > You can try it out now if you like; it's at http://zumastor.org.
> > It feels a bit different from the user's point of view than LVM, though.
> > It plays well with the device mapper and can be used with any
> > block device (LVM or non-LVM).
>
> Does it use device mapper (or it just "plays well with the device
> mapper")? Or is it a totally different technology?

It is a device mapper target, so yeah, it uses device mapper.

> I didn't find it explained very clearly in Zumastor HOWTO on
> http://zumastor.googlecode.com/svn/trunk/doc/zumastor-howto.html (other
> than pointers to /dev/mapper/zumatest, which probably means it uses
> device mapper).

A little further down the page, http://zumastor.org links to
http://zumastor.googlecode.com/svn/trunk/doc/desimplnotes.html
which does mention it explicitly.
- Dan
