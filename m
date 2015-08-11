Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t7BEsddN032500
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 11 Aug 2015 10:54:39 -0400
Received: from mail-wi0-f177.google.com (mail-wi0-f177.google.com
	[209.85.212.177]) by mx1.redhat.com (Postfix) with ESMTPS id 29C8863
	for <linux-lvm@redhat.com>; Tue, 11 Aug 2015 14:54:38 +0000 (UTC)
Received: by wijp15 with SMTP id p15so179986884wij.0
	for <linux-lvm@redhat.com>; Tue, 11 Aug 2015 07:54:36 -0700 (PDT)
Message-ID: <55CA0D11.1080205@siteground.com>
Date: Tue, 11 Aug 2015 17:56:17 +0300
From: vaLentin chernoZemski <valentin@siteground.com>
MIME-Version: 1.0
References: <55C86723.4000707@siteground.com>
	<20150810174900.GC22719@redhat.com>
	<55C9AD4F.5050900@siteground.com>
	<20150811143526.GB29369@redhat.com>
In-Reply-To: <20150811143526.GB29369@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvremove does not pass discards if volume is part
	of thin pool
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
To: Mike Snitzer <snitzer@redhat.com>
Cc: Peter Rajnoha <prajnoha@redhat.com>, linux-lvm@redhat.com

Thanks for getting back to me again Mike.

On 08/11/15 17:35, Mike Snitzer wrote:
> On Tue, Aug 11 2015 at  4:07am -0400,
> vaLentin chernoZemski <valentin@siteground.com> wrote:
>
>>> Plese verify your kernel has this commit:
>>> 19fa1a6756e ("dm thin: fix discard support to a previously shared block")
>>>
>>> But it doesn't look like you're using snapshots so this may not matter.
>>
>> The kernel we are using includes the changes listed in that commit.
>>
>>> If you do have the patch I referenced above then something else is going
>>> on.  You should probably run with: lvremove -vvvv to see if lvm is
>>> actually issuing a discard.  Or you could use blktrace to see if the
>>> thin device you're removing is actually receiving a discard.
>>
>> lsblk -D shows DISC-ZERO as 1 for loop dev, thingroup_tmeta and
>> thingroup_tdata
>>
>> However it shows DISC-ZERO as 0 for thingroup-tpool in both tmeta
>> and tdata sections and all its child devices.
>
> DISC-ZERO is discard_zeroes_data.  DM thinp disables that.  It doesn't
> mean discard aren't enabled.  DISC-MAX and DISC-GRAN would need to be 0
> for discards to be disabled.

Understood.

>
>> It appears to me that for some reason device mapper or kernel (not
>> sure which should do that) are not advertising _tpool_ tmeta and
>> tdata devices to support discards (as confirmed by lsblk). That's
>> why during lvremove lvm skips issuing discards on those devices.
>
> Nope, that isn't it.  The pool and thin device are advertising
> discards.  You should verify that the pool is configured to passdown
> discards to the underlying loop device.  Run: dmsetup table
> You should see 'discard_passdown' -- which gets enabled by default if
> the thin-pool's underlying data device supports discards.

passdown was already set in lvm.conf. I forgot to mention that:

Here is a snip:

grep passdown /etc/lvm/lvm.conf
     # Select one of  "ignore", "nopassdown", "passdown"
     thin_pool_discards = "passdown"

dmsetup table yields the following for testgroup:

testgroup-thingroup: 0 20598784 linear 253:35 0
testgroup-thingroup-tpool: 0 20598784 thin-pool 253:33 253:34 128 0 1 
skip_block_zeroing
testgroup-thingroup_tdata: 0 20598784 linear 7:2 24576
testgroup-thingroup_tmeta: 0 20480 linear 7:2 20623360
testgroup-testvol: 0 409600 thin 253:35 1

>> The only references in lvremove -f -vvvv that are stating discards are those
>>
>> #libdm-deptree.c:2681     Suppressed testgroup-thingroup (253:36)
>> identical table reload.
>> #ioctl/libdm-iface.c:1795         dm status   (253:35) ON   [16384] (*1)
>> #libdm-deptree.c:1444         Thin pool transaction id: 3 status: 3
>> 32/2560 1679/160928 - rw discard_passdown.
>> #ioctl/libdm-iface.c:1795         dm message   (253:35) OF  delete 1
>> [16384] (*1)
>> #ioctl/libdm-iface.c:1795         dm message   (253:35) OF
>> set_transaction_id 3 4 [16384] (*1)
>> #ioctl/libdm-iface.c:1795         dm status   (253:35) ON   [16384] (*1)
>> #libdm-deptree.c:1444         Thin pool transaction id: 4 status: 4
>> 18/2560 0/160928 - rw discard_passdown.
>> #activate/dev_manager.c:3127         Creating CLEAN tree for thingroup.
>> #activate/dev_manager.c:1789         Getting device info for
>> testgroup-thingroup [LVM-qg1G3n02Kkjm0KKnhGhzP7JfoeGiiemlrsYfP0Ti5MCUiiPOWhTxoyRlvclhd3EH-pool]
>> #ioctl/libdm-iface.c:1795         dm info LVM-qg1G3n02Kkjm0KKnhGhzP7JfoeGiiemlrsYfP0Ti5MCUiiPOWhTxoyRlvclhd3EH-pool
>> OF   [16384] (*1)
>> #ioctl/libdm-iface.c:1795         dm deps   (253:36) OF   [16384] (*1)
>> #ioctl/libdm-iface.c:1795         dm deps   (253:35) OF   [16384] (*1)
>> #ioctl/libdm-iface.c:1795         dm deps   (253:34) OF   [16384] (*1)
>> #ioctl/libdm-iface.c:1795         dm deps   (253:33) OF   [16384] (*1)
>
> Looking above it is clear that discard_passdown _is_ enabled.

Got that.

> I'll have to defer to the lvm2 developers, I thought we added explicit
> logging when lvm2 issues discards (as part of lvremove, etc) -- Peter,
> and/or Alasdair?

Once again I want to mention that discard issued by deleting file in a 
mount point reaches blockdev and sparse file shrinks in size just as 
expected.

However the problem is that if I am using lvremove even there are no 
parent snapshots, size of sparse file remains unchanged.

Let me know if there is anything else I can try or if I can pass you 
additional information.

Still did not have the chance to test all latest versions of kernel dm, 
dm libs and lvm.

vaLentin
