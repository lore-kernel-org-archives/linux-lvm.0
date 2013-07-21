Message-ID: <51EBBC47.4040508@redhat.com>
Date: Sun, 21 Jul 2013 12:47:35 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CAGDaZ_o6but-O5r3k0omWhwYD9HC7zu+zZn5WinV_x=nJ4sdHA@mail.gmail.com>
	<51E51D8E.2000801@redhat.com>
	<CAGDaZ_rBC8G9i7brhto-+V4H3C77hVGJaecQZC6FF5A5mptBMQ@mail.gmail.com>
	<CAGDaZ_r8EzHgvXj3RM+FxJcjT0Hifz+OLGxgsvY8PDH41kNrwg@mail.gmail.com>
In-Reply-To: <CAGDaZ_r8EzHgvXj3RM+FxJcjT0Hifz+OLGxgsvY8PDH41kNrwg@mail.gmail.com>
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

Dne 21.7.2013 09:10, Raymond Jennings napsal(a):
> So can thin volumes support discards independently of the device underneath them?
>
> I expected fstrim to free space in the thin pool.

Yes - you are expecting it correctly.

Ignore is mostly usable in case you do not want to free already provisioned 
space - which might be in certain cases better for performance.

But you need to use recent enough kernels and lvm2 tools - since discards 
support required kernel updates.

Upstream has this:

passdown   TRIM ->  thin-vol -> thin-pool -> PV
(if the PV doesn't support discard - you get kernel report error report
and it fallbacks to nopassdown behaviour)

nopassdown TRIM ->  thin-vol -> thin-pool

ignore     TRIM ->  thin-vol



Zdenek
