Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r54FTqnH004370
	for <linux-lvm@redhat.com>; Tue, 4 Jun 2013 11:29:52 -0400
Received: from wizard.servers.creatim.net (wizard.servers.creatim.net
	[195.246.8.45])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r54FTkCx016572
	for <linux-lvm@redhat.com>; Tue, 4 Jun 2013 11:29:46 -0400
Received: from undisclosed (undisclosed [127.0.0.254]) (Authenticated sender:
	undisclosed) by wizard.servers.creatim.net (Postfix) with
	ESMTPSA id 6037410E05E6
	for <linux-lvm@redhat.com>; Tue,  4 Jun 2013 17:29:44 +0200 (CEST)
Received: by mail-ie0-f180.google.com with SMTP id b11so715458iee.39
	for <linux-lvm@redhat.com>; Tue, 04 Jun 2013 08:29:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAEHxbC3-j2kB5NuuYgxiWtH9cDqTCs8NXmTO-wccnj+4RotTKQ@mail.gmail.com>
References: <CAEp_DRC=xOm-yWLGR27PnsuLPTTXcPMnKLSmk+iS1VLDG0hKtw@mail.gmail.com>
	<CAEHxbC3-j2kB5NuuYgxiWtH9cDqTCs8NXmTO-wccnj+4RotTKQ@mail.gmail.com>
Date: Tue, 4 Jun 2013 17:29:42 +0200
Message-ID: <CAEp_DRDp4sJE8CbSMdTuETO5_yQnvQYjzk46wEv3YTCnUnW5yQ@mail.gmail.com>
From: Bostjan Skufca <bostjan@a2o.si>
Content-Type: multipart/alternative; boundary=20cf303dda620ab0dd04de55c0da
Subject: Re: [linux-lvm] Mounted,
	but idle LVM volume causes constant disk writes
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

--20cf303dda620ab0dd04de55c0da
Content-Type: text/plain; charset=ISO-8859-1

Greg, spot on!

I did found it a bit weird that mkfs on 5tb volume was faster than usual
(well, I did notice I didn't notice inode tables counter being slow) :)
I have to check other hosts though.

Thank you!
b.



On 4 June 2013 12:59, Greg Zapp <greg.zapp@gmail.com> wrote:

> This is just a general stab, but has the filesystem been fully initialized
> on those?  The default for ext4 is to do a lazy initialization of the
> filesystem and journal when you create it.  Depending on the size of the
> file system this can last for some time.  To prevent this use:
> mkfs.ext4 -E lazy_itable_init=0,lazy_journal_init=0
>
> -Greg
>
>
> On Tue, Jun 4, 2013 at 5:46 PM, Bostjan Skufca <bostjan@a2o.si> wrote:
>
>> Hello,
>>
>> If LVM2 volume is mounted (ext4 fs), why is there constant write activity
>> to the devices below (sw raid in this case) despite not using the mounted
>> volume at all?
>>
>> I am seing this on multiple hosts. On this particular one I am seeing
>> around 20 writes per second on average, but they occur in batches of around
>> 50-90 writeIOps on every 3-4 seconds. If I mount the same filesystem (ext4)
>> on sw raid1 without LVM in between, I see the expected 0 write IOps when
>> not using the filesystem.
>>
>> Kernel versions where I noticed this: 3.0.13 (sysrescd) 3.4.1, 3.9.4
>> (custom compiled). I noticed it on all systems where lvm is in use.
>>
>> Thank you for the hints,
>> b.
>>
>>
>> PS: I did search the web first, but I could not find the answer. Sorry if
>> this has been answered before, maybe I was searching for the wrong terms.
>>
>>
>> _______________________________________________
>> linux-lvm mailing list
>> linux-lvm@redhat.com
>> https://www.redhat.com/mailman/listinfo/linux-lvm
>> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>

--20cf303dda620ab0dd04de55c0da
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Greg, spot on!<div style><br></div><div style>I did found =
it a bit weird that mkfs on 5tb volume was faster than usual (well, I did n=
otice I didn&#39;t notice inode tables counter being slow) :)</div><div sty=
le>
I have to check other hosts though.<br></div><div style><br></div><div styl=
e>Thank you!</div><div style>b.</div><div style><br></div></div><div class=
=3D"gmail_extra"><br><br><div class=3D"gmail_quote">On 4 June 2013 12:59, G=
reg Zapp <span dir=3D"ltr">&lt;<a href=3D"mailto:greg.zapp@gmail.com" targe=
t=3D"_blank">greg.zapp@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>This is just a general=
 stab, but has the filesystem been fully initialized on those?=A0 The defau=
lt for ext4 is to do a lazy initialization of the filesystem and journal wh=
en you create it.=A0 Depending on the size of the file system this can last=
 for some time.=A0 To prevent this use:<br>

<span></span>mkfs.ext4 <span>-E</span> <span>lazy_itable_init</span>=3D<spa=
n>0</span>,<span>lazy_journal_init</span>=3D<span>0<br><br></span></div><sp=
an>-Greg<br>
</span></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_quote">=
<div><div class=3D"h5">On Tue, Jun 4, 2013 at 5:46 PM, Bostjan Skufca <span=
 dir=3D"ltr">&lt;<a href=3D"mailto:bostjan@a2o.si" target=3D"_blank">bostja=
n@a2o.si</a>&gt;</span> wrote:<br>

</div></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div><div class=3D"h5"><div dir=
=3D"ltr">Hello,<div><br></div><div>If LVM2 volume is mounted (ext4 fs), why=
 is there constant write activity to the devices below (sw raid in this cas=
e) despite not using the mounted volume at all?<br>

</div><div>
<br></div><div>I am seing this on multiple hosts. On this particular one I =
am seeing around 20 writes per second on average, but they occur in batches=
 of around 50-90 writeIOps on every 3-4 seconds. If I mount the same filesy=
stem (ext4) on sw raid1 without LVM in between, I see the expected 0 write =
IOps when not using the filesystem.</div>


<div><br></div><div>Kernel versions where I noticed this: 3.0.13 (sysrescd)=
 3.4.1, 3.9.4 (custom compiled). I noticed it on all systems where lvm is i=
n use.</div><div><br></div><div>Thank you for the hints,</div>
<div>b.</div><div><br></div><div><br></div><div>PS: I did search the web fi=
rst, but I could not find the answer. Sorry if this has been answered befor=
e, maybe I was searching for the wrong terms.</div>
<div><br></div></div>
<br></div></div>_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com" target=3D"_blank">linux-lvm@redhat.=
com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>=
</div>
<br>_______________________________________________<br>
linux-lvm mailing list<br>
<a href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</a><br>
<a href=3D"https://www.redhat.com/mailman/listinfo/linux-lvm" target=3D"_bl=
ank">https://www.redhat.com/mailman/listinfo/linux-lvm</a><br>
read the LVM HOW-TO at <a href=3D"http://tldp.org/HOWTO/LVM-HOWTO/" target=
=3D"_blank">http://tldp.org/HOWTO/LVM-HOWTO/</a><br></blockquote></div><br>=
</div>

--20cf303dda620ab0dd04de55c0da--
