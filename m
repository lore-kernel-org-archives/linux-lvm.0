Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p6Q2jQOq003922
	for <linux-lvm@redhat.com>; Mon, 25 Jul 2011 22:45:26 -0400
Received: from mail-qy0-f181.google.com (mail-qy0-f181.google.com
	[209.85.216.181])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6Q2jPQe013668
	for <linux-lvm@redhat.com>; Mon, 25 Jul 2011 22:45:25 -0400
Received: by qyk9 with SMTP id 9so1638qyk.12
	for <linux-lvm@redhat.com>; Mon, 25 Jul 2011 19:45:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAGRgLy6-ba=REk=RcOFAW7W3R3pu-eizRC1wWPZUcfBb=iML7Q@mail.gmail.com>
References: <CAGRgLy6xQKgLM+_WA7REuYxD-gQCi6QpJTEc_Ka6W=p5oyO4hg@mail.gmail.com>
	<CAGRgLy6-ba=REk=RcOFAW7W3R3pu-eizRC1wWPZUcfBb=iML7Q@mail.gmail.com>
Date: Tue, 26 Jul 2011 08:15:25 +0530
Message-ID: <CALHAVFz8v1-WwYGu7+PLW1w84werJvU8kf9wy7YkwKXUvHM=3g@mail.gmail.com>
From: Prathyush <prathyush.r@gmail.com>
Content-Type: multipart/alternative; boundary=0016e64f920a80530404a8efec68
Subject: Re: [linux-lvm] lvm_lv_deactivate seems to have no effect,
 LV is still available in lvdisplay
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

--0016e64f920a80530404a8efec68
Content-Type: text/plain; charset=ISO-8859-1

Hi,

Hope its not dismounted properly .
Do a resize2fs again and lvchange -an

Regards
Prathyush

On Sun, Jul 24, 2011 at 1:17 PM, Alexander Lyakas <alex.bolshoy@gmail.com>wrote:

> OK, since nobody answered, let me perhaps ask a different question.
>
> Is there any way to prevent any automatic LV activation/deactivation?
> And have full manual control via lvm_lv_deactivate/lvm_lv_activate?
>
> Setting activation = 0 in global section of lvm.conf did not do the
> job, because then lvm_vg_create_lv_linear fails, so I even cannot
> create a LV.
>
> Thanks,
>   Alex.
>
>
> On Tue, Jul 19, 2011 at 5:14 PM, Alexander Lyakas
> <alex.bolshoy@gmail.com> wrote:
> >
> > Hello everybody,
> > I am using stock ubuntu natty with lvmlib 2.02.66:
> > root@11:/mnt/work/alex# uname -a
> > Linux 11 2.6.38-8-server #42-Ubuntu SMP Mon Apr 11 03:49:04 UTC 2011
> > x86_64 x86_64 x86_64 GNU/Linux
> >
> > In my code I open a VG, iterate over all the LVs and then call
> > lvm_lv_deactivate() on each LV. The return value is 0, and also
> > immediately after that, I call lvm_lv_is_active() for each LV and
> > assert that it returns 0 (not-active).
> > Later in the code, I close the VG handle.
> >
> > However, when I issue lvdisplay from command-line, I still see:
> > LV Status              available
> > and the dm device files for the LVs are also present (/dev/dm-0 etc).
> >
> > As a result I cannot later stop the underlying md devices (PVs) using
> > 'mdadm --stop'.
> > If I do lvchange -an from the command line later, it succeeds, LV
> > status becomes 'NOT available' and I am able to stop the md arrays.
> >
> > From looking at the code of lvmlib, it looks like lvm_lv_deactivate()
> > does not require lvm_vg_write(); I see that lvchange implementation
> > does not seem to call this when de-activating LVs. Still, I have tried
> > to call lvm_vg_write() with same effect.
> >
> > No other application on the machine uses the same VG (at least not
> > that I know of).
> >
> > Can anybody please advise what I might be missing.
> >
> > Thanks,
> >  Alex.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>



-- 
*Regards,
Prathyush*

--0016e64f920a80530404a8efec68
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,<br><br>Hope its not dismounted properly . <br>Do a resize2fs again and =
lvchange -an <br><br>Regards<br>Prathyush<br><br><div class=3D"gmail_quote"=
>On Sun, Jul 24, 2011 at 1:17 PM, Alexander Lyakas <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:alex.bolshoy@gmail.com">alex.bolshoy@gmail.com</a>&gt;</spa=
n> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex;">OK, since nobody answered, let me perhaps a=
sk a different question.<br>
<br>
Is there any way to prevent any automatic LV activation/deactivation?<br>
And have full manual control via lvm_lv_deactivate/lvm_lv_activate?<br>
<br>
Setting activation =3D 0 in global section of lvm.conf did not do the<br>
job, because then lvm_vg_create_lv_linear fails, so I even cannot<br>
create a LV.<br>
<br>
Thanks,<br>
 =A0 Alex.<br>
<div><div></div><div class=3D"h5"><br>
<br>
On Tue, Jul 19, 2011 at 5:14 PM, Alexander Lyakas<br>
&lt;<a href=3D"mailto:alex.bolshoy@gmail.com">alex.bolshoy@gmail.com</a>&gt=
; wrote:<br>
&gt;<br>
&gt; Hello everybody,<br>
&gt; I am using stock ubuntu natty with lvmlib 2.02.66:<br>
&gt; root@11:/mnt/work/alex# uname -a<br>
&gt; Linux 11 2.6.38-8-server #42-Ubuntu SMP Mon Apr 11 03:49:04 UTC 2011<b=
r>
&gt; x86_64 x86_64 x86_64 GNU/Linux<br>
&gt;<br>
&gt; In my code I open a VG, iterate over all the LVs and then call<br>
&gt; lvm_lv_deactivate() on each LV. The return value is 0, and also<br>
&gt; immediately after that, I call lvm_lv_is_active() for each LV and<br>
&gt; assert that it returns 0 (not-active).<br>
&gt; Later in the code, I close the VG handle.<br>
&gt;<br>
&gt; However, when I issue lvdisplay from command-line, I still see:<br>
&gt; LV Status =A0 =A0 =A0 =A0 =A0 =A0 =A0available<br>
&gt; and the dm device files for the LVs are also present (/dev/dm-0 etc).<=
br>
&gt;<br>
&gt; As a result I cannot later stop the underlying md devices (PVs) using<=
br>
&gt; &#39;mdadm --stop&#39;.<br>
&gt; If I do lvchange -an from the command line later, it succeeds, LV<br>
&gt; status becomes &#39;NOT available&#39; and I am able to stop the md ar=
rays.<br>
&gt;<br>
&gt; From looking at the code of lvmlib, it looks like lvm_lv_deactivate()<=
br>
&gt; does not require lvm_vg_write(); I see that lvchange implementation<br=
>
&gt; does not seem to call this when de-activating LVs. Still, I have tried=
<br>
&gt; to call lvm_vg_write() with same effect.<br>
&gt;<br>
&gt; No other application on the machine uses the same VG (at least not<br>
&gt; that I know of).<br>
&gt;<br>
&gt; Can anybody please advise what I might be missing.<br>
&gt;<br>
&gt; Thanks,<br>
&gt; =A0Alex.<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><i style=3D=
"font-family:garamond,serif"><b><span style=3D"color:rgb(153, 153, 0)">Rega=
rds,</span><br style=3D"color:rgb(153, 153, 0)"><span style=3D"color:rgb(15=
3, 153, 0)">Prathyush</span></b></i><br>


--0016e64f920a80530404a8efec68--
