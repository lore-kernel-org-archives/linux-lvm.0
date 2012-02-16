Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q1GE6Hvr021403
	for <linux-lvm@redhat.com>; Thu, 16 Feb 2012 09:06:17 -0500
Received: from mail-qw0-f53.google.com (mail-qw0-f53.google.com
	[209.85.216.53])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q1GE68db021293
	for <linux-lvm@redhat.com>; Thu, 16 Feb 2012 09:06:08 -0500
Received: by qafk1 with SMTP id k1so2453799qaf.12
	for <linux-lvm@redhat.com>; Thu, 16 Feb 2012 06:06:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20120216135702.GA6212@redhat.com>
References: <4F3D03AE.2050502@mohawksoft.com>
	<20120216135702.GA6212@redhat.com>
From: Marco Pizzoli <marco.pizzoli@gmail.com>
Date: Thu, 16 Feb 2012 15:05:48 +0100
Message-ID: <CAMrrtwsmZPmOqBL4Z4bDb66HQ1x0cYq32NsuDdc6uxy_Oy_bqQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary=00248c7118f965d61104b9155498
Subject: Re: [linux-lvm] Snapshots
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--00248c7118f965d61104b9155498
Content-Type: text/plain; charset=ISO-8859-1

Hi Mike

On Thu, Feb 16, 2012 at 2:57 PM, Mike Snitzer <snitzer@redhat.com> wrote:

> On Thu, Feb 16 2012 at  8:25am -0500,
> Mark Woodward <markw@mohawksoft.com> wrote:
>
> > I have been looking into LVM2 for a while now and while I think it
> > is useful for a range of applications, its seems pretty limited in
> > overall scope.
> >
> > Is there any active development happening? Most of the code seems
> > like bug-fixes or minor tweaks. Is the snapshot system being
> > improved? Specifically, snapshots of snapshots? thin provisioned
> > snapshots or auto-expand (i.e. snapshots don't run out of space).
> > If you look at technologies like ZFS snapshots are far better
> > supported, but ZFS will probably never be real under Linux, and it
> > really is far more than is really needed.
> >
> > So, I guess my questions are these: Is LVM in maintenance mode or is
> > there active development? If it is being actively developed, is
> > there a road map and is there a group or site specifically dedicated
> > to the development?
>
> Um, where are you even getting this idea that LVM2 is in maintenance
> mode?  Or that snapshots haven't improved?
>
> Sorry to come off defensive but your entire post is founded on incorrect
> understanding.
>
> Anyway, if you look at the change history of the lvm2 repository (be it
> cvs or git, cvs commits are mirrored to git) you'll see there have been
> regular changes flowing in and most recently a very extensive evolution
> of the code to add support for thin provisioning with highly efficient
> snapshots (ala btrfs or ZFS).
>
> try: git clone git://sources.redhat.com/git/lvm2
>

Please, could you tell me if is there a gitweb interface somewhere?

Thanks
Marco

--00248c7118f965d61104b9155498
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Mike<br><br><div class=3D"gmail_quote">On Thu, Feb 16, 2012 at 2:57 PM, =
Mike Snitzer <span dir=3D"ltr">&lt;<a href=3D"mailto:snitzer@redhat.com">sn=
itzer@redhat.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">

<div class=3D"im">On Thu, Feb 16 2012 at =A08:25am -0500,<br>
Mark Woodward &lt;<a href=3D"mailto:markw@mohawksoft.com">markw@mohawksoft.=
com</a>&gt; wrote:<br>
<br>
&gt; I have been looking into LVM2 for a while now and while I think it<br>
&gt; is useful for a range of applications, its seems pretty limited in<br>
&gt; overall scope.<br>
&gt;<br>
&gt; Is there any active development happening? Most of the code seems<br>
&gt; like bug-fixes or minor tweaks. Is the snapshot system being<br>
&gt; improved? Specifically, snapshots of snapshots? thin provisioned<br>
&gt; snapshots or auto-expand (i.e. snapshots don&#39;t run out of space).<=
br>
&gt; If you look at technologies like ZFS snapshots are far better<br>
&gt; supported, but ZFS will probably never be real under Linux, and it<br>
&gt; really is far more than is really needed.<br>
&gt;<br>
&gt; So, I guess my questions are these: Is LVM in maintenance mode or is<b=
r>
&gt; there active development? If it is being actively developed, is<br>
&gt; there a road map and is there a group or site specifically dedicated<b=
r>
&gt; to the development?<br>
<br>
</div>Um, where are you even getting this idea that LVM2 is in maintenance<=
br>
mode? =A0Or that snapshots haven&#39;t improved?<br>
<br>
Sorry to come off defensive but your entire post is founded on incorrect<br=
>
understanding.<br>
<br>
Anyway, if you look at the change history of the lvm2 repository (be it<br>
cvs or git, cvs commits are mirrored to git) you&#39;ll see there have been=
<br>
regular changes flowing in and most recently a very extensive evolution<br>
of the code to add support for thin provisioning with highly efficient<br>
snapshots (ala btrfs or ZFS).<br>
<br>
try: git clone git://<a href=3D"http://sources.redhat.com/git/lvm2" target=
=3D"_blank">sources.redhat.com/git/lvm2</a><br></blockquote><div><br>Please=
, could you tell me if is there a gitweb interface somewhere?<br><br>Thanks=
<br>

Marco<br></div></div><br>

--00248c7118f965d61104b9155498--
