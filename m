MIME-Version: 1.0
In-Reply-To: <51DBFFC4.6070501@redhat.com>
References: <CAKAA-nmORsWxeOX1O0Hnv6nFx_1nM41CUULk15biAfuderXmGg@mail.gmail.com>
	<51DBDDE8.3010206@redhat.com>
	<CAKAA-nnZUvBuHmRaD9mn19gC51GfiihmweaJXTDRfRN92mstag@mail.gmail.com>
	<51DBFFC4.6070501@redhat.com>
Date: Tue, 9 Jul 2013 17:43:54 +0500
Message-ID: <CAKAA-nk2wszQn3QYz6QW3GPf+MB07TD2C3iA97OJZQtBU27WAA@mail.gmail.com>
From: Micky <mickylmartin@gmail.com>
Subject: Re: [linux-lvm] Very slow i/o after snapshotting
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
To: Marian Csontos <mcsontos@redhat.com>
Cc: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

Thanks for the quick response.

It is working fine without the LVM. It is just the snapshot which
makes the things slow. For instance, take a snapshot of an LV that's
running a DomU -- after that point on, the load inside that DomU will
start to increase until the snapshot is removed. Same is with KVM. The
only difference without hypervisor is, it is not terribly slow but
still lags, like, you get 15MB/s after snapshot and ~90-100MB/s
without snapshot being on the same volume!

Even SSH becomes slow, output freezes and you get sudden outbursts
after a few seconds.

As for the reason of copying big chunks out of LVs -- it is simple --
copy on write magic as short term image backup strategy! But I
realized that the magic with LVM comes with a price and that is I/O
latency ;)
