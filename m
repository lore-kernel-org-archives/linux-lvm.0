Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tBRANXoF032178
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sun, 27 Dec 2015 05:23:33 -0500
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mx1.redhat.com (Postfix) with ESMTPS id E989F3B70A
	for <linux-lvm@redhat.com>; Sun, 27 Dec 2015 10:23:31 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id b35so1991782qge.0
	for <linux-lvm@redhat.com>; Sun, 27 Dec 2015 02:23:31 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <567D8CE9.3030101@redhat.com>
References: <CAAYit8SM0KNv88TiOqD9mNBrk4DX3dG9AcRA9V9aZvAQdJt7vw@mail.gmail.com>
	<567BB51A.4070101@redhat.com>
	<CAAYit8RpRFgYyeHmxyhOco=gxnYgoGPJBa_ssY+xq-D3S70GPw@mail.gmail.com>
	<567D8CE9.3030101@redhat.com>
Date: Sun, 27 Dec 2015 17:19:18 +0800
Message-ID: <CAAYit8Si5KG32QsB4byrZ3Tt0Sz-8iCRU8FBXtTRoBAJzg6jLA@mail.gmail.com>
From: "M.H. Tsai" <mingnus@gmail.com>
Subject: Re: [linux-lvm] Possible bug in expanding thinpool: lvextend
 doens't expand the top-level dm-linear device
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

2015-12-26 2:37 GMT+08:00 Zdenek Kabelac <zkabelac@redhat.com>:
> Dne 25.12.2015 v 03:27 M.H. Tsai napsal(a):
>
> It's not so simple - since the user may activate  thin-pool without
> activation of any thin-volume, and keep thin-pool active while thin-volumes
> are activated and deactivated - so it's different case if user activates
> thin-pool explicitly or thin-pool is activated as thin volume dependency.
>
> Also thin-pool LV has its own cluster lock which is quite complicated to
> explain, but for now -  thin-pool size is unimportant, but it's existence is
> mandatory :)

I
