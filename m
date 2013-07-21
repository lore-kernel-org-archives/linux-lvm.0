Message-ID: <51EC3936.2020607@redhat.com>
Date: Sun, 21 Jul 2013 21:40:38 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CAGDaZ_o6but-O5r3k0omWhwYD9HC7zu+zZn5WinV_x=nJ4sdHA@mail.gmail.com>
	<51E51D8E.2000801@redhat.com>
	<CAGDaZ_rBC8G9i7brhto-+V4H3C77hVGJaecQZC6FF5A5mptBMQ@mail.gmail.com>
	<CAGDaZ_r8EzHgvXj3RM+FxJcjT0Hifz+OLGxgsvY8PDH41kNrwg@mail.gmail.com>
	<51EBBC47.4040508@redhat.com>
	<CAGDaZ_p9V8VySv_VKxuJLhnjDhZoJNtD60qDo67XTvqthkxoXA@mail.gmail.com>
In-Reply-To: <CAGDaZ_p9V8VySv_VKxuJLhnjDhZoJNtD60qDo67XTvqthkxoXA@mail.gmail.com>
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

Dne 21.7.2013 13:01, Raymond Jennings napsal(a):
> Do snapshots behave the same way as thin volumes wrt discards?
>
>
> On Sun, Jul 21, 2013 at 3:47 AM, Zdenek Kabelac <zkabelac@redhat.com
> <mailto:zkabelac@redhat.com>> wrote:
>
>     Dne 21.7.2013 09:10, Raymond Jennings napsal(a):
>
>         So can thin volumes support discards independently of the device
>         underneath them?
>
>         I expected fstrim to free space in the thin pool.
>
>
>     Yes - you are expecting it correctly.
>
>     Ignore is mostly usable in case you do not want to free already
>     provisioned space - which might be in certain cases better for performance.
>
>     But you need to use recent enough kernels and lvm2 tools - since discards
>     support required kernel updates.
>
>
> Kernel: 3.10.1-gento
> LVM2:  2.02.97
>
> Are these versions recent enough?

Nope - 2.02.98 has fixes for discards - it's been just introduced in 2.02.97 
and had some problems - possible those you can observe.

Zdenek
