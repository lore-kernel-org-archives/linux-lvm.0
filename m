Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAIKr1Zb001372
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2010 15:53:01 -0500
Received: from mail-fx0-f46.google.com (mail-fx0-f46.google.com
	[209.85.161.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAIKqkbQ013614
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2010 15:52:46 -0500
Received: by fxm13 with SMTP id 13so27466fxm.33
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2010 12:52:45 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTimskCLYS4c-m+BaPWNWLNfQzLo19XkOn35LkhmB@mail.gmail.com>
References: <714075.64821.qm@web37902.mail.mud.yahoo.com>
	<4CE53C8C.7010109@redhat.com>
	<AANLkTimskCLYS4c-m+BaPWNWLNfQzLo19XkOn35LkhmB@mail.gmail.com>
From: Eugene Vilensky <evilensky@gmail.com>
Date: Thu, 18 Nov 2010 14:52:25 -0600
Message-ID: <AANLkTi=xce2ceyCED6f0=fKyqFNCORwzVVjRTCLO0coF@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] volume group does not activate after reboot
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
Content-Type: text/plain; charset="iso-8859-1"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Nov 18, 2010 at 2:50 PM, Eugene Vilensky <evilensky@gmail.com> wrot=
e:
> we add a mount -a after the vgchange -ay :) =EF=BF=BD_netdev alone wasn't
> doing it as iscsi starts up after lvm...i think...

https://bugzilla.redhat.com/show_bug.cgi?id=3D625888
