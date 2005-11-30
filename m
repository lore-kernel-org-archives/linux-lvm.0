Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jAU98NV12122
	for <linux-lvm@redhat.com>; Wed, 30 Nov 2005 04:08:23 -0500
Received: from zproxy.gmail.com (zproxy.gmail.com [64.233.162.203])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jAU98HvV011189
	for <linux-lvm@redhat.com>; Wed, 30 Nov 2005 04:08:17 -0500
Received: by zproxy.gmail.com with SMTP id x3so21740nzd
	for <linux-lvm@redhat.com>; Wed, 30 Nov 2005 01:08:17 -0800 (PST)
Message-ID: <efef33d20511300108y4f6c441vff876085f80f816b@mail.gmail.com>
Date: Wed, 30 Nov 2005 10:08:17 +0100
From: Wallace Wadge <wwadge@gmail.com>
In-Reply-To: <efef33d20511292301s1fe5cf0dp90180833f51e2360@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/alternative; 
	boundary="----=_Part_3733_12478536.1133341697186"
References: <efef33d20511292301s1fe5cf0dp90180833f51e2360@mail.gmail.com>
Subject: [linux-lvm] Re: lvm + raid (confused)
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
To: linux-lvm@redhat.com

------=_Part_3733_12478536.1133341697186
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Perfect! Thanks!

Sadly I cannot extend the filesystem anyway thanks to the installer
defaulting to ext3 so I'm using lvm for almost nothing except snapshots (i.=
e.
I shouldn't be needing lvcreate/lvextend).

What I was worried was: my fs is definetely on the HW raid (logically), but
I wasn't sure if free blocks would have come from somewhere else.

Anyway this seems to do the trick. Thanks once again.

Wallace

------=_Part_3733_12478536.1133341697186
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Perfect! Thanks!<br><br>Sadly I cannot extend the filesystem anyway thanks =
to the installer defaulting to ext3 so I'm using lvm for almost nothing exc=
ept snapshots (i.e. I shouldn't be needing lvcreate/lvextend).<br><br>What =
I was worried was: my fs is definetely on the HW raid (logically), but I wa=
sn't sure if free blocks would have come from somewhere else.
<br><br>Anyway this seems to do the trick. Thanks once again.<br><br>Wallac=
e<br>

------=_Part_3733_12478536.1133341697186--
