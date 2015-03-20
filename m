Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2K3uu63009959
	for <linux-lvm@redhat.com>; Thu, 19 Mar 2015 23:56:56 -0400
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t2K3utVE030314
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Thu, 19 Mar 2015 23:56:55 -0400
Received: by igcqo1 with SMTP id qo1so8133186igc.0
	for <linux-lvm@redhat.com>; Thu, 19 Mar 2015 20:56:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <550B1E2D.2030206@gathman.org>
References: <CAE8gLhnfE2Dd3cKXS-wJajJ6h5wnW11QprDLPrrJX0_eXJ_F3A@mail.gmail.com>
	<54743766.7020502@redhat.com>
	<CAE8gLh=yKODk+7OcyB8=X5Qp1haEYOZuzVb8g4wUdENogs7wng@mail.gmail.com>
	<5474933E.8070007@redhat.com>
	<CAE8gLh=pJLBeWSWCkDOomH-7XjBWHJjx9z4Ss2r+JBTokisUtA@mail.gmail.com>
	<CAHDsjKvsC4J++4d1kdzP0wvhTYjxVEJxyTG5Gw9ETHGPc5uGrw@mail.gmail.com>
	<CAE8gLh=ju97Ne0y=tyXej3Ugh21VBSZq2fM7HExjcpxC1wFGyA@mail.gmail.com>
	<CAE8gLhmWKur6vWEzv=NF-psPyMxHrS3S4Tgr82HD168J4c59=w@mail.gmail.com>
	<550B1E2D.2030206@gathman.org>
Date: Fri, 20 Mar 2015 04:56:54 +0100
Message-ID: <CAE8gLhmYRy-oYd6oEoi20e=aqR+objMoMy8D2KFWEbBOv-ft=g@mail.gmail.com>
From: MegaBrutal <megabrutal@gmail.com>
Subject: Re: [linux-lvm] LVM VG is not activated during system boot
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

2015-03-19 20:06 GMT+01:00 Stuart Gathman <stuart@gathman.org>:
>
> I've had the same problem on Fedora - so it is not ubuntu specific. On
> Fedora, systemd has a timeout for VG activation.  That can be increased.
> However, you can flag the snapshot to *not* be activated automatically (Skip
> activation: -k) at volume group activation. That allows the system to boot
> (remote reboot), and then you can manually activate the big snapshot (or
> automatically in a later script) - waiting the requisite 5 or 10 minutes.
>

Thank you very much! It seems to be a nice workaround. Although, I
can't live with it as Utopic has old LVM version which doesn't have
this feature. (Though Vivid will have it.)

Anyway, is it a wild idea to prioritize the activation of the root
device in initrd?
