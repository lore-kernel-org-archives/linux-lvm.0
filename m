Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6G8Ml1U006871
	for <linux-lvm@redhat.com>; Wed, 16 Jul 2008 04:22:47 -0400
Received: from ug-out-1314.google.com (ug-out-1314.google.com [66.249.92.168])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m6G8Lbfh023788
	for <linux-lvm@redhat.com>; Wed, 16 Jul 2008 04:21:37 -0400
Received: by ug-out-1314.google.com with SMTP id s2so500549uge.6
	for <linux-lvm@redhat.com>; Wed, 16 Jul 2008 01:21:37 -0700 (PDT)
Message-ID: <bf6f43f40807160121j27df33c5o5135e1fb9fdd16f1@mail.gmail.com>
Date: Wed, 16 Jul 2008 05:21:36 -0300
From: "Levy Abinajm Melero Sant'Anna" <levy.santanna@gmail.com>
Sender: log.todos@gmail.com
In-Reply-To: <bf6f43f40806281143h5a028857k494a4e4b9ec51@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_9186_31473297.1216196496940"
References: <bf6f43f40806281143h5a028857k494a4e4b9ec51@mail.gmail.com>
Subject: [linux-lvm] Re: Split LV mirror or something
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

------=_Part_9186_31473297.1216196496940
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

There is no comment or answer?

On Sat, Jun 28, 2008 at 3:43 PM, Levy Abinajm Melero Sant'Anna <
levy.santanna@gmail.com> wrote:

> Hi all,
>
> I have one question about the LV mirrors.
>
> Anytime that I think about LV mirrors I think that it should be the
> response for all the issues.
> If I could control the mirrors in the way that I would know each PE
> location, and could split the PE mirrors on different LVs it would resolve
> almost the problems regarding LV migrations with more security and speed
> than snapshot and/or copy the data inside LV.
>
> The question is:
>
> I have one LV with some critical data, and want to make a safe copy with
> less time possible of downtime. Could I make one mirror on a new PV
> (lvconvert -m1) and split this copy into a new LV or/and maybe split the VG
> into a new VG?
>
> Thank you so much,
> Levy Sant'Anna
>

-- 
Lewis/Iceman/Levy

Google Talk! levy.santanna@gmail.com
ICQ 12913566
MSN levy.santanna@gmail.com
Meebo lewisgodus

------=_Part_9186_31473297.1216196496940
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div dir="ltr">There is no comment or answer?<br><br><div class="gmail_quote">On Sat, Jun 28, 2008 at 3:43 PM, Levy Abinajm Melero Sant&#39;Anna &lt;<a href="mailto:levy.santanna@gmail.com">levy.santanna@gmail.com</a>&gt; wrote:<br>
<blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">Hi all,<br><br>I have one question about the LV mirrors.<br><br>Anytime that I think about LV mirrors I think that it should be the response for all the issues.<br>
If I could control the mirrors in the way that I would know each PE location, and could split the PE mirrors on different LVs it would resolve almost the problems regarding LV migrations with more security and speed than snapshot and/or copy the data inside LV.<br>

<br>The question is:<br><br>I have one LV with some critical data, and want to make a safe copy with less time possible of downtime. Could I make one mirror on a new PV (lvconvert -m1) and split this copy into a new LV or/and maybe split the VG into a new VG?<br>

<br>Thank you so much,<br><font color="#888888">Levy Sant&#39;Anna<br>
</font></blockquote></div><br>-- <br>Lewis/Iceman/Levy<br><br>Google Talk! <a href="mailto:levy.santanna@gmail.com">levy.santanna@gmail.com</a><br>ICQ 12913566<br>MSN <a href="mailto:levy.santanna@gmail.com">levy.santanna@gmail.com</a><br>
Meebo lewisgodus
</div>

------=_Part_9186_31473297.1216196496940--
