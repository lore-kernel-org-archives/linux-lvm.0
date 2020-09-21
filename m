Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 01CA72157F24
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2020 14:26:59 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1C39101A540
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2020 14:26:58 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id w1so13037501edr.3
	for <linux-lvm@redhat.com>; Mon, 21 Sep 2020 07:26:53 -0700 (PDT)
MIME-Version: 1.0
References: <4972578.pTZnC5dHRY@walnut>
In-Reply-To: <4972578.pTZnC5dHRY@walnut>
From: Mark Mielke <mark.mielke@gmail.com>
Date: Mon, 21 Sep 2020 10:26:41 -0400
Message-ID: <CALm7yL3rOuRsc=Cvw4P9+o-1crU8B_9dDwgDiSwthhgBKuX5YQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000439a0505afd3a4e1"
Subject: Re: [linux-lvm] Why isn't issue_discards enabled by default?
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

--000000000000439a0505afd3a4e1
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 21, 2020 at 10:14 AM nl6720 <nl6720@gmail.com> wrote:

> I wanted to know why the "issue_discards" setting isn't enabled by
> default. Are there any dangers in enabling it or if not is there a
> chance of getting the default changed?
>
> Also it's not entirely clear to me if/how "issue_discards" affects thin
> pool discard passdown.
>

Historically, there have been dangers. Even today, there might still be
dangers - although, I believe Linux (and other OS) may disable the feature
in hardware which is known to behave improperly.

If you do research and ensure you are using a good storage drive, there
should not be any problems. I enable issue_discards on all systems I work
with at home and work, and have not encountered any problems. But, I also
don't buy cheap drives with questionable namebrands.

It's pretty common for settings such as these to be more conservative, to
ensure that the users who are willing to accept the risk (no matter how
small) can turn it on as an option, and the users who are unaware or might
not have evaluated the risk, cannot blame the software vendors for losing
their data. In the case of LVM - it's not LVM's fault that some drives
might lose your data when discard is sent. But, users of LVM might blame
LVM.

-- 
Mark Mielke <mark.mielke@gmail.com>

--000000000000439a0505afd3a4e1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Sep 21, 2020 at 10:14 AM nl6720 &=
lt;<a href=3D"mailto:nl6720@gmail.com">nl6720@gmail.com</a>&gt; wrote:<br><=
/div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">I wanted to know why the &quot;issue_discards&quot; setting isn&#39;=
t enabled by <br>
default. Are there any dangers in enabling it or if not is there a <br>
chance of getting the default changed?<br>
<br>
Also it&#39;s not entirely clear to me if/how &quot;issue_discards&quot; af=
fects thin <br>
pool discard passdown.<br></blockquote></div><div><br></div><div>Historical=
ly, there have been dangers. Even today, there might still be dangers - alt=
hough, I believe Linux (and other OS) may disable the feature in hardware w=
hich is known to behave improperly.</div><div><br></div><div>If you do rese=
arch and ensure you are using a good storage drive, there should not be any=
 problems. I enable issue_discards on all systems I work with at home and w=
ork, and have not encountered any problems. But, I also don&#39;t buy cheap=
 drives with questionable namebrands.</div><div><br></div><div>It&#39;s pre=
tty common for settings such as these to be more conservative, to ensure th=
at the users who are willing to accept the risk (no matter how small) can t=
urn it on as an option, and the users who are unaware or might not have eva=
luated the risk, cannot blame the software vendors for losing their data. I=
n the case of LVM - it&#39;s not LVM&#39;s fault that some drives might los=
e your data when discard is sent. But, users of LVM might blame LVM.</div><=
div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature">Mark Mielke=
 &lt;<a href=3D"mailto:mark.mielke@gmail.com" target=3D"_blank">mark.mielke=
@gmail.com</a>&gt;<br><br></div></div>

--000000000000439a0505afd3a4e1--
