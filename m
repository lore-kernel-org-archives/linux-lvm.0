MIME-Version: 1.0
In-Reply-To: <51DC28B9.2040906@redhat.com>
References: <CAKAA-nmORsWxeOX1O0Hnv6nFx_1nM41CUULk15biAfuderXmGg@mail.gmail.com>
	<51DBDDE8.3010206@redhat.com>
	<CAKAA-nnZUvBuHmRaD9mn19gC51GfiihmweaJXTDRfRN92mstag@mail.gmail.com>
	<51DBFFC4.6070501@redhat.com>
	<CAKAA-nk2wszQn3QYz6QW3GPf+MB07TD2C3iA97OJZQtBU27WAA@mail.gmail.com>
	<51DC0E38.7060903@redhat.com>
	<CAKAA-nkJOgQtjmQwaFg0bBvDABf9j-VxmfvM-ZsU35mn2Tf+vQ@mail.gmail.com>
	<51DC1BBF.9090405@redhat.com>
	<CAKAA-nn7tU9-U_BFMqtgybDCuGY0Qj8=jhzLqtxpi=SJiQks_w@mail.gmail.com>
	<51DC28B9.2040906@redhat.com>
Date: Tue, 9 Jul 2013 20:26:26 +0500
Message-ID: <CAKAA-nn4S+ypzJNd8KV6CHouiK=H0e2-FSCp-68Q79AWYmMUQw@mail.gmail.com>
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: Marian Csontos <mcsontos@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

> Well it's getting better every day (literally :)) (using git repo)
> The upstream is heavily moving towards some better automated support
> for recovery.
>
> You could download tools which are being extensively tested for recovery,
> lvm will create pool metadata spare LVs  for automated recovery
>
> So you have some choices:
> - very fast snaps - and harder recovery in case of hw fault
>
> - very slow snaps - but you could count on good old 'proven' technology.
>   (though you still could have fun with i.e. invalidated snaps)
>
> - write your own dm target to cover your needs.
>
> - using btrfs?
>


Quite fascinating. Definitely a new dimension and project seems
heading in right direction, there's no doubt. I already have had fun
(recently autoextend died on me after few extensions).

It might change the topic but I am just gonna put it out. THE Future
looks promising but that's what they said about KVM too (wink wink)!
