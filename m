Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1E8svH3019512
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Sun, 14 Feb 2016 03:54:57 -0500
Received: from mail-qg0-f42.google.com (mail-qg0-f42.google.com
	[209.85.192.42])
	by mx1.redhat.com (Postfix) with ESMTPS id D08EC3D7F14
	for <linux-lvm@redhat.com>; Sun, 14 Feb 2016 08:54:56 +0000 (UTC)
Received: by mail-qg0-f42.google.com with SMTP id y9so93036890qgd.3
	for <linux-lvm@redhat.com>; Sun, 14 Feb 2016 00:54:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20160210103248.GA3761@rh-vpn>
References: <CAGU4k=2NLJqM2P+_fNiOc82Ynfppk5qNShZsSVy4S=hJMxw7_A@mail.gmail.com>
	<CAAYit8T1Wh+zQT_fsEk88D=1hv2A=kLVGWQAcdccjzx5xPuh5g@mail.gmail.com>
	<20160208085601.GA1498@rh-vpn>
	<CAAYit8RBpYh-99ZkBU6UF5KA2eot19LbvzivVUnDOeaFSJ621g@mail.gmail.com>
	<20160210103248.GA3761@rh-vpn>
Date: Sun, 14 Feb 2016 16:54:56 +0800
Message-ID: <CAAYit8Q=MMrQ4kHucPHU9dg40YuMTb1KXgmdQpuAr5A+2W54EQ@mail.gmail.com>
From: "M.H. Tsai" <mingnus@gmail.com>
Subject: Re: [linux-lvm] Repair thin pool
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

2016-02-10 18:32 GMT+08:00 Joe Thornber <thornber@redhat.com>:
> Yep, I definitely want these for upstream.  Send me what you've got,
> whatever state it's in; I'll happily spend a couple of weeks tidying
> this.
>
> - Joe

The feature was completed & workable, but the code is based on v0.4.1.
I need some days to clean up & rebase. Please wait.

syntax:
thin_ll_dump /dev/mapper/corrupted_tmeta [-o thin_ll_dump.xml]
thin_ll_restore -i edited_thin_ll_dump.xml -E
/dev/mapper/corrupted_tmeta -o /dev/mapper/fixed_tmeta


Ming-Hung Tsai
