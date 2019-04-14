MIME-Version: 1.0
References: <CAKM4AeyUFr1PQB8jSVR2iaa9tTozwij0cCOfFWdTaX+txru0mg@mail.gmail.com>
	<00ae05c4-5ad8-1137-076d-57a24f093fd3@redhat.com>
In-Reply-To: <00ae05c4-5ad8-1137-076d-57a24f093fd3@redhat.com>
From: Eric Ren <renzhengeek@gmail.com>
Date: Sun, 14 Apr 2019 15:30:19 +0800
Message-ID: <CAKM4Aew4cNU0_8mBYCXjxPOzDMUt8eGtJP5mjq3g3vUUPw6-rA@mail.gmail.com>
Subject: Re: [linux-lvm] lvcreate hangs forever and udev work timeout
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM2 development <lvm-devel@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

Hi,

The reason is found out, as you've predicted.

> is it because of slow read operation (i.e. some raid arrays are known to
> wake-up slowly)

The udev worker is blocked until timeout before killed, cause the
"blkid" in /usr/lib/udev/rules.d/13-dm-disk.rules is too slow because
of high IO load on the thin pool.

After remove this rule:

IMPORT{builtin}="blkid"

for testing, the problem cannot be reproduced any more.

But, we tried to increate udevd timeout to 5 min, the problem still
happens; with 10 min timeout, can workaround this problem.

From my understanding, the blkid will only read the fs superblock, why
it takes so long for a small IO to finish, even under high IO load?

Regards,
Eric
