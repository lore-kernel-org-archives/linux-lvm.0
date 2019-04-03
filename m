MIME-Version: 1.0
References: <CAKM4AewTByc_vAfEkcNzfsxj6BKaXKaS-R5mEchxAvY2-cRxMg@mail.gmail.com>
In-Reply-To: <CAKM4AewTByc_vAfEkcNzfsxj6BKaXKaS-R5mEchxAvY2-cRxMg@mail.gmail.com>
From: Eric Ren <renzhengeek@gmail.com>
Date: Wed, 3 Apr 2019 17:36:26 +0800
Message-ID: <CAKM4AezNLJsPJSkUuVyghAYqvCMsgWwV2xzW2BxMNHf_aQPKzg@mail.gmail.com>
Content-Type: multipart/alternative; boundary="0000000000007d8a7505859cfd72"
Subject: Re: [linux-lvm] buffer overflow detected: lvcreate terminated
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
Cc: mcsontos@redhat.com

--0000000000007d8a7505859cfd72
Content-Type: text/plain; charset="UTF-8"

Hi,

My LVM version:
> ```
> #lvm version
>   LVM version:     2.02.180(2)-RHEL7 (2018-07-20)
>   Library version: 1.02.149-RHEL7 (2018-07-20)
>   Driver version:  4.35.0
> ```
>


> I see you recently pushed this patch, looks like a fix for such problem:
>
> ```
> commit fdb6ef8a85e9adc4805202b3200b17bd3b351982
> Author: Marian Csontos <mcsontos@redhat.com>
> Date:   Thu Jun 21 10:20:09 2018 +0200
>
>     libdm: fix buffer overflow
>
>     (cherry picked from commit 8a0af1bec882de66677e1a0cdceff841c39f92b0)
> ```
>

Hmm, I see  8a0af1bec882de66677e1a0cdceff841c39f92b0 is already in 2.02.180~

My problem seems a new issue, unfortunately not reproduced yet.

Eric

--0000000000007d8a7505859cfd72
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr"><br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><=
div>My LVM version:</div><div>```</div><div><div>#lvm version</div><div>=C2=
=A0 LVM version:=C2=A0 =C2=A0 =C2=A02.02.180(2)-RHEL7 (2018-07-20)</div><di=
v>=C2=A0 Library version: 1.02.149-RHEL7 (2018-07-20)</div><div>=C2=A0 Driv=
er version:=C2=A0 4.35.0</div></div><div>```</div></div></div></div></div><=
/blockquote><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><di=
v>I see you recently pushed this patch, looks like a fix for such problem:<=
/div><div><br></div><div>```</div><div><div>commit fdb6ef8a85e9adc4805202b3=
200b17bd3b351982</div><div>Author: Marian Csontos &lt;<a href=3D"mailto:mcs=
ontos@redhat.com" target=3D"_blank">mcsontos@redhat.com</a>&gt;</div><div>D=
ate:=C2=A0 =C2=A0Thu Jun 21 10:20:09 2018 +0200</div><div><br></div><div>=
=C2=A0 =C2=A0 libdm: fix buffer overflow</div><div><br></div><div>=C2=A0 =
=C2=A0 (cherry picked from commit 8a0af1bec882de66677e1a0cdceff841c39f92b0)=
</div></div><div>```</div></div></div></div></div></blockquote><div><br></d=
iv><div>Hmm, I see=C2=A0 8a0af1bec882de66677e1a0cdceff841c39f92b0 is alread=
y in 2.02.180~</div><div><br></div><div>My problem seems a new issue, unfor=
tunately not reproduced yet.</div><div><br></div><div>Eric</div></div></div=
>

--0000000000007d8a7505859cfd72--
