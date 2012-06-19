Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q5JDf1x1025559
	for <linux-lvm@redhat.com>; Tue, 19 Jun 2012 09:41:01 -0400
Received: from mail-lb0-f174.google.com (mail-lb0-f174.google.com
	[209.85.217.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q5JDex9d014611
	for <linux-lvm@redhat.com>; Tue, 19 Jun 2012 09:41:00 -0400
Received: by lbbgm6 with SMTP id gm6so7135614lbb.33
	for <linux-lvm@redhat.com>; Tue, 19 Jun 2012 06:40:59 -0700 (PDT)
MIME-Version: 1.0
Sender: sikieresmescribes@gmail.com
In-Reply-To: <CAL-GF3yZzybqySBcYETyVZ+s5RpURFQkq+WUGcbBGqHh7yL0CA@mail.gmail.com>
References: <CAL-GF3yZzybqySBcYETyVZ+s5RpURFQkq+WUGcbBGqHh7yL0CA@mail.gmail.com>
Date: Tue, 19 Jun 2012 15:34:21 +0200
Message-ID: <CAL-GF3zbaZuHvQhJ_6=9s7jC5MxraRQQDMXRZdJRv4HCiTGXYA@mail.gmail.com>
From: Da <dcodix@gmail.com>
Content-Type: multipart/alternative; boundary=bcaec554dfee0f4f2f04c2d357c6
Subject: Re: [linux-lvm] lvremove snapshot hangs LVM system
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

--bcaec554dfee0f4f2f04c2d357c6
Content-Type: text/plain; charset=ISO-8859-1

I think I finally found the problem and a walk arround.

If I start the process normaly:
/etc/init.d/cman start
/etc/init.d/clvmd start

And make the snapshots source volume of "exclusive use":
lvchange -an volume
lvchange -aey volume

And I try to remove a snapshot:
lvremove -f snapshot

The involved "dm" will get suspended but not deleted causing the eternal
hang of the lvm system due to the blocked I/O .

Now. If BEFORE the "lvremove" I execute a built in clvmd restart:
clvmd -S

It will fail to restart it properly. Looking the code I think it is caused
because clvmd is trying to pass itself "-E" option but in my current lvm2
version is not declared (2.02.87) . I don't know if I may report this to
the lvm-devel :

[pid  2895] execve("/usr/sbin/clvmd", ["clvmd", "-E",
"fU6kuI1yVWxAjsu1WmL1TmvishGAZaZNH61u58pM21rrS3t8vyXvzsoiMaB4XHKX"], [/* 0
vars */] <unfinished ...>
[pid  2892] write(2, "Usage: clvmd [options]\n   -V       Show version of
clvmd\n   -h       Show this help information\n   -d[n]    Set debug
logging (0:none, 1:stderr (implies -f option), 2:syslog)\n   -f       Don't
fork, run in the foreground\n   -R       Tell all running clvmd"..., 611) =
611


Anyway. After the "clvmd -S" clvm will not be started, but I start it
manually with "/etc/init.d/clvmd start".
Now I have to mark the volume as exclusive again, but after that the lvm
systems seems to work fine forever... I can create and delete snapshots
without problems, without hanging the lvm.

It seems to me that the "clvmd -S" command does something that the system
needs and the normal "stop/start" is not executing.

--bcaec554dfee0f4f2f04c2d357c6
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I think I finally found the problem and a walk arround.
<div><br></div><div>If I start the process normaly:</div><div>/etc/init.d/c=
man start</div><div>/etc/init.d/clvmd start</div><div><br></div><div>And ma=
ke the snapshots source volume of &quot;exclusive use&quot;:</div><div>
lvchange -an volume</div><div>lvchange -aey volume</div><div><br></div><div=
>And I try to remove a snapshot:</div><div>lvremove -f snapshot</div><div><=
br></div><div>The involved &quot;dm&quot; will get suspended but not delete=
d causing the eternal hang of the lvm system due to the blocked I/O .</div>
<div><br></div><div>Now. If BEFORE the &quot;lvremove&quot; I execute a bui=
lt in clvmd restart:</div><div>clvmd -S</div><div><br></div><div>It will fa=
il to restart it properly. Looking the code I think it is caused because cl=
vmd is trying to pass itself &quot;-E&quot; option but in my current lvm2 v=
ersion is not declared (2.02.87) . I don&#39;t know if I may report this to=
 the lvm-devel :</div>
<div><br></div><div><div>[pid =A02895] execve(&quot;/usr/sbin/clvmd&quot;, =
[&quot;clvmd&quot;, &quot;-E&quot;, &quot;fU6kuI1yVWxAjsu1WmL1TmvishGAZaZNH=
61u58pM21rrS3t8vyXvzsoiMaB4XHKX&quot;], [/* 0 vars */] &lt;unfinished ...&g=
t;</div>
</div><div>[pid =A02892] write(2, &quot;Usage: clvmd [options]\n =A0 -V =A0=
 =A0 =A0 Show version of clvmd\n =A0 -h =A0 =A0 =A0 Show this help informat=
ion\n =A0 -d[n] =A0 =A0Set debug logging (0:none, 1:stderr (implies -f opti=
on), 2:syslog)\n =A0 -f =A0 =A0 =A0 Don&#39;t fork, run in the foreground\n=
 =A0 -R =A0 =A0 =A0 Tell all running clvmd&quot;..., 611) =3D 611</div>
<div><br></div><div><br></div><div>Anyway. After the &quot;clvmd -S&quot; c=
lvm will not be started, but I start it manually with &quot;/etc/init.d/clv=
md start&quot;.</div><div>Now I have to mark the volume as exclusive again,=
 but after that the lvm systems seems to work fine forever... I can create =
and delete snapshots without problems, without hanging the lvm.</div>
<div><br></div><div>It seems to me that the &quot;clvmd -S&quot; command do=
es something that the system needs and the normal &quot;stop/start&quot; is=
 not executing.</div><div><br></div><div><br></div>

--bcaec554dfee0f4f2f04c2d357c6--
