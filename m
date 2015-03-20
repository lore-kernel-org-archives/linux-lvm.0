Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t2KGqPf9023342
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 20 Mar 2015 12:52:25 -0400
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mx1.redhat.com (Postfix) with ESMTPS id BDB43B598B
	for <linux-lvm@redhat.com>; Fri, 20 Mar 2015 16:52:24 +0000 (UTC)
Received: by iecvj10 with SMTP id vj10so97692491iec.0
	for <linux-lvm@redhat.com>; Fri, 20 Mar 2015 09:52:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <550BDABE.3060005@redhat.com>
References: <CAE8gLhnfE2Dd3cKXS-wJajJ6h5wnW11QprDLPrrJX0_eXJ_F3A@mail.gmail.com>
	<54743766.7020502@redhat.com>
	<CAE8gLh=yKODk+7OcyB8=X5Qp1haEYOZuzVb8g4wUdENogs7wng@mail.gmail.com>
	<5474933E.8070007@redhat.com>
	<CAE8gLh=pJLBeWSWCkDOomH-7XjBWHJjx9z4Ss2r+JBTokisUtA@mail.gmail.com>
	<CAHDsjKvsC4J++4d1kdzP0wvhTYjxVEJxyTG5Gw9ETHGPc5uGrw@mail.gmail.com>
	<CAE8gLh=ju97Ne0y=tyXej3Ugh21VBSZq2fM7HExjcpxC1wFGyA@mail.gmail.com>
	<CAE8gLhmWKur6vWEzv=NF-psPyMxHrS3S4Tgr82HD168J4c59=w@mail.gmail.com>
	<550B1E2D.2030206@gathman.org> <550BDABE.3060005@redhat.com>
Date: Fri, 20 Mar 2015 17:52:24 +0100
Message-ID: <CAE8gLh=-X76FjQHPa6pODcv+BZqXPKR1-=TxMcp=+TLQNNqiig@mail.gmail.com>
From: MegaBrutal <megabrutal@gmail.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>

I resend this message in plaintext, as I think the previous
HTML-formatted one didn't reach the list, as I don't see it in the
archives.


2015-03-20 9:30 GMT+01:00 Zdenek Kabelac <zkabelac@redhat.com>:
> This problem with old snaps basically cannot be fixed unless there would be
> a completely different new snapshot target ;)

I understand this is a by-design feature of LVM snapshots, and I
accept it as-is. The problem for me is not the long activation time,
but the fact that initrd stops waiting for the full activation to
complete. It gives up and kills the vgchange process.

I understand initrd behaviour may be distro-specific.


> So the advised fix for long term snapshot is to switch to use thin-pool.
>
> Here you will have all the goodies - very fast and efficient snapshots, you
> could easily take snapshot of snapshot and you could also select if you want
> to have snapshot activated or not (and by default it's skipped from
> activation).

Well, thin pools seem nice, but I don't see them being matured enough
for production use. For example, basic VG management like reducing or
splitting a VG failed for me when a thin pool was present in the VG,
even if the split would have not affected the thin pool itself. I also
failed to get rid of missing PVs when a thin pool would have been
affected – while „vgreduce --removemissing --force” promises to remove
affected LVs, it couldn't get rid of the thin pool. When I posted a
thread about the issue here, no one bothered to answer.
(It is here: https://www.redhat.com/archives/linux-lvm/2015-March/msg00001.html)

Also, as far as I know, thin snapshots can only be created of thin LVs
residing in the same thin pool. That means, you can't make a thin
snapshot of any LV, and one shouldn't keep critical LVs (e.g. root FS)
in thin pools.
