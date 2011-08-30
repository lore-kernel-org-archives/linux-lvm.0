Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p7U9G2EE024783
	for <linux-lvm@redhat.com>; Tue, 30 Aug 2011 05:16:02 -0400
Received: from mail-ew0-f46.google.com (mail-ew0-f46.google.com
	[209.85.215.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p7U9Fmu8008204
	for <linux-lvm@redhat.com>; Tue, 30 Aug 2011 05:15:58 -0400
Received: by mail-ew0-f46.google.com with SMTP id 4so3852685ewy.33
	for <linux-lvm@redhat.com>; Tue, 30 Aug 2011 02:15:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAGRgLy7pn-6V35f9Uc+zXcHx+TU8rv8EkQjZ6bNsfKCQPNPzLw@mail.gmail.com>
References: <CAGRgLy7Q+Rd9-z_Wz6WGsEy5OmvtjaSBQNZ_Ez0uVxMXFM5j_g@mail.gmail.com>
	<4E5392A6.6000201@redhat.com>
	<CAGRgLy6AsAv-JMaTrzO0inR+y-9JkHGf8WjBBpKd+NevvMA7xg@mail.gmail.com>
	<CAJJYPd=-KrbxFG8uDf0muCzA+ZuF0zat0O+m0BENsAiUiYxAAA@mail.gmail.com>
	<CAGRgLy6OjHHwzs0Qufq2U6LG4U-zH10Nq2rA-0Ce=YiG1Fvsrw@mail.gmail.com>
	<4E5C993F.7050706@gmail.com>
	<CAGRgLy7pn-6V35f9Uc+zXcHx+TU8rv8EkQjZ6bNsfKCQPNPzLw@mail.gmail.com>
Date: Tue, 30 Aug 2011 11:15:57 +0200
Message-ID: <CAJJYPdkTyxDHifFWvap8pSZzzVmd+0bwrakQ+5-A9VRUSOx4bw@mail.gmail.com>
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Subject: Re: [linux-lvm] lvm_vg_create_lv_linear() stuck in dm_udev_wait()
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
To: Alexander Lyakas <alex.bolshoy@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

2011/8/30 Alexander Lyakas <alex.bolshoy@gmail.com>:
> Zdenek,
> thank you.
> I want to try the newer version.
> Can you pls point me to the "latest version from upstream tarball",
> because those Linux terms are still quite confusing to me.

In this case it might not be so easy as you might need to be familiar
with configure and installation of local binary files.

Anyway here are some links:

http://sourceware.org/lvm2/

ftp://sources.redhat.com/pub/lvm2/LVM2.2.02.88.tgz

Zdenek
