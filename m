Received: from localhost (unknown [10.33.36.75])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9C6AD5C28D
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2020 08:26:08 +0000 (UTC)
Date: Mon, 23 Mar 2020 08:26:08 +0000
From: Joe Thornber <thornber@redhat.com>
Message-ID: <20200323082608.7i6wzq2t3k24hzun@reti>
References: <CACRKOwz_fOJiTVhbUqJR_EaxrKbf2bk+wb6LYOy0yWDkvt+buw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRKOwz_fOJiTVhbUqJR_EaxrKbf2bk+wb6LYOy0yWDkvt+buw@mail.gmail.com>
Subject: Re: [linux-lvm] when bringing dm-cache online,
 consumes all memory and reboots
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

On Sun, Mar 22, 2020 at 10:57:35AM -0700, Scott Mcdermott wrote:
> have a 931.5 GibiByte SSD pair in raid1 (mdraid) as cache LV for a
> data LV on 1.8 TebiByte raid1 (mdraid) pair of larger spinning disk.
> these disks are hosted by a small 4GB big.little ARM system
> running4.4.192-rk3399 (armbian 5.98 bionic).  parameters were set
> with: lvconvert --type cache --cachemode writeback --cachepolicy smq
> --cachesettings migration_threshold=10000000

If you crash then the cache assumes all blocks are dirty and performs
a full writeback.  You have set the migration_threshold extremely high
so I think this writeback process is just submitting far too much io at once.

Bring it down to around 2048 and try again.

- Joe
