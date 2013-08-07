Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r77FDr0N014853
	for <linux-lvm@redhat.com>; Wed, 7 Aug 2013 11:13:53 -0400
Received: from mail-ea0-f178.google.com (mail-ea0-f178.google.com
	[209.85.215.178])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r77FDqew020831
	for <linux-lvm@redhat.com>; Wed, 7 Aug 2013 11:13:52 -0400
Received: by mail-ea0-f178.google.com with SMTP id a15so889608eae.23
	for <linux-lvm@redhat.com>; Wed, 07 Aug 2013 08:13:52 -0700 (PDT)
Message-ID: <5202642E.8060201@gmail.com>
Date: Wed, 07 Aug 2013 17:13:50 +0200
From: Zdenek Kabelac <zdenek.kabelac@gmail.com>
MIME-Version: 1.0
References: <20130806173719.GB15184@mail.waldi.eu.org>
	<52020FD1.2000004@redhat.com>
	<20130807123656.GA18854@mail.waldi.eu.org>
In-Reply-To: <20130807123656.GA18854@mail.waldi.eu.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Missing error handling in lv_snapshot_remove
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
To: LVM general discussion and development <linux-lvm@redhat.com>, waldi@debian.org

Dne 7.8.2013 14:36, Bastian Blank napsal(a):
> On Wed, Aug 07, 2013 at 11:13:53AM +0200, Zdenek Kabelac wrote:
>> Dne 6.8.2013 19:37, Bastian Blank napsal(a):
>>> I hold the cow device open so it will run into the error condition:
>>> | $ sleep 100 < /dev/mapper/vg-test_snap-cow&
>> You are breaking the lvm2 logic thus pushing the code to go through
>> unexpected error code path - user is never supposed to open so
>> called 'private' /dev/mapper/ devices.
>
> I'm a developer and use it to trigger an error condition. Please don't
> start with that crap about what a user should or should not do.

I'm just telling you where the development is focused on what are the rules 
here. Of course anyone open  lvm2 private device - but then you must not
be surprised it will fail.

>
>>> Then try to remove the LV:
>>> | $ lvremove vg/test_snap
>> With upstream lvm2 code - there is embedded 'retry' loop - so the removal
>> should be retried for couple times (controllable by lvm.conf).
>
> Please show that it actually does anything in this case. This is no
> condition that goes away, but a logic bug.

The point here is - that only known tool which breaks our rule and opens
lvm2 private devices even though we want them to be private (and we cannot
do that on kernel level since there is nothing like private device) is the 
udev. There are number of flags we try to avoid udev scanning - but
it's not perfect.

Otherwise if the root wants to shoot his feet - there are surely much more 
easier ways for system destruction than playing with lvm2 private device.

>> That's because udev WATCH rule might be fired basically anytime
>> after close of device opened in write mode - so it may happen lvm2
>> checks device is not opened and could be removed, but the udev WATCH
>> rules opens temporarily device and lvm2 then fails to remove device,
>> which has been previously detected as unused.
>
> There is not udevd running! Please explain how udev can be a problem in
> this case.

As said above - we expect only udev to open devices with our reserved 
suffixes.  Other usage is unexpected and unsupported.

>> There has been bug affecting cluster usage of exclusive snapshots in
>> pre .99 version - the order of taking locks for devices was not
>> correct, and if there
>> has  been clvmd restart during snapshot - it has caused some problems.
>
> Did you actually read the code? At least I can clearly see that the
> error logic is broken.

You are breaking to open doors - send a patch to improve error logic.

>> But for current (.99) code - in normal case the operation should
>> work properly. For any unpredictable errors -  lvm2 command should
>> print error message and it's up-to admin to fix dangling device and
>> table entries.
>
> It is up to LVM to not break the system with suspended devices.
>

Again - as said previously lvm2 should not be leaving suspended device,
but since there are more important bugs then fixing these in not likely to 
happen code path.

Zdenek
