MIME-Version: 1.0
References: <CAKM4AewbcVR1x0cK8hWLCRxb1BzDd-F+WeK6ObUmB35N1HTqOA@mail.gmail.com>
	<47346a29-e6c7-6e22-4360-2d07e2ec7be3@redhat.com>
In-Reply-To: <47346a29-e6c7-6e22-4360-2d07e2ec7be3@redhat.com>
From: Eric Ren <renzhengeek@gmail.com>
Date: Thu, 11 Apr 2019 19:26:22 +0800
Message-ID: <CAKM4Aexm31mYW8WDeiZ4shCoysCcGjic8zV0XiVqEVZvKz-ecQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary="00000000000060701d05863f7501"
Subject: Re: [linux-lvm] Aborting. LV mythinpool_tmeta is now incomplete
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>, thornber@redhat.com, lvm-devel@redhat.com

--00000000000060701d05863f7501
Content-Type: text/plain; charset="UTF-8"

Hi Zdenek,

Thanks for your reply. The use case is for containerd snapshooter, yes, all
lvm setup is on host machine, creating thin LV for VM-based/KATA container
as rootfs.

For example:
https://github.com/containerd/containerd/pull/3136

and

https://github.com/containerd/containerd/pull/3022

So, we're evaluating such solution now~

Thanks,
Eric



On Thu, 11 Apr 2019 at 19:04, Zdenek Kabelac <zkabelac@redhat.com> wrote:

> Dne 11. 04. 19 v 2:27 Eric Ren napsal(a):
> > Hello list,
> >
> > Recently, we're exercising our container environment which uses lvm to
> manage
> > thin LVs, meanwhile we found a very strange error to activate the thin
> LV:
> >
>
>
> Hi
>
>
> The reason is very simple here - lvm2 does not work from containers.
> It's unsupported and if it partially works - it's a pure lucky case.
>
> ATM it's simply clear statement that lvm2 cannot be used from container
> simply
> because block layer is not namespaced.
>
> I'd give here long list of reason why it currently cannot work, but for
> now  -
> you should focus on making all 'device-block' operation on you host - and
> pass
> results to container.
>
> Regards
>
> Zdenek
>


-- 
- Eric Ren

--00000000000060701d05863f7501
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Zdenek,</div><div dir=3D"ltr"><br=
></div><div>Thanks for your reply. The use case is for containerd snapshoot=
er, yes, all lvm setup is on host machine, creating thin LV for VM-based/KA=
TA container as rootfs.</div><div><br></div><div>For example:</div><div><a =
href=3D"https://github.com/containerd/containerd/pull/3136">https://github.=
com/containerd/containerd/pull/3136</a><br></div><div><br></div><div>and</d=
iv><div><br></div><div><a href=3D"https://github.com/containerd/containerd/=
pull/3022">https://github.com/containerd/containerd/pull/3022</a><br></div>=
<div><br></div><div>So, we&#39;re evaluating such solution now~</div><div><=
br></div><div>Thanks,</div><div>Eric</div><div><br></div><div dir=3D"ltr"><=
br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gma=
il_attr">On Thu, 11 Apr 2019 at 19:04, Zdenek Kabelac &lt;<a href=3D"mailto=
:zkabelac@redhat.com">zkabelac@redhat.com</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Dne 11. 04. 19 v 2:27 Eric Ren nap=
sal(a):<br>
&gt; Hello list,<br>
&gt; <br>
&gt; Recently, we&#39;re exercising our container environment which uses lv=
m to manage <br>
&gt; thin LVs, meanwhile we found a very strange error to activate the thin=
 LV:<br>
&gt; <br>
<br>
<br>
Hi<br>
<br>
<br>
The reason is very simple here - lvm2 does not work from containers.<br>
It&#39;s unsupported and if it partially works - it&#39;s a pure lucky case=
.<br>
<br>
ATM it&#39;s simply clear statement that lvm2 cannot be used from container=
 simply <br>
because block layer is not namespaced.<br>
<br>
I&#39;d give here long list of reason why it currently cannot work, but for=
 now=C2=A0 - <br>
you should focus on making all &#39;device-block&#39; operation on you host=
 - and pass <br>
results to container.<br>
<br>
Regards<br>
<br>
Zdenek<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">- Eric Ren<br></div></div>

--00000000000060701d05863f7501--
