References: <66e4dbc1-ca00-3abf-5100-d19f7439a281@magenta.tv>
	<6e53a6f7-9896-2905-92ad-6b9c36f565ab@redhat.com>
	<39a2408c600ed4caf00724eb72c191c2@assyoma.it>
	<326c998e-67f8-6331-c8f1-a22e8c06fd98@redhat.com>
	<c351a57bdcf219c04b315aa02b6207ea@assyoma.it>
	<CAG+REr=gFS_3YMo_6s5K32w=ibntEshE7VBOy-7Vt2c7Psi_kQ@mail.gmail.com>
	<213e498ea447f141c7a975c13416281e@assyoma.it>
	<CAG+RErkPfHbBGS9p90nu_mFErMsPQanPwEYz24DP5Yh3jQUBKg@mail.gmail.com>
	<880611df631d8ad243b8c2974102bce8@assyoma.it>
	<6946bbe9-3073-da99-b7d1-bceb978344a3@magenta.tv>
	<20180718145810.GF12563@bogon.ca>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <a909ea33-ab62-e637-d3c1-66ad70bd87ed@redhat.com>
Date: Mon, 21 Jan 2019 21:19:52 +0100
MIME-Version: 1.0
In-Reply-To: <20180718145810.GF12563@bogon.ca>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Unable to un-cache logical volume when chunk size
	is over 1MiB
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Douglas Paul <doug@bogon.ca>

Dne 18. 07. 18 v 16:58 Douglas Paul napsal(a):
> On Wed, Jul 18, 2018 at 03:25:10PM +0100, Ryan Launchbury wrote:
>> Does anyone have any other ideas or potential workarounds for this issue?
>>
>> Please let me know if you require more info.
> 
> I didn't see this in the previous messages, but have you tried temporarily
> remounting the filesystems read-only if you can't unmount them?
> 
> Also, earlier you mentioned looking at /var/log/dmesg for write errors.  On
> my systems, that only contains a snapshot at boot. I have to run dmesg to
> see the latest updates. It seems suspicious to have nothing in the dmesg
> during 61 days past 10 seconds after system boot ...
> 

Hi

So this should help:

lvchange --cachesettings  migration_threshold=16384 vg/cacheLV

the problem was the usage of unexpectedly big chunk sizes,
that are used when cache-pool size is big (>TiB) and chunksizes
are  >= 1MiB.

Upstream has committed patches for automatic protection against too small
migration threshold.


Zdenek
