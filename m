Received: from [10.34.131.225] (dhcp131-225.brq.redhat.com [10.34.131.225])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t518wGir030343
	for <linux-lvm@redhat.com>; Mon, 1 Jun 2015 04:58:17 -0400
Message-ID: <556C1EA8.8000208@redhat.com>
Date: Mon, 01 Jun 2015 10:58:16 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <877frou7fa.fsf@bluescreen303.nl>
In-Reply-To: <877frou7fa.fsf@bluescreen303.nl>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Cpy%Sync column - high disk activity after reboots
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

Dne 31.5.2015 v 16:51 Mathijs Kwik napsal(a):
> Hi all,
>
> I'm trying lvmcache and it seems to work ok. However, after every
> reboot, I notice quite a long period of disk activity. lvs gives me this
> output:
>
> % lvs
>    LV            VG       Attr       LSize   Pool    Origin                Data%  Meta%  Move Log Cpy%Sync Convert
>    btrfs-spinner bluebook Cwi-aoC--- 582,19g [cache] [btrfs-spinner_corig] 70,11  11,34           82,55
>
> The % gets lower over time and when it reaches 0 the disk activity goes
> back to normal.
>
> Is this to be expected/normal?
> It seems to me the entire cache is checked as if it wasn't cleanly
> closed on shutdown. I'm currently using writethrough and would like to
> make sure everything is ok before enabling writeback.


Hi

Cache is always flushing it's content to disk - so if you have the 'writeback' 
variant and there were some unwritten data which sits only in cache, they are 
automatically pushed to origin (cached) device - which is likely your disk 
activity.

Zdenek
