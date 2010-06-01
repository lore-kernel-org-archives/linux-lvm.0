Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o51E0VYw020079
	for <linux-lvm@redhat.com>; Tue, 1 Jun 2010 10:00:32 -0400
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.211.196])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o51E0KJ9009364
	for <linux-lvm@redhat.com>; Tue, 1 Jun 2010 10:00:20 -0400
Received: by ywh34 with SMTP id 34so3747484ywh.30
	for <linux-lvm@redhat.com>; Tue, 01 Jun 2010 07:00:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1275400469.25384.0@raydesk1.bettercgi.com>
References: <A7A5455753145049A5860984ED9BFF5627598C6F19@GVW0547EXC.americas.hpqcorp.net>
	<AANLkTim3bctwpuF8_dEKt_Y66cWn7SK2Zmg78S2Z4YHh@mail.gmail.com>
	<1275400469.25384.0@raydesk1.bettercgi.com>
Date: Tue, 1 Jun 2010 23:00:19 +0900
Message-ID: <AANLkTimfMqOvCxs3mAHB7drr7SFD7B1m2ukqQVVQdTF5@mail.gmail.com>
From: Romeo Theriault <romeo.theriault@maine.edu>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Is it possible to bypass LVM and mount contained
	partition directly?
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

On Tue, Jun 1, 2010 at 22:54, Ray Morris <support@bettercgi.com> wrote:
>> I'll only be able to have one restore at a time happening,
>> since almost all our linux vm's have the same named VG's
>> and LV's
>
> � Fedora used to by default name the VG for every machine
> volgroup001 or something like that. �They then changed to
> naming it after the machine, I believe. �You are discovering
> one of the reasons why having them all named the same is a
> bad idea. �When a SAN is involved, one can of course envision
> several other problems limits on future usage. �Your best course
> of action may be to eliminate the root cause and rename the
> source VGs.

Hmmm, interesting solution. I like it, though it's going to take some
work to get all the VM's changed...

Thanks!
