MIME-Version: 1.0
In-Reply-To: <51DC2B98.5020406@redhat.com>
References: <CAKAA-nmORsWxeOX1O0Hnv6nFx_1nM41CUULk15biAfuderXmGg@mail.gmail.com>
	<51DBDDE8.3010206@redhat.com>
	<CAKAA-nnZUvBuHmRaD9mn19gC51GfiihmweaJXTDRfRN92mstag@mail.gmail.com>
	<51DBFFC4.6070501@redhat.com>
	<CAKAA-nk2wszQn3QYz6QW3GPf+MB07TD2C3iA97OJZQtBU27WAA@mail.gmail.com>
	<51DC0E38.7060903@redhat.com>
	<CAKAA-nkJOgQtjmQwaFg0bBvDABf9j-VxmfvM-ZsU35mn2Tf+vQ@mail.gmail.com>
	<51DC1BBF.9090405@redhat.com>
	<CAKAA-nn7tU9-U_BFMqtgybDCuGY0Qj8=jhzLqtxpi=SJiQks_w@mail.gmail.com>
	<51DC2B98.5020406@redhat.com>
Date: Tue, 9 Jul 2013 20:35:09 +0500
Message-ID: <CAKAA-nmRjbBN1T9g=fwhJQGyriOJK4vR7L2uQzAFw5maPKFEMQ@mail.gmail.com>
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

> You could still try to allocate the snapshot on another HDD if possible to
> see if HDD seektime may be the issue. Still the performance should not be
> degraded that drastically.

How does that work?
lvcreate -n name -L size VG pv ?


> What does the `lsblk -t` say? Could be an alignment issue.

0 through 31

> What's `free` saying about the free memory and cache? (dmeventd on 6.4 is
> trying to lock a large chunk of address space in RAM (~100M)

Cached mem looks good.
Dmeventd. Right. It is. Isn't it spawed everytime an LV is created?
root      6813  0.0  1.4 197056 11044 ?        S<s  May26   2:44 /sbin/dmeventd
