Message-ID: <51DBDDE8.3010206@redhat.com>
Date: Tue, 09 Jul 2013 11:54:48 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CAKAA-nmORsWxeOX1O0Hnv6nFx_1nM41CUULk15biAfuderXmGg@mail.gmail.com>
In-Reply-To: <CAKAA-nmORsWxeOX1O0Hnv6nFx_1nM41CUULk15biAfuderXmGg@mail.gmail.com>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Micky <mickylmartin@gmail.com>

Dne 9.7.2013 03:37, Micky napsal(a):
> On a machine, where weekly snapshots are created for dumping raw data,
> the overall disk i/o has drastically degraded to few megabytes per
> second. It is quite random and so slow that commands freeze often.
>
> I was using chunk size of 512K and same byte size with dd.
>
> Is it quite common; I read that such freezes require a reboot. Is
> there a way to avert?
> What am I missing here?

Is this supposed to be a bug report ?

I need crystal ball first ;)

So far I've no idea about disks/tables in use, system/kernel in use, lvm 
version in use....

Zdenek
