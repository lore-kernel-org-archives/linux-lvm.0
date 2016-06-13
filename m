Received: from [10.34.131.9] (dhcp131-9.brq.redhat.com [10.34.131.9])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u5D8kmwH011917
	for <linux-lvm@redhat.com>; Mon, 13 Jun 2016 04:46:49 -0400
References: <575A2F24.2020906@gmail.com> <575B03AC.7070103@gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <008d5383-ca1f-2b25-4bd5-7d02971bd8ca@redhat.com>
Date: Mon, 13 Jun 2016 10:46:48 +0200
MIME-Version: 1.0
In-Reply-To: <575B03AC.7070103@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Running lvm2 regression tests
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
To: linux-lvm@redhat.com

Dne 10.6.2016 v 20:15 Bruce Dubbs napsal(a):
> Zdenek Kabelac wrote:
>> Bruce Dubbs wrote:
>>>
>>> I am having a problem with building LVM2.2.02.155 from source.
>>>
>>> Actually, the build is OK:
>>>
>>> ./configure --prefix=/usr       \
>>>              --exec-prefix=      \
>>>              --enable-applib     \
>>>              --enable-cmdlib     \
>>>              --enable-pkgconfig  \
>>>              --enable-udev_sync
>>>
>>> make
>>> sudo make install
>>>
>>> My problem comes when I try to run some checks:
>>>
>>> sudo make -k check_local
>>>
>>> In this case every test times out.  I killed the tests after two hours.
>>> The journal shows things like:
>>>
>>> ndev-vanilla:api/dbustest.sh started
>>> ndev-vanilla:api/dbustest.sh timeout
>
>> dbus support is highly experimental and likely full of bugs.
>> It's not even supported - it's purely  proof-of-concept.
>
>> For now  use  'make check_local S=dbustest'  to skip this one...
>
> I wasn't clear enough.  *ALL* the tests time out for me.
>
> As a test, I rebuilt the kernel enabling CONFIG_MAGIC_SYSRQ=y and the tests
> now work.  Too bad that this is not documented.  Perhaps a mention of the
> kernel requirements for the regression tests in the README or INSTALL files
> would be appropriate.
>

Hi

It's  unclear to me why  'sysrq' kernel support could change anything.
Test suite does  echo 't' to sysrq - in case of timeout - but purely to
capture machine state for analysis.

Also - lvm2 test suite is not a user-friendly installable app and certainly 
does require some 'know-how' to be executed in some usable way  - so it takes
some few more steps - like ensuring there are no other running daemons like 
lvmetad, lvmpoll and dmeventd in the system. Proper udev rules needs to be 
installed (to get cookie confirmation from udev) and of course whole test 
suite needs to be run as 'root'.

So it's mainly targeted to developers.

But it's great more people try to use it.

So - instead of checking whole test suite report result from:

# cd test
# make check_local T=basic VERBOSE=1

Regards

Zdenek
