Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8D8wKr31731
	for <linux-lvm@redhat.com>; Mon, 13 Sep 2004 04:58:20 -0400
Received: from mproxy.gmail.com (rproxy.gmail.com [64.233.170.199])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8D8wKgv007931
	for <linux-lvm@redhat.com>; Mon, 13 Sep 2004 04:58:20 -0400
Received: by mproxy.gmail.com with SMTP id 75so265808rnl
	for <linux-lvm@redhat.com>; Mon, 13 Sep 2004 01:58:14 -0700 (PDT)
Message-ID: <ce9f1f9e04091301587ea0256b@mail.gmail.com>
Date: Mon, 13 Sep 2004 01:58:14 -0700
From: Stanley Yue <stanley.yue@gmail.com>
Subject: Re: [linux-lvm] Unable to create lvm1 configurations
In-Reply-To: <20040912115653.GK1094@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <ce9f1f9e040911233347ca7ec8@mail.gmail.com>
	<20040912115653.GK1094@agk.surrey.redhat.com>
Reply-To: Stanley Yue <stanley.yue@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Stanley Yue <stanley.yue@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

Thanks Alasdair, it turns out that have to explicitly enable lvm1 support by:

./configure --with-lvm1=internal

However, now, I'm seeing the following problem. 

I have installed both lvm1 and lvm2 utilities onto the same system,
with the lvm-mod and device-mapper from lvm2. I want to test out
whether lvm2 utilities can detect configurations created from lvm1
utilities.

+ pvcreate fails when I'm using the lvm1 utilities.

[root@DAP-RHLNX1 sbin]# ./vgscan  -v
vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group

[root@DAP-RHLNX1 sbin]# ./pvcreate /dev/hda7
pvcreate -- ERROR: VGDA in kernel and lvmtab are NOT consistent;
please run vgscan

+ However, pvcreate succeed when I'm using the lvm2's pvcreate

[root@DAP-RHLNX1 sbin]# pvcreate /dev/hda7
  Physical volume "/dev/hda7" successfully created

Is there anything wrong with my setup here? Does lvm1 utilities work
with lvm-mod from lvm2?
How can I resync the state between the VGDA in kernel and lvmtab?
Do anyone know how I can get it to work with lvm1's pvcreate?

Thanks,

Stanley



On Sun, 12 Sep 2004 12:56:53 +0100, Alasdair G Kergon <agk@redhat.com> wrote:
> On Sat, Sep 11, 2004 at 11:33:06PM -0700, Stanley Yue wrote:
> > [root@DAP-RHLNX1 tools]# vgcreate -v --metadatatype 1 vg1-lvm2
> > /dev/hda6 /dev/hda7
> >   Invalid argument 1
> >   Error during parsing of command line.
> 
> Works for me.
> 
> Perhaps support for 'lvm1' metadata was not compiled in, or
> not loaded from lvm.conf if you configured it shared?
> 
> Alasdair
> --
> agk@redhat.com
>
