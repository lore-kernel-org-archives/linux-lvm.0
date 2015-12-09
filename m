Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tB9LaE5J019112
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Wed, 9 Dec 2015 16:36:14 -0500
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mx1.redhat.com (Postfix) with ESMTPS id 7000532D3B2
	for <linux-lvm@redhat.com>; Wed,  9 Dec 2015 21:36:13 +0000 (UTC)
Received: by wmww144 with SMTP id w144so91791024wmw.0
	for <linux-lvm@redhat.com>; Wed, 09 Dec 2015 13:36:12 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <000b01d1312a$8f8105c0$ae831140$@helmholtz-muenchen.de>
References: <02c701d13102$e0027c90$a00775b0$@helmholtz-muenchen.de>
	<000b01d1312a$8f8105c0$ae831140$@helmholtz-muenchen.de>
Date: Wed, 9 Dec 2015 18:52:45 +0100
Message-ID: <CAAxjCExKV0Dq1nx974s274jbZ+UN5B7syu2ZTeVKSwwFnjDYLg@mail.gmail.com>
From: Stefan Ring <stefanrin@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] backup with snapshots - some principal questions
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

On Mon, Dec 7, 2015 at 9:05 PM, Lentes, Bernd
<bernd.lentes@helmholtz-muenchen.de> wrote:
> What does the message " ext3_orphan_cleanup: deleting unreferenced inode
> xxxxxx" means ?
> And it appears always when the script runs.

I'm not entirely sure, but I would guess that these are deleted files
that were kept alive by some process holding them open at the time the
snapshot was taken. Since this unreferenced space would be leaked in
the event of a system crash – and snapshotting behaves essentially
like a crash –, the log recovery routine cleans them up during mount.
