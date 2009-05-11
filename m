Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n4BJgLR6013145
	for <linux-lvm@redhat.com>; Mon, 11 May 2009 15:42:21 -0400
Received: from mail-ew0-f170.google.com (mail-ew0-f170.google.com
	[209.85.219.170])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n4BJg7qN012853
	for <linux-lvm@redhat.com>; Mon, 11 May 2009 15:42:08 -0400
Received: by ewy18 with SMTP id 18so3592332ewy.3
	for <linux-lvm@redhat.com>; Mon, 11 May 2009 12:42:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <f4f537b50905111222t46c9f2bdwa8239907af93a22e@mail.gmail.com>
References: <f4f537b50905111017p4edc87ccl1d0eb2d71c834a58@mail.gmail.com> 
	<1242062874.13505.387.camel@breeves.fab.redhat.com>
	<f4f537b50905111222t46c9f2bdwa8239907af93a22e@mail.gmail.com>
From: Eugene Vilensky <evilensky@gmail.com>
Date: Mon, 11 May 2009 14:41:47 -0500
Message-ID: <f4f537b50905111241i224550a7ief8ed8cddc2f8443@mail.gmail.com>
Subject: Re: [linux-lvm] removing a missing vg
Content-Type: multipart/alternative; boundary=0016e6dbe59a677d790469a82c71
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

--0016e6dbe59a677d790469a82c71
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

>
>
>> dmsetup remove <device name>
>>
>
> on the LV device?
>
> #dmsetup remove /dev/vgTEST/lvTEST
> dm_task_set_name: Device /dev/vgTEST/lvTEST not found
> Command failed
>
>
> on the mpath device?
>
> # dmsetup remove /dev/mpath/mpath1
> device-mapper: remove ioctl failed: Device or resource busy
> Command failed
>

I see now.  on the name as seen by dmsetup info.  thank you!

--0016e6dbe59a677d790469a82c71
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"borde=
r-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-le=
ft: 1ex;"><div class=3D"gmail_quote"><div class=3D"im"><blockquote class=3D=
"gmail_quote" style=3D"border-left: 1px solid rgb(204, 204, 204); margin: 0=
pt 0pt 0pt 0.8ex; padding-left: 1ex;">

<div><br>
</div>dmsetup remove &lt;device name&gt;<br>
</blockquote></div><div><br>on the LV device?<br><br>#dmsetup remove /dev/v=
gTEST/lvTEST <br>dm_task_set_name: Device /dev/vgTEST/lvTEST not found<br>C=
ommand failed<br><br><br>on the mpath device?<br><br># dmsetup remove /dev/=
mpath/mpath1 <br>


device-mapper: remove ioctl failed: Device or resource busy<br>Command fail=
ed<br></div></div></blockquote></div><br>I see now.=A0 on the name as seen =
by dmsetup info.=A0 thank you!<br>

--0016e6dbe59a677d790469a82c71--
