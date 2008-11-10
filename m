Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mAAHXHbg017153
	for <linux-lvm@redhat.com>; Mon, 10 Nov 2008 12:33:17 -0500
Received: from wf-out-1314.google.com (wf-out-1314.google.com [209.85.200.175])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mAAHX6Ks018021
	for <linux-lvm@redhat.com>; Mon, 10 Nov 2008 12:33:06 -0500
Received: by wf-out-1314.google.com with SMTP id 25so2588094wfc.6
	for <linux-lvm@redhat.com>; Mon, 10 Nov 2008 09:33:05 -0800 (PST)
Message-ID: <779919740811100933y914c938mc7813453ac88da59@mail.gmail.com>
Date: Mon, 10 Nov 2008 10:33:05 -0700
From: "Jeremy Lyon" <jerlyon@gmail.com>
Subject: Re: [linux-lvm] pvmove and 100% IO Wait
In-Reply-To: <4916670C.4020502@knebb.de>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_107248_22916681.1226338385880"
References: <4915F80E.40407@knebb.de>
	<f4f537b50811081243i351b8a7ch716292ec1ef7d08a@mail.gmail.com>
	<4915FB94.1070005@knebb.de>
	<f4f537b50811081523v303ba8aep6b24de53c414a6d2@mail.gmail.com>
	<4916670C.4020502@knebb.de>
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

------=_Part_107248_22916681.1226338385880
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

>
> > Might not be, but if an operation involves multiple disks it will
> > probably go at the pace of the slowest disk, which for me has always
> > been USB...
> I agree about the speed- but not with the issue of hanging. When pvmove
> works the IO load is moderate (about 20% or less). But when it hangs it
> jumps up to 100% on one or more cores.
>
>
I ran into similar issues when attempting a pvmove with clustered VG's under
CLVMD.  I had to change the clustered VG to non-clustered and then I could
do the pvmove.  You didn't mention clusters, but thought I would share my
experiences.

-Jeremy

------=_Part_107248_22916681.1226338385880
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

<div class="gmail_quote"><blockquote class="gmail_quote" style="border-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;"><div class="Ih2E3d">&gt; Might not be, but if an operation involves multiple disks it will<br>

&gt; probably go at the pace of the slowest disk, which for me has always<br>
&gt; been USB...<br>
</div>I agree about the speed- but not with the issue of hanging. When pvmove<br>
works the IO load is moderate (about 20% or less). But when it hangs it<br>
jumps up to 100% on one or more cores.<br><br></blockquote></div><br>I ran into similar issues when attempting a pvmove with clustered VG&#39;s under CLVMD.&nbsp; I had to change the clustered VG to non-clustered and then I could do the pvmove.&nbsp; You didn&#39;t mention clusters, but thought I would share my experiences.<br>
<br>-Jeremy<br>

------=_Part_107248_22916681.1226338385880--
