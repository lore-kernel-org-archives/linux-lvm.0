References: <D2CA32A7-3D9D-4490-9B42-89DC00E163FE@gmail.com>
	<8B290F6D-9D0B-4186-9F17-AAAB0BFA8DDA@gmail.com>
	<9ce05dc0-25f9-cf62-3d7d-3911a7df90ea@redhat.com>
	<EE5C3FCA-1A0B-4518-927D-5108F109F5AA@gmail.com>
	<8489c3df-e12a-f343-212b-20b2f898b642@redhat.com>
	<B48327FD-46A3-4E49-8A71-44B21FA912AB@gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <71307c53-7728-090e-bead-de069cb1b892@redhat.com>
Date: Mon, 9 Dec 2019 15:25:42 +0100
MIME-Version: 1.0
In-Reply-To: <B48327FD-46A3-4E49-8A71-44B21FA912AB@gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Thin pool vg1-thinpool1-tpool (253:3)
 transaction_id is 549, while expected 505.
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?Q?=c5=81ukasz_Czerpak?= <lukasz.czerpak@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dne 09. 12. 19 v 15:18 Łukasz Czerpak napsal(a):
> hi,
> 
> Sure, I will update the kernel as per your recommendation. Thank you for help 
> and prompt replies!
> In regards to “sharing thin-pool” - there are no VMs, only LXD that is using 
> VG and thin-pool. After digging more I found relevant article:
> 
> https://discuss.linuxcontainers.org/t/is-it-safe-to-create-an-lvm-backed-storage-pool-that-can-be-shared-with-other-logical-volumes/5658/5
> 
> This might be the reason. I will investigate it more and share results here.

Usage of any containers with DM is seriously non-trivial task (especially if 
you are dealing with anything more complex then 'linear' dm target).

Linux device is not a containerized resource a there need to exist something 
like a 'cluster locking' mechanism how to manipulate with devices and metadata.

If you are on a single host - there is used 'file locking' - but if you start 
to manipulate lvm2 metadata from multiple containers at the same time - 
without 'locking' mechanism between all commands - it will soon go ballistic 
and explode...  (and it's actually weird you managed to go as high as 500 
transactions without noticing problem...)

Zdenek
