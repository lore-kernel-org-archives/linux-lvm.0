Received: from [10.34.131.138] (dhcp131-138.brq.redhat.com [10.34.131.138])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u0FBrWRa001099
	for <linux-lvm@redhat.com>; Fri, 15 Jan 2016 06:53:33 -0500
References: <CAJbEnTzHEWiFB9LAhvqWwiX4kUXwjLvBZf8Ek4cdVmD1=kG4EQ@mail.gmail.com>
	<CAJbEnTxMa=LSk+=55oUko7vQ9m8qOLJpu-WBsEh5nOA2ooiRew@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <5698DDBC.5020500@redhat.com>
Date: Fri, 15 Jan 2016 12:53:32 +0100
MIME-Version: 1.0
In-Reply-To: <CAJbEnTxMa=LSk+=55oUko7vQ9m8qOLJpu-WBsEh5nOA2ooiRew@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] device failure during pvmove
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 15.1.2016 v 03:29 Bryan Larsen napsal(a):
> On Thu, 14 Jan 2016 at 20:38 Bryan Larsen <bryan@larsen.st
> <mailto:bryan@larsen.st>> wrote:
>
>     I was in the process of doing a pvmove from /dev/md3 to a new, blank
>     /dev/md1 when /dev/md1 failed due to operator stupidity.
>
>     I tried doing a pvmove abort, but it complains about a missing device.
>     It suggests doing a vgreduce --removemissing but that refuses to proceed
>     without a --force because pvmove has placed data onto the broken and
>     missing /dev/md1.
>
>     So theoretically all my data should still be available on /dev/md3.   Any
>     hints on how to proceed?
>
>
> I solved the problem.   I did a vgcfgdump, carefully edited the resulting
> file, and used vgcfgrestore to bring things back to life.
>

If you have enabled  archiving - you could use archived metadata before
you started pvmove.


Also if you have 'recent enough' version of lvm2 -  check '--atomic' option
for pvmove.

Regards

Zdenek
