Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id pA2HUnwH022271
	for <linux-lvm@redhat.com>; Wed, 2 Nov 2011 13:30:49 -0400
Received: from mail-ww0-f46.google.com (mail-ww0-f46.google.com [74.125.82.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id pA2HUlCA015495
	for <linux-lvm@redhat.com>; Wed, 2 Nov 2011 13:30:48 -0400
Received: by wwe5 with SMTP id 5so404797wwe.27
	for <linux-lvm@redhat.com>; Wed, 02 Nov 2011 10:30:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4EB1722F.206@ankh.org>
References: <825955434.1696549.1320246372085.JavaMail.root@sz0126a.westchester.pa.mail.comcast.net>
	<4EB1722F.206@ankh.org>
From: Eugene Vilensky <evilensky@gmail.com>
Date: Wed, 2 Nov 2011 12:30:26 -0500
Message-ID: <CAEUKkZ__rjZ8636rE10JEu=_eO91gf71wTMMWKJk35eJR2d9rw@mail.gmail.com>
Content-Type: multipart/alternative; boundary=0016e6de143a18def404b0c3d53b
Subject: Re: [linux-lvm] N00b Question: Logical Volume without a Logical
 Volume Group ?
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

--0016e6de143a18def404b0c3d53b
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Nov 2, 2011 at 11:39 AM, James Hawtin <oolon@ankh.org> wrote:

> Dan White wrote:
>
>>
>> I just experienced that.
>>
>> I had to reboot the machine to "see" the expanded LUN.
>> I used fdisk to make a partition out of the LUN expansion, but I had to
>> reboot again before I could do anything further.
>> After the second reboot, I was able to make a PV out of the new
>> partition, roll it into the existing VG and then expand the two test LV's I
>> had previously created to utilize the new elbow room.
>>
>> This is on a RHEL 5.7 system.
>>
>> Is there a way to do this without the rebooting ?
>>
>>
>>
> Assuming the device is sda then
>
> |echo 1 > /sys/block/sda/device/rescan|
>
> However if that fails (and it can) only a reboot or removing the disk
> driver module and reinstalling it will scan it correctly (possible if you
> have a mix of local and san disk) however probably a reboot is easiler.


Not sure if this sort of thing matters to everyone, but I was informed by
Support that despite methods that may be available at hand, a reboot is the
only "Supported" method of recognizing changed partition information on a
disk that is in use.  -1.

--0016e6de143a18def404b0c3d53b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote">On Wed, Nov 2, 2011 at 11:39 AM, James Hawtin <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:oolon@ankh.org">oolon@ankh.org</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex;">

<div class=3D"im">Dan White wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
<br>
I just experienced that.<br>
<br>
I had to reboot the machine to &quot;see&quot; the expanded LUN.<br>
I used fdisk to make a partition out of the LUN expansion, but I had to reb=
oot again before I could do anything further.<br>
After the second reboot, I was able to make a PV out of the new partition, =
roll it into the existing VG and then expand the two test LV&#39;s I had pr=
eviously created to utilize the new elbow room.<br>
<br>
This is on a RHEL 5.7 system.<br>
<br>
Is there a way to do this without the rebooting ?<br>
<br>
 =A0<br>
</blockquote></div>
Assuming the device is sda then<br>
<br>
|echo 1 &gt; /sys/block/sda/device/rescan|<br>
<br>
However if that fails (and it can) only a reboot or removing the disk drive=
r module and reinstalling it will scan it correctly (possible if you have a=
 mix of local and san disk) however probably a reboot is easiler.</blockquo=
te>

<div><br></div><div>Not sure if this sort of thing matters to everyone, but=
 I was informed by Support that despite methods that may be available at ha=
nd, a reboot is the only &quot;Supported&quot; method of recognizing change=
d partition information on a disk that is in use. =A0-1.</div>

</div>

--0016e6de143a18def404b0c3d53b--
