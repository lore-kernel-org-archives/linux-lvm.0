Message-ID: <51ED0678.1020703@redhat.com>
Date: Mon, 22 Jul 2013 12:16:24 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CAGDaZ_o6but-O5r3k0omWhwYD9HC7zu+zZn5WinV_x=nJ4sdHA@mail.gmail.com>
	<51E51D8E.2000801@redhat.com>
	<CAGDaZ_rBC8G9i7brhto-+V4H3C77hVGJaecQZC6FF5A5mptBMQ@mail.gmail.com>
	<CAGDaZ_r8EzHgvXj3RM+FxJcjT0Hifz+OLGxgsvY8PDH41kNrwg@mail.gmail.com>
	<51EBBC47.4040508@redhat.com>
	<CAGDaZ_p9V8VySv_VKxuJLhnjDhZoJNtD60qDo67XTvqthkxoXA@mail.gmail.com>
	<51EC3936.2020607@redhat.com> <51ECFFA6.7010905@redhat.com>
	<CAGDaZ_rkTHaq3dr9BQ50=cOtErYepMb0V96uszjb+gsrp_sqBw@mail.gmail.com>
In-Reply-To: <CAGDaZ_rkTHaq3dr9BQ50=cOtErYepMb0V96uszjb+gsrp_sqBw@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] thin discards
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
To: Raymond Jennings <shentino@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Dne 22.7.2013 12:12, Raymond Jennings napsal(a):
> I tried to run a fstrim on a mounted snapshot (regular snapshot, not thin
> snapshot) and got zip.
>

I've been talking about  thin snapshots.

Of course - for old non-thin snapshot - TRIM is not supported.
(And it doesn't look like anything simple to implement)

Zdenek


>
>
> On Mon, Jul 22, 2013 at 2:47 AM, Zdenek Kabelac <zkabelac@redhat.com
> <mailto:zkabelac@redhat.com>> wrote:
>
>     Dne 21.7.2013 21:40, Zdenek Kabelac napsal(a):
>
>         Dne 21.7.2013 13:01, Raymond Jennings napsal(a):
>
>             Do snapshots behave the same way as thin volumes wrt discards?
>
>
>     Yes, snapshots are just like any other thin volumes.
>
>     Just a side note - until I think 3.9 kernel there used to be
>     bug, which had wrong ref-counting of shared blocks.
>
>     Zdenek
>
>
