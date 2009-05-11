Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n4BJNVUp030858
	for <linux-lvm@redhat.com>; Mon, 11 May 2009 15:23:31 -0400
Received: from fg-out-1718.google.com (fg-out-1718.google.com [72.14.220.157])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n4BJNH1T003301
	for <linux-lvm@redhat.com>; Mon, 11 May 2009 15:23:17 -0400
Received: by fg-out-1718.google.com with SMTP id e12so913684fga.7
	for <linux-lvm@redhat.com>; Mon, 11 May 2009 12:23:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1242062874.13505.387.camel@breeves.fab.redhat.com>
References: <f4f537b50905111017p4edc87ccl1d0eb2d71c834a58@mail.gmail.com> 
	<1242062874.13505.387.camel@breeves.fab.redhat.com>
From: Eugene Vilensky <evilensky@gmail.com>
Date: Mon, 11 May 2009 14:22:57 -0500
Message-ID: <f4f537b50905111222t46c9f2bdwa8239907af93a22e@mail.gmail.com>
Subject: Re: [linux-lvm] removing a missing vg
Content-Type: multipart/alternative; boundary=0016363b9ec80aba040469a7e972
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
To: LVM general discussion and development <linux-lvm@redhat.com>

--0016363b9ec80aba040469a7e972
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

>
>
> > I tried to remove some NetApp LUNs from a RHEL 4.6 system, and
> > originally stale mappings remained in multipath -ll which I was not
> > able to flush.  In production instance, I am unable to remove the
> > multipath mappings because the vg is missing.  How can I deactivate a
> > missing vg?
>
> dmsetup remove <device name>
>

on the LV device?

#dmsetup remove /dev/vgTEST/lvTEST
dm_task_set_name: Device /dev/vgTEST/lvTEST not found
Command failed


on the mpath device?

# dmsetup remove /dev/mpath/mpath1
device-mapper: remove ioctl failed: Device or resource busy
Command failed

In the future you probably want to unmount file systems, deactivate
> volume groups, delete kpartx mappings etc. and flush the multipath
> devices from the host before you delete the LUNs from the storage.
>
> This way everything on the Linux side can finish up cleanly and you
> aren't left with stale devices lying around.
>

Excellent advice.  I am hoping a KB article or the dm-multipath guide could
be expanded for all the steps?  I can't find much on 'removing devices' in
the 4.6 System Administration guide.

-Ev

--0016363b9ec80aba040469a7e972
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"borde=
r-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-le=
ft: 1ex;"><div class=3D"im"><br>
&gt; I tried to remove some NetApp LUNs from a RHEL 4.6 system, and<br>
&gt; originally stale mappings remained in multipath -ll which I was not<br=
>
&gt; able to flush. =A0In production instance, I am unable to remove the<br=
>
&gt; multipath mappings because the vg is missing. =A0How can I deactivate =
a<br>
&gt; missing vg?<br>
<br>
</div>dmsetup remove &lt;device name&gt;<br>
</blockquote><div><br>on the LV device?<br><br>#dmsetup remove /dev/vgTEST/=
lvTEST <br>dm_task_set_name: Device /dev/vgTEST/lvTEST not found<br>Command=
 failed<br><br><br>on the mpath device?<br><br># dmsetup remove /dev/mpath/=
mpath1 <br>

device-mapper: remove ioctl failed: Device or resource busy<br>Command fail=
ed<br><br></div><blockquote class=3D"gmail_quote" style=3D"border-left: 1px=
 solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">

In the future you probably want to unmount file systems, deactivate<br>
volume groups, delete kpartx mappings etc. and flush the multipath<br>
devices from the host before you delete the LUNs from the storage.<br>
<br>
This way everything on the Linux side can finish up cleanly and you<br>
aren&#39;t left with stale devices lying around.<br></blockquote><div><br>E=
xcellent advice.=A0 I am hoping a KB article or the dm-multipath guide coul=
d be expanded for all the steps?=A0 I can&#39;t find much on &#39;removing =
devices&#39; in the 4.6 System Administration guide.<br>

<br>-Ev<br><br>=A0</div></div>

--0016363b9ec80aba040469a7e972--
