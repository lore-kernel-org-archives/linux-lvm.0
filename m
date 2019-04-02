MIME-Version: 1.0
From: Eric Ren <renzhengeek@gmail.com>
Date: Tue, 2 Apr 2019 20:22:45 +0800
Message-ID: <CAKM4AewTByc_vAfEkcNzfsxj6BKaXKaS-R5mEchxAvY2-cRxMg@mail.gmail.com>
Content-Type: multipart/alternative; boundary="0000000000006c0ddc05858b321d"
Subject: [linux-lvm] buffer overflow detected: lvcreate terminated
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

--0000000000006c0ddc05858b321d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Marian,

I have a lvm failure below when creating a lot of thin snapshot LVs for
containers as rootfs.

```
*** buffer overflow detected ***: lvcreate terminated\n=3D=3D=3D=3D=3D=3D=
=3D Backtrace:
=3D=3D=3D=3D=3D=3D=3D=3D=3D\n/lib64/libc.so.6(__fortify_*fail*
+0x37)[0x7f192c2389e7]\n/lib64/libc.so.6(+0x115b62)[0x7f192c236b62]\n/lib64=
/libc.so.6(+0x117947)[0x7f192c238947]\n/lib64/libdevmapper-event.so.1.02(+0=
x21db)[0x7f192cfd21db]\n/lib64/libdevmapper-event.so.1.02(daemon_talk+0xb5)=
[0x7f192cfd2a55]\n/lib64/libdevmapper-event.so.1.02(+0x331b)[0x7f192cfd331b=
]\n/lib64/libdevmapper-event.so.1.02(dm_event_get_registered_device+0x77)[0=
x7f192cfd3a47]\nlvcreate(monitor_dev_for_events+0x3cc)[0x556ec3b5d75c]\nlvc=
reate(monitor_dev_for_events+0x2ee)[0x556ec3b5d67e]\nlvcreate(lv_suspend_if=
_active+0x6cc)[0x556ec3b5f25c]\nlvcreate(+0x14196d)
```

My LVM version:
```
#lvm version
  LVM version:     2.02.180(2)-RHEL7 (2018-07-20)
  Library version: 1.02.149-RHEL7 (2018-07-20)
  Driver version:  4.35.0
```
I see you recently pushed this patch, looks like a fix for such problem:

```
commit fdb6ef8a85e9adc4805202b3200b17bd3b351982
Author: Marian Csontos <mcsontos@redhat.com>
Date:   Thu Jun 21 10:20:09 2018 +0200

    libdm: fix buffer overflow

    (cherry picked from commit 8a0af1bec882de66677e1a0cdceff841c39f92b0)
```

May I ask your help for some confirmation?

- how can we reproduce this problem?
- do you think this patch can fix my problem?

Thanks in advance!
Eric

--0000000000006c0ddc05858b321d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hi=
=C2=A0Marian,</div><div><br></div><div>I have a lvm failure below when crea=
ting a lot of thin snapshot LVs for containers as rootfs.</div><div><br></d=
iv><div>```</div><div>*** buffer overflow detected ***: lvcreate terminated=
\n=3D=3D=3D=3D=3D=3D=3D Backtrace: =3D=3D=3D=3D=3D=3D=3D=3D=3D\n/lib64/libc=
.so.6(__fortify_<b>fail</b>+0x37)[0x7f192c2389e7]\n/lib64/libc.so.6(+0x115b=
62)[0x7f192c236b62]\n/lib64/libc.so.6(+0x117947)[0x7f192c238947]\n/lib64/li=
bdevmapper-event.so.1.02(+0x21db)[0x7f192cfd21db]\n/lib64/libdevmapper-even=
t.so.1.02(daemon_talk+0xb5)[0x7f192cfd2a55]\n/lib64/libdevmapper-event.so.1=
.02(+0x331b)[0x7f192cfd331b]\n/lib64/libdevmapper-event.so.1.02(dm_event_ge=
t_registered_device+0x77)[0x7f192cfd3a47]\nlvcreate(monitor_dev_for_events+=
0x3cc)[0x556ec3b5d75c]\nlvcreate(monitor_dev_for_events+0x2ee)[0x556ec3b5d6=
7e]\nlvcreate(lv_suspend_if_active+0x6cc)[0x556ec3b5f25c]\nlvcreate(+0x1419=
6d)<br></div><div>```</div><div><br></div><div>My LVM version:</div><div>``=
`</div><div><div>#lvm version</div><div>=C2=A0 LVM version:=C2=A0 =C2=A0 =
=C2=A02.02.180(2)-RHEL7 (2018-07-20)</div><div>=C2=A0 Library version: 1.02=
.149-RHEL7 (2018-07-20)</div><div>=C2=A0 Driver version:=C2=A0 4.35.0</div>=
</div><div>```</div><div>I see you recently pushed this patch, looks like a=
 fix for such problem:</div><div><br></div><div>```</div><div><div>commit f=
db6ef8a85e9adc4805202b3200b17bd3b351982</div><div>Author: Marian Csontos &l=
t;<a href=3D"mailto:mcsontos@redhat.com">mcsontos@redhat.com</a>&gt;</div><=
div>Date:=C2=A0 =C2=A0Thu Jun 21 10:20:09 2018 +0200</div><div><br></div><d=
iv>=C2=A0 =C2=A0 libdm: fix buffer overflow</div><div><br></div><div>=C2=A0=
 =C2=A0 (cherry picked from commit 8a0af1bec882de66677e1a0cdceff841c39f92b0=
)</div></div><div>```</div><div><br></div><div>May I ask your help for some=
 confirmation?</div><div><br></div><div>- how can we reproduce this problem=
?</div><div>- do you think this patch can fix my problem?</div><div><br></d=
iv><div>Thanks in advance!</div><div>Eric</div></div></div></div></div>

--0000000000006c0ddc05858b321d--
