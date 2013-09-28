Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r8S4wdPr028962
	for <linux-lvm@redhat.com>; Sat, 28 Sep 2013 00:58:39 -0400
Received: from mail-bk0-f47.google.com (mail-bk0-f47.google.com
	[209.85.214.47])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8S4wcAg006594
	for <linux-lvm@redhat.com>; Sat, 28 Sep 2013 00:58:38 -0400
Received: by mail-bk0-f47.google.com with SMTP id mx12so1245394bkb.34
	for <linux-lvm@redhat.com>; Fri, 27 Sep 2013 21:58:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5245A770.5000402@gathman.org>
References: <CAHuLeSktKr++TH6cqsaHYS9CEDNCm9DVYAy=f8nWPkz8vEpjFw@mail.gmail.com>
	<5245A770.5000402@gathman.org>
Date: Sat, 28 Sep 2013 12:58:37 +0800
Message-ID: <CAHuLeS=rvjFP2PoLE9D_erGpdWcdq0tVA-T31KDryKzavMXJxw@mail.gmail.com>
From: Justin Lee <justinlee5455@gmail.com>
Subject: Re: [linux-lvm] Continue an interrupted mirror sync?
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

2013/9/27 Stuart Gathman <stuart@gathman.org>:
> On 09/27/2013 05:26 AM, Justin Lee wrote:
>>
>> Hello,
>>
>> I would like to know If a mirror sync process is interrupted by some
>> uncontrollable reason, is it possible to continue the sync process
>> near the point where it was interrupted?
>>
>> Volume mirroring may take a long time to be done, if the connection of
>> the storage device is over an unreliable channel (such as SAN, iSCSI
>> or Fibre Channel) it is possible that ongoing sync will be interrupted
>> over and over again due to frequent connection loss so that the sync
>> will never complete...
>>
>> Has LVM existing solutions for the issue? Or any suggestion? Thank you!
>
> Pretty much the entire purpose of the mirror log is to accomplish this
> (track which blocks are in sync).  Is this a real problem you've encountered

Yes, it is a real problem from a new project assigned to me recently
(and I'm also new to LVM). If I remember/understand correctly, they
have tried to solve the problem by hacking the code in kernel space.
They seem to find something like checkpoint mechanism in the code and
tried to reduce the granularity of the checkpoint therefore the sync
progress interrupted by connection loss may be restored as much as
possible. Unfortunately, it didn't work and result in kernel panic.

> (mirror log is broken),

I'm not sure in what circumstances will mirror log be broken, and when
will a sync begin/end exactly. If LVM's persistent mirror log were
meant to keep sync progress, the log should not be broken or corrupted
in situations like sudden power loss or broken storage connection when
system is up again, I guess... (do we have some commands to verify
mirror log status?

> or a theoretical one?  If you created a mirror
> without a log, then yes, it pretty much has to start over each time.  A

...so if I run command like:
lvcreate --nosync ...
will it turn off the mirror log completely...? Or mirror log is forced
to be created whenever a logical volume is created...? (maybe ...
there is no way to turn it off?)

> compromise might be to keep the log in memory.  This would handle SAN
> storage going up and down, but would have to start over after a reboot.
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
