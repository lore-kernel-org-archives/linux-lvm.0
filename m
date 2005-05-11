Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4BHNLO28686
	for <linux-lvm@redhat.com>; Wed, 11 May 2005 13:23:21 -0400
Received: from rproxy.gmail.com (rproxy.gmail.com [64.233.170.207])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j4BHNLhv011968
	for <linux-lvm@redhat.com>; Wed, 11 May 2005 13:23:21 -0400
Received: by rproxy.gmail.com with SMTP id a36so228425rnf
	for <linux-lvm@redhat.com>; Wed, 11 May 2005 10:23:21 -0700 (PDT)
Message-ID: <caadac98050511102323c58ffb@mail.gmail.com>
Date: Wed, 11 May 2005 12:23:21 -0500
From: Jeffrey Johnson <capitan.dorko@gmail.com>
Subject: Re: [linux-lvm] "Close failed: Bad file descriptor" messages on
	pvcreate
In-Reply-To: <50C05B7AA7D6924FB5E384EF14BC647B67697C@inba1mx2.corp.emc.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_527_18255606.1115832201180"
References: <50C05B7AA7D6924FB5E384EF14BC647B67697C@inba1mx2.corp.emc.com>
Reply-To: Jeffrey Johnson <capitan.dorko@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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

------=_Part_527_18255606.1115832201180
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On 5/3/05, Sreedharan_Vinod@emc.com <Sreedharan_Vinod@emc.com> wrote:
>=20
> Hi,
>=20
> When I do pvcreate, I get deluged with "pvcreate /dev/sdf: close failed:
> Bad file descriptor" messages.
>=20
> I need to explicity open another session to kill the previous pvcreate
> instance to get out of this situation.
>=20
> On the same system, pvcreate another device succeeds.
>=20

I've had the same problem with some SAN attached storage. I was able to=20
workaround it by doing a vgcreate using the physical volume pvcreate failed=
=20
on. This will obviously fail, but a subsequent pvcreate on the device will=
=20
then work.

------=_Part_527_18255606.1115832201180
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

<br><br><div><span class=3D"gmail_quote">On 5/3/05, <b class=3D"gmail_sende=
rname"><a href=3D"mailto:Sreedharan_Vinod@emc.com">Sreedharan_Vinod@emc.com=
</a></b> &lt;<a href=3D"mailto:Sreedharan_Vinod@emc.com">Sreedharan_Vinod@e=
mc.com
</a>&gt; wrote:</span><blockquote class=3D"gmail_quote" style=3D"border-lef=
t: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1=
ex;">Hi,<br><br>When I do pvcreate, I get deluged with &quot;pvcreate&nbsp;=
&nbsp;/dev/sdf: close failed:
<br>Bad file descriptor&quot; messages.<br><br>I need to explicity open ano=
ther session to kill the previous pvcreate<br>instance to get out of this s=
ituation.<br><br>On the same system, pvcreate another device succeeds.<br>

</blockquote></div><br>
I've had the same problem with some SAN attached storage.&nbsp; I was
able to workaround it by doing a vgcreate using the physical volume
pvcreate failed on.&nbsp; This will obviously fail, but a subsequent
pvcreate on the device will then work.<br>
------=_Part_527_18255606.1115832201180--
