Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r63MiVcI018577
	for <linux-lvm@redhat.com>; Wed, 3 Jul 2013 18:44:31 -0400
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r63MiTPI021254
	for <linux-lvm@redhat.com>; Wed, 3 Jul 2013 18:44:29 -0400
Received: by mail-lb0-f173.google.com with SMTP id v1so678198lbd.4
	for <linux-lvm@redhat.com>; Wed, 03 Jul 2013 15:44:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAFrGbuXJ54EgwA7pnzRMLtTnkjsgep=h2RvVZMN01fTXn+1hQw@mail.gmail.com>
References: <CAFrGbuW1NDnsZfm7S5f=wsTbZ4rcb6huPX7MMv_AiZF95xDYSQ@mail.gmail.com>
	<CAFrGbuXHzzYwgB88bhOyjFUL7dokFbSsHWdJ1P8Pc88Wp2EdoQ@mail.gmail.com>
	<CAFrGbuXJ54EgwA7pnzRMLtTnkjsgep=h2RvVZMN01fTXn+1hQw@mail.gmail.com>
Date: Thu, 4 Jul 2013 00:44:28 +0200
Message-ID: <CAFrGbuVRTSo1gTdgoOgmZLCk4NzVDf2jMYB=nT3_dNzJPz5HzA@mail.gmail.com>
From: Alessandro MACUZ <alessandro.macuz@gmail.com>
Content-Type: multipart/alternative; boundary=001a1133c6904f09b104e0a334cd
Subject: Re: [linux-lvm] I can't have the mirror_log mirrored,
 LVM complains "there is no suitable space"
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

--001a1133c6904f09b104e0a334cd
Content-Type: text/plain; charset=ISO-8859-1

Ok,

it seems I'm getting closer to the solution.
Thanks to this link

http://serverfault.com/questions/500533/lvm-mirror-with-data-and-logs-mirrored-on-same-2-devices

it seems that what I want to achieve can be done only when creating a new
fresh volume.

Do I really need three logical volumes (the original + those 2 with
redundant mirrorlog on the same disks) or there is a short cut so that I
don't have to find room for the third logical volume?

Thanks to anybody who will be willing to help... I've just started with
LVM, I might not see the obvious.

Alex

--001a1133c6904f09b104e0a334cd
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Ok,<br><br>it seems I&#39;m getting closer to the solution.<br>Thanks to th=
is link<br><br><a href=3D"http://serverfault.com/questions/500533/lvm-mirro=
r-with-data-and-logs-mirrored-on-same-2-devices">http://serverfault.com/que=
stions/500533/lvm-mirror-with-data-and-logs-mirrored-on-same-2-devices</a><=
br>
<br>it seems that what I want to achieve can be done only when creating a n=
ew fresh volume.<br><br>Do I really need three logical volumes (the origina=
l + those 2 with redundant mirrorlog on the same disks) or there is a short=
 cut so that I don&#39;t have to find room for the third logical volume?<br=
>
<br>Thanks to anybody who will be willing to help... I&#39;ve just started =
with LVM, I might not see the obvious.<br><br>Alex<br>

--001a1133c6904f09b104e0a334cd--
