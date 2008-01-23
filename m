Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0NMadh7027507
	for <linux-lvm@redhat.com>; Wed, 23 Jan 2008 17:36:39 -0500
Received: from rv-out-0910.google.com (rv-out-0910.google.com [209.85.198.186])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id m0NMaFmo025711
	for <linux-lvm@redhat.com>; Wed, 23 Jan 2008 17:36:16 -0500
Received: by rv-out-0910.google.com with SMTP id k15so2727532rvb.51
	for <linux-lvm@redhat.com>; Wed, 23 Jan 2008 14:36:14 -0800 (PST)
Message-ID: <a71bd89a0801231436k3653acfw9bd0a63f027daacf@mail.gmail.com>
Date: Wed, 23 Jan 2008 14:36:14 -0800
From: "Dan Kegel" <dank@kegel.com>
Sender: daniel.r.kegel@gmail.com
Subject: Re: [linux-lvm] Re: [RFC] Multiple Snapshots - Manageability problem
In-Reply-To: <4797686A.4000306@wpkg.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <4797686A.4000306@wpkg.org>
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

On Jan 23, 2008 8:16 AM, Tomasz Chmielewski <mangoo@wpkg.org> wrote:
> Vijai Babu Madhavan, Thu, 11 Jan 2007 11:18:13 -0700, wrote:
>
> > The problem of DM snapshots with multiple snapshots have been discussed
> > in the lists quiet a bit (Most recently @
> > https://www.redhat.com/archives/dm-devel/2006-October/msg00034.html).
> >
> > We are currently in the process of building a DM snapshot target that scales
> > well with many snapshots (so that the changed blocks don't get copied to each
> > snapshot). In this process, I would also like to validate an assumption.
>
> Any news on that?
>
> Still, with multiple snapshots write performance degrades linearly - is
> any work done to change that anytime soon?

Yes.  Dan Phillips has implemented a shared snapshot exception store.
You can try it out now if you like; it's at http://zumastor.org.
It feels a bit different from the user's point of view than LVM, though.
It plays well with the device mapper and can be used with any
block device (LVM or non-LVM).
- Dan
