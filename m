Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r77Cb1Qb024418
	for <linux-lvm@redhat.com>; Wed, 7 Aug 2013 08:37:01 -0400
Received: from mail.waldi.eu.org (moeglingen.blank.eu.org [82.139.201.30])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r77Caxjn001148
	for <linux-lvm@redhat.com>; Wed, 7 Aug 2013 08:37:00 -0400
Date: Wed, 7 Aug 2013 14:36:57 +0200
From: Bastian Blank <waldi@debian.org>
Message-ID: <20130807123656.GA18854@mail.waldi.eu.org>
References: <20130806173719.GB15184@mail.waldi.eu.org>
	<52020FD1.2000004@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <52020FD1.2000004@redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Wed, Aug 07, 2013 at 11:13:53AM +0200, Zdenek Kabelac wrote:
> Dne 6.8.2013 19:37, Bastian Blank napsal(a):
> >I hold the cow device open so it will run into the error condition:
> >| $ sleep 100 < /dev/mapper/vg-test_snap-cow&
> You are breaking the lvm2 logic thus pushing the code to go through
> unexpected error code path - user is never supposed to open so
> called 'private' /dev/mapper/ devices.

I'm a developer and use it to trigger an error condition. Please don't
start with that crap about what a user should or should not do.

> >Then try to remove the LV:
> >| $ lvremove vg/test_snap
> With upstream lvm2 code - there is embedded 'retry' loop - so the removal
> should be retried for couple times (controllable by lvm.conf).

Please show that it actually does anything in this case. This is no
condition that goes away, but a logic bug.

> That's because udev WATCH rule might be fired basically anytime
> after close of device opened in write mode - so it may happen lvm2
> checks device is not opened and could be removed, but the udev WATCH
> rules opens temporarily device and lvm2 then fails to remove device,
> which has been previously detected as unused.

There is not udevd running! Please explain how udev can be a problem in
this case.

> There has been bug affecting cluster usage of exclusive snapshots in
> pre .99 version - the order of taking locks for devices was not
> correct, and if there
> has  been clvmd restart during snapshot - it has caused some problems.

Did you actually read the code? At least I can clearly see that the
error logic is broken.

> But for current (.99) code - in normal case the operation should
> work properly. For any unpredictable errors -  lvm2 command should
> print error message and it's up-to admin to fix dangling device and
> table entries.

It is up to LVM to not break the system with suspended devices.

Bastian

-- 
Insufficient facts always invite danger.
		-- Spock, "Space Seed", stardate 3141.9
