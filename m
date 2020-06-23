References: <1643811.X513TT2pbd@localhost.localdomain>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <dff2c51f-70a9-3339-6fe8-06091608b572@redhat.com>
Date: Tue, 23 Jun 2020 22:28:42 +0200
MIME-Version: 1.0
In-Reply-To: <1643811.X513TT2pbd@localhost.localdomain>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Removing VG mappings using dmsetup tool
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Vojtech Juranek <vjuranek@redhat.com>
Cc: nsoffer@redhat.com

Dne 23. 06. 20 v 16:26 Vojtech Juranek napsal(a):
> Hi,
> I'm working on storage part of oVirt project [1]. Besides other options, we
> provide iSCSI storage for VMs. We create PV(s) on attached LUN(s), create
> volume group from this PV(s) and then create LVs on this VG as needed (each
> disk on its LV, similar there's dedicated LV for our metadata etc.). VG is
> what we call (block) storage domain.
> 
> When we remove storage domain we deactivate all LVs and remove LVs and VG from
> all hosts. However, when this fails (e.g. storage is for some reason
> unavailable), hosts are left with stale LVs and VG which can cause various
> issues for us. What we are going to do is to remove these stale VG mappings
> using dmsetup remove command (first we try to remove LVs using lvm, but if
> there are still some mappings, we will try to remove it using dmsetup).
> 
> I'd like to head your opinion on this approach. Is it wise to use dmsetup in
> such case? Or is there any better way how to handle such situations or remove
> stale mappings?

Hi

Of course you can remove 'stale' mapping with 'dmsetup remove' -
(after all lvm2 is doing basically very similar job like
'dmsetup create/remove/load/suspend/resume'....

BUT I'd probably focus rather on fixing your oVirt workflow - you should
not be 'losing' devices while you have activate mappings on them - that's
IMHO major desing flaw - you can very easily cause very SERIOUS damages
to your on disk data consistency - so disk would require serious fsck before 
reuse...

Note - you cannot 'remove' mappings 'in-use'  (aka open count of a device
is higher then 0  - see 'dmsetup info -c' output for this).
However you can replace such mapping with 'error' target - so the
underlaying device is relaxed - although we do not support this
in lvm2 - you would need to use 'dmsetup' for this (and open lvm2 RFE
if there would be some serious justifaction).

Regards

Zdenek
