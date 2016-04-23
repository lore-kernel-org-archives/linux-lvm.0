Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3NIAPrR010330
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sat, 23 Apr 2016 14:10:25 -0400
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5A4FD85538
	for <linux-lvm@redhat.com>; Sat, 23 Apr 2016 18:10:22 +0000 (UTC)
Received: by mail-ig0-f169.google.com with SMTP id bi2so37233813igb.0
	for <linux-lvm@redhat.com>; Sat, 23 Apr 2016 11:10:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4b0d651386c11fdb2808a9f4bb88fc36@dds.nl>
References: <4b0d651386c11fdb2808a9f4bb88fc36@dds.nl>
Date: Sat, 23 Apr 2016 12:10:21 -0600
Message-ID: <CAFDa5Q2qAxQDzCRLaepjijJDinG6QzUHZo-7BVDscC06R-mZzw@mail.gmail.com>
From: Dax Kelson <dkelson@gurulabs.com>
Content-Type: multipart/alternative; boundary=14dae93b57d653d36405312adb15
Subject: Re: [linux-lvm] is lvmcache really ready?
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

--14dae93b57d653d36405312adb15
Content-Type: text/plain; charset=UTF-8

I don't always write emails, but when I do, it's a stream of consciousness.

We use LVM Cache in production in the infrastructure hosting our online
classroom environment. The read requests hitting our origin LV dropped by
90%. We're pretty happy with it.

I wish you could have multiple origin LVs using the same cache pool.

Dax Kelson
On Apr 23, 2016 10:54 AM, "Xen" <list@xenhideout.nl> wrote:

> Attempting to join this list, but the web interface is down.
>
> I am interested in using lvmcache but I hear the performance is very
> meagre, that was a thread from 2014 that I was reading. But a recent blog
> post said the same:
>
> https://www.rath.org/ssd-caching-under-linux.html
>
> This guy tries first lvmcache and performance is not noticable. Then he
> uses bcache and it works like a charm.
>
> He was using regular partitions on regular disks. Nothing raid going on.
> But he tried to increase boot speeds and did not notice anything.
>
> Setting the promote adjustments to zero made no difference.
>
> Is this feature defunct? I mean, is this really a usable and functional
> thing? From what it seems, I think not.
>
> I'll have a small mSATA SSD to test with shortly, but... if this thing is
> so bugged that it keeps reading from the origin device anyway, there's not
> much point to it.
>
> The reason I'm wanting to use it at this point is to speed up booting
> (although unimportant) but mostly to make a more snappy system while
> running, ie. for instance just application startup.
>
> At the same time that would decouple my system from my data by using that
> small SSD for the system (by way of the cache) such that system seeks do
> not any longer effect the performance of other operations on the device
> (that also holds that 'data').
>
> It don't mind having writeback for this because any (small) delay in
> writing to the origin would work well with this strategy.
>
> Some IO is buffered anyway and you might think with 8GB of RAM you could
> have some IO buffering normally, but a cache is something that buffers
> between reboots, so to speak.
>
> I'm simply trying to see what improvements I can get with LVM.
>
>
>
> That aside, I think it is annoying that on Debian systems and Ubuntu and
> Kubuntu, thin-provisioning-tools is still not included by default, and you
> also need to create that initramfs hook to have the files included into the
> initramfs. Then, Grub2 also does not support thin LVM volumes at all and
> although you can boot fine on a thin root, grub-probe will not be able to
> process these volumes, complain, and exit.
>
> Personally I think snapshotting on thin is much more usable, if that's
> what you want to use. No necessity to allocate sufficiently-sized volumes
> in advance. I tried to ask on #lvm but they were not helpful.
>
> I don't really get why LVM is being so neglected other than the popularity
> of btrfs these days.
>
> LVM is much more modular and very easy to work with normally. Commands
> make sense for the most part and the only thing that is missing is a nice
> gui.
>
> (I was even writing... some snapshot to incremental backup script at some
> point).
>
> LVM is one of the saner things still existing in Linux from my
> perspective, even if it doesn't feel perfect, but that is more due to the
> fact that you are using software emulation of partitions in a way that
> kinda tries to "avoid" having to do it in "firmware" -- in that sense that
> you are trying to do what regular partitions can't.
>
> Someone called this "deferred design" I believe.
>
> Because of this fact I believe it cannot really actually fully work out
> (for me) I believe particularly when it comes to cross-platformness and
> encryption as, in the same way, I prefer a firmware/bios environment for
> managing RAID arrays rather than just software.
>
> At the same time with UEFI et al. my opinion is just the reverse: let the
> boot loader please be software in some way. Even if it's a menu. At least
> you can adjust your software, the firmware you might not have a say about.
>
> Deferred design, when Linux tools do everything a regular computer
> firmware environment should. And then they created UEFI and tried to take
> stuff away that does belong to the operating system.
>
> While not creating anything that would work better except for GPT disks.
>
> I just want to ask a question though about thin LVM, but I will ask in
> another email.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--14dae93b57d653d36405312adb15
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">I don&#39;t always write emails, but when I do, it&#39;s a s=
tream of consciousness.</p>
<p dir=3D"ltr">We use LVM Cache in production in the infrastructure hosting=
 our online classroom environment. The read requests hitting our origin LV =
dropped by 90%. We&#39;re pretty happy with it.</p>
<p dir=3D"ltr">I wish you could have multiple origin LVs using the same cac=
he pool.</p>
<p dir=3D"ltr">Dax Kelson</p>
<div class=3D"gmail_quote">On Apr 23, 2016 10:54 AM, &quot;Xen&quot; &lt;<a=
 href=3D"mailto:list@xenhideout.nl">list@xenhideout.nl</a>&gt; wrote:<br ty=
pe=3D"attribution"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">Attempting to join this l=
ist, but the web interface is down.<br>
<br>
I am interested in using lvmcache but I hear the performance is very meagre=
, that was a thread from 2014 that I was reading. But a recent blog post sa=
id the same:<br>
<br>
<a href=3D"https://www.rath.org/ssd-caching-under-linux.html" rel=3D"norefe=
rrer" target=3D"_blank">https://www.rath.org/ssd-caching-under-linux.html</=
a><br>
<br>
This guy tries first lvmcache and performance is not noticable. Then he use=
s bcache and it works like a charm.<br>
<br>
He was using regular partitions on regular disks. Nothing raid going on. Bu=
t he tried to increase boot speeds and did not notice anything.<br>
<br>
Setting the promote adjustments to zero made no difference.<br>
<br>
Is this feature defunct? I mean, is this really a usable and functional thi=
ng? From what it seems, I think not.<br>
<br>
I&#39;ll have a small mSATA SSD to test with shortly, but... if this thing =
is so bugged that it keeps reading from the origin device anyway, there&#39=
;s not much point to it.<br>
<br>
The reason I&#39;m wanting to use it at this point is to speed up booting (=
although unimportant) but mostly to make a more snappy system while running=
, ie. for instance just application startup.<br>
<br>
At the same time that would decouple my system from my data by using that s=
mall SSD for the system (by way of the cache) such that system seeks do not=
 any longer effect the performance of other operations on the device (that =
also holds that &#39;data&#39;).<br>
<br>
It don&#39;t mind having writeback for this because any (small) delay in wr=
iting to the origin would work well with this strategy.<br>
<br>
Some IO is buffered anyway and you might think with 8GB of RAM you could ha=
ve some IO buffering normally, but a cache is something that buffers betwee=
n reboots, so to speak.<br>
<br>
I&#39;m simply trying to see what improvements I can get with LVM.<br>
<br>
<br>
<br>
That aside, I think it is annoying that on Debian systems and Ubuntu and Ku=
buntu, thin-provisioning-tools is still not included by default, and you al=
so need to create that initramfs hook to have the files included into the i=
nitramfs. Then, Grub2 also does not support thin LVM volumes at all and alt=
hough you can boot fine on a thin root, grub-probe will not be able to proc=
ess these volumes, complain, and exit.<br>
<br>
Personally I think snapshotting on thin is much more usable, if that&#39;s =
what you want to use. No necessity to allocate sufficiently-sized volumes i=
n advance. I tried to ask on #lvm but they were not helpful.<br>
<br>
I don&#39;t really get why LVM is being so neglected other than the popular=
ity of btrfs these days.<br>
<br>
LVM is much more modular and very easy to work with normally. Commands make=
 sense for the most part and the only thing that is missing is a nice gui.<=
br>
<br>
(I was even writing... some snapshot to incremental backup script at some p=
oint).<br>
<br>
LVM is one of the saner things still existing in Linux from my perspective,=
 even if it doesn&#39;t feel perfect, but that is more due to the fact that=
 you are using software emulation of partitions in a way that kinda tries t=
o &quot;avoid&quot; having to do it in &quot;firmware&quot; -- in that sens=
e that you are trying to do what regular partitions can&#39;t.<br>
<br>
Someone called this &quot;deferred design&quot; I believe.<br>
<br>
Because of this fact I believe it cannot really actually fully work out (fo=
r me) I believe particularly when it comes to cross-platformness and encryp=
tion as, in the same way, I prefer a firmware/bios environment for managing=
 RAID arrays rather than just software.<br>
<br>
At the same time with UEFI et al. my opinion is just the reverse: let the b=
oot loader please be software in some way. Even if it&#39;s a menu. At leas=
t you can adjust your software, the firmware you might not have a say about=
.<br>
<br>
Deferred design, when Linux tools do everything a regular computer firmware=
 environment should. And then they created UEFI and tried to take stuff awa=
y that does belong to the operating system.<br>
<br>
While not creating anything that would work better except for GPT disks.<br=
>
<br>
I just want to ask a question though about thin LVM, but I will ask in anot=
her email.<br>
<br>
_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" rel=3D"norefe=
rrer" target=3D"_blank">https://www.redhat.com/mailman/listinfo/linux-lvm</=
a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" rel=3D"=
noreferrer" target=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br>
</blockquote></div>

--14dae93b57d653d36405312adb15--
