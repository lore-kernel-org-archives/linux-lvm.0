MIME-Version: 1.0
References: <CAKM4AewbcVR1x0cK8hWLCRxb1BzDd-F+WeK6ObUmB35N1HTqOA@mail.gmail.com>
	<47346a29-e6c7-6e22-4360-2d07e2ec7be3@redhat.com>
	<CAKM4Aexm31mYW8WDeiZ4shCoysCcGjic8zV0XiVqEVZvKz-ecQ@mail.gmail.com>
	<7839ff52-18e5-6a95-9a2a-12ea73457700@redhat.com>
In-Reply-To: <7839ff52-18e5-6a95-9a2a-12ea73457700@redhat.com>
From: Eric Ren <renzhengeek@gmail.com>
Date: Thu, 11 Apr 2019 19:49:46 +0800
Message-ID: <CAKM4AezLrUrXZKA=vKMaRHcij3K6UBZpy-RcVXeUB9Wwfszh7Q@mail.gmail.com>
Content-Type: multipart/alternative; boundary="00000000000009b27e05863fc999"
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

--00000000000009b27e05863fc999
Content-Type: text/plain; charset="UTF-8"

Hi,


> Hi,

I could recommend to orient towards the solution where the 'host' system
> provides some service for your containers -  so container ask for action,
> service orchestrates the action on the system - and returns asked resource
> to
> the container.
>

Right, it's all k8s, containerd, OCI runtime are doing.


>
> IMHO I don't see any other usable solution ATM - although many container
> developers seems to endlessly try to run these system commands from a
> container...
>

Sorry, I don't make it clear. I mean we don't use lvm in container, we  use
thin pool on physical server, create thin LV, passthrough thin dm device
into virtual machine (KATA VM, not cgroup&namespce-based container) as VM's
rootfs.

Thanks,
Eric

--00000000000009b27e05863fc999
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div>Hi,</div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">Hi,=C2=A0</blockquote><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
I could recommend to orient towards the solution where the &#39;host&#39; s=
ystem <br>
provides some service for your containers -=C2=A0 so container ask for acti=
on, <br>
service orchestrates the action on the system - and returns asked resource =
to <br>
the container.<br></blockquote><div><br></div><div>Right, it&#39;s all k8s,=
 containerd, OCI runtime are doing.</div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
IMHO I don&#39;t see any other usable solution ATM - although many containe=
r <br>
developers seems to endlessly try to run these system commands from a conta=
iner...<br></blockquote></div><div><br></div><div>Sorry, I don&#39;t make i=
t clear. I mean we don&#39;t use lvm in container, we=C2=A0 use thin pool o=
n physical server, create thin LV, passthrough thin dm device into virtual =
machine (KATA VM, not cgroup&amp;namespce-based container) as VM&#39;s root=
fs.</div><div><br></div><div>Thanks,</div><div>Eric</div><div><br></div></d=
iv>

--00000000000009b27e05863fc999--
