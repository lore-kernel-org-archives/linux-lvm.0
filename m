Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p93LAOhX015362
	for <linux-lvm@redhat.com>; Mon, 3 Oct 2011 17:10:26 -0400
Received: from mail-qy0-f174.google.com (mail-qy0-f174.google.com
	[209.85.216.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p93LAJFV020745
	for <linux-lvm@redhat.com>; Mon, 3 Oct 2011 17:10:20 -0400
Received: by qyk30 with SMTP id 30so2581932qyk.12
	for <linux-lvm@redhat.com>; Mon, 03 Oct 2011 14:10:19 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 3 Oct 2011 22:10:19 +0100
Message-ID: <CAEKyG25Sx6_Q+=ATCemR1N_Krtq1HYv1no82NXRM8mUD1rQrSQ@mail.gmail.com>
From: Richard Turner <richard.turner83@gmail.com>
Content-Type: multipart/alternative; boundary=bcaec520ebe7fc4d5004ae6b66ec
Subject: [linux-lvm] LVM Mirror Failure Detection
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

--bcaec520ebe7fc4d5004ae6b66ec
Content-Type: text/plain; charset=ISO-8859-1

HIi

I am trying to setup LVM Mirroring on a Ubuntu 11.04 system and I'm not
having any luck getting the mirror failure detection working.

I have downloaded and compiled LVM from source (v2.2.02.88) and installed
dmeventd but still monitoring doesn't seem to work, when a mirror leg
failure occurs and I try to copy data to the LV the prompt just hangs
indefinitely with no mention of the problem anywhere.

There is no indication anywhere that mirror failure monitoring shouldn't
work but I did notice that I don't have the
'libdevmapper-event-lvm2mirror.so' module anywhere on my system even after
installing from source, am I missing something or is this functionality not
yet available?

Any assistance would be much appreciated.

Thanks,

Rich

--bcaec520ebe7fc4d5004ae6b66ec
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

HIi<div><br></div><div>I am trying to setup LVM Mirroring on a Ubuntu 11.04=
 system and I&#39;m not having any luck getting the mirror failure detectio=
n working.</div><div><br></div><div>I have downloaded and compiled LVM from=
 source (v2.2.02.88) and installed dmeventd but still monitoring doesn&#39;=
t seem to work, when a mirror leg failure occurs and I try to copy data to =
the LV the prompt just hangs indefinitely with no mention of the problem an=
ywhere.</div>

<div><br></div><div>There is no indication anywhere that mirror failure mon=
itoring shouldn&#39;t work but I did notice that I don&#39;t have the &#39;=
libdevmapper-event-lvm2mirror.so&#39; module anywhere on my system even aft=
er installing from source, am I missing something or is this functionality =
not yet available?</div>

<div><br></div><div>Any assistance would be much appreciated.</div><div><br=
></div><div>Thanks,</div><div><br></div><div>Rich</div>

--bcaec520ebe7fc4d5004ae6b66ec--
