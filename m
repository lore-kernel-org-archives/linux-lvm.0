Message-ID: <51E51D8E.2000801@redhat.com>
Date: Tue, 16 Jul 2013 12:16:46 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CAGDaZ_o6but-O5r3k0omWhwYD9HC7zu+zZn5WinV_x=nJ4sdHA@mail.gmail.com>
In-Reply-To: <CAGDaZ_o6but-O5r3k0omWhwYD9HC7zu+zZn5WinV_x=nJ4sdHA@mail.gmail.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Raymond Jennings <shentino@gmail.com>

Dne 15.7.2013 17:32, Raymond Jennings napsal(a):
> I tried to run an fstrim on a mounted thin volume, but got FITRIM:  operation
> not supported.
>
> Did I screw up or something?


Is the pool device capable of TRIM support ?

Which version of lvm2 and kernel is in use ?


Zdenek
