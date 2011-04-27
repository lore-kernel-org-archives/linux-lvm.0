Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p3R400Dg014575
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2011 00:00:00 -0400
Received: from mail-yi0-f46.google.com (mail-yi0-f46.google.com
	[209.85.218.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p3R3xvVQ003333
	for <linux-lvm@redhat.com>; Tue, 26 Apr 2011 23:59:57 -0400
Received: by yia27 with SMTP id 27so659806yia.33
	for <linux-lvm@redhat.com>; Tue, 26 Apr 2011 20:59:57 -0700 (PDT)
MIME-Version: 1.0
Sender: cjstreeter@gmail.com
In-Reply-To: <alpine.LRH.2.00.1104262338440.3338@bmsred.bmsi.com>
References: <BANLkTinf5PWmfm2YOMshbOUvh3+ht89jhA@mail.gmail.com>
	<alpine.LRH.2.00.1104262338440.3338@bmsred.bmsi.com>
From: Chris Streeter <chris@chrisstreeter.com>
Date: Tue, 26 Apr 2011 20:58:25 -0700
Message-ID: <BANLkTinZzxt2c01=uN6VUXVHFsbXK2Mm6A@mail.gmail.com>
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] Recovering Accidentally Destroyed LVM2 Information
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

> What you *should* have done is restore the metadata to the point before
> your errant command. =EF=BF=BDYou can still do that (if it is still in th=
e archive),
> but the several K of zeros written to the start of the LV you created will
> require recovery.

So I still have all the files in the archive of the form raid_vg_0000*.vg

If have those files, how would I go about restoring the metadata to
the device? If I were to loose several K of data, I'm totally fine
with that.

Thanks!
