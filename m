Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r4V3bua7001157
	for <linux-lvm@redhat.com>; Thu, 30 May 2013 23:37:56 -0400
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r4V3bsGL019737
	for <linux-lvm@redhat.com>; Thu, 30 May 2013 23:37:54 -0400
Received: by mail-ie0-f173.google.com with SMTP id k13so2704052iea.18
	for <linux-lvm@redhat.com>; Thu, 30 May 2013 20:37:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAEh524ZjZRizYoEimXg0OsLxz2kD8HLu2bqw2V2RbjYKdggVxw@mail.gmail.com>
References: <51A7BE6D.3090609@gmail.com>
	<1369952053.99499.YahooMailClassic@web181504.mail.ne1.yahoo.com>
	<CAEh524ZjZRizYoEimXg0OsLxz2kD8HLu2bqw2V2RbjYKdggVxw@mail.gmail.com>
Date: Thu, 30 May 2013 20:37:54 -0700
Message-ID: <CAEh524ZaPCWidwO6n8RukzDVBpWw9ENAu=X5gLysV-AopYRQag@mail.gmail.com>
From: Christian Lahti <clahti@gmail.com>
Content-Type: multipart/alternative; boundary=047d7bdc186a17bc1504ddfb5751
Subject: [linux-lvm] Fwd: file-based locking initialization failed after
	pvresize
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
To: linux-lvm@redhat.com

--047d7bdc186a17bc1504ddfb5751
Content-Type: text/plain; charset=ISO-8859-1

Sorry forgot to copy the list.

---------- Forwarded message ----------
From: Christian Lahti <clahti@gmail.com>
Date: Thu, May 30, 2013 at 8:36 PM
Subject: Re: [linux-lvm] file-based locking initialization failed after
pvresize
To: matthew patton <pattonme@yahoo.com>


Thank you for your reply, I realize that I must have done something rather
bone-headed and I am usually pretty clued.  That being said I am still in
the same pickle I was in to begin with, something constructive would be
fantastically appreciated.  If there were proper documentation *anywhere*
google-able I would not have bothered the mailing list.  I am pretty sure
the data must be in tact since this was done in single user mode and no
writes to the disk/volume have occurred since the two commands were run, I
have /etc/lvm in tact with information prior to and after the event.  If
someone would be so kind as to please let me know exactly what information
they might need, I will do my level best with minimum "back and forth" to
provide such information to get out of said pickle.  And I furthermore
promise not to do it again.

/Christian



On Thu, May 30, 2013 at 3:14 PM, matthew patton <pattonme@yahoo.com> wrote:

> What's with people and "extending" disks? DO NOT DO THAT!!!! But if you
> do, then you can't forget to do all the rest of the necessary steps. You
> have to fix the partition table. And you have to make sure your PVresize
> doesn't run off the end of the media. Is VMware's 250G really 250G when
> probed by PVscan? Doubt it very much.
>
> Next time don't partition disks for starters. And "grow" filesystems by
> ADDing disks and adding them to the volume group and then resize2fs. Just
> because Windows was written for dummies and lets you get away with what you
> did, doesn't mean you should attempt it in Linux if you don't know what
> you're doing.
>

--047d7bdc186a17bc1504ddfb5751
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Sorry forgot to copy the list.<br><br><div class=3D"gmail_=
quote">---------- Forwarded message ----------<br>From: <b class=3D"gmail_s=
endername">Christian Lahti</b> <span dir=3D"ltr">&lt;<a href=3D"mailto:clah=
ti@gmail.com">clahti@gmail.com</a>&gt;</span><br>
Date: Thu, May 30, 2013 at 8:36 PM<br>Subject: Re: [linux-lvm] file-based l=
ocking initialization failed after pvresize<br>To: matthew patton &lt;<a hr=
ef=3D"mailto:pattonme@yahoo.com">pattonme@yahoo.com</a>&gt;<br><br><br><div=
 dir=3D"ltr">
Thank you for your reply, I realize that I must have done something rather =
bone-headed and I am usually pretty clued. =A0That being said I am still in=
 the same pickle I was in to begin with, something constructive would be fa=
ntastically appreciated. =A0If there were proper documentation *anywhere* g=
oogle-able I would not have bothered the mailing list. =A0I am pretty sure =
the data must be in tact since this was done in single user mode and no wri=
tes to the disk/volume have occurred since the two commands were run, I hav=
e /etc/lvm in tact with information prior to and after the event. =A0If som=
eone would be so kind as to please let me know exactly what information the=
y might need, I will do my level best with minimum &quot;back and forth&quo=
t; to provide such information to get out of said pickle. =A0And I furtherm=
ore promise not to do it again.<span class=3D"HOEnZb"><font color=3D"#88888=
8"><div>

<br></div><div>/Christian</div><div><br></div></font></span></div><div clas=
s=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail_extra"><br><br><div clas=
s=3D"gmail_quote">On Thu, May 30, 2013 at 3:14 PM, matthew patton <span dir=
=3D"ltr">&lt;<a href=3D"mailto:pattonme@yahoo.com" target=3D"_blank">patton=
me@yahoo.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">What&#39;s with people and &quot;extending&q=
uot; disks? DO NOT DO THAT!!!! But if you do, then you can&#39;t forget to =
do all the rest of the necessary steps. You have to fix the partition table=
. And you have to make sure your PVresize doesn&#39;t run off the end of th=
e media. Is VMware&#39;s 250G really 250G when probed by PVscan? Doubt it v=
ery much.<br>


<br>
Next time don&#39;t partition disks for starters. And &quot;grow&quot; file=
systems by ADDing disks and adding them to the volume group and then resize=
2fs. Just because Windows was written for dummies and lets you get away wit=
h what you did, doesn&#39;t mean you should attempt it in Linux if you don&=
#39;t know what you&#39;re doing.<br>


</blockquote></div><br></div>
</div></div></div><br></div>

--047d7bdc186a17bc1504ddfb5751--
