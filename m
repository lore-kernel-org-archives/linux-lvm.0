Message-ID: <51E99A85.8060901@redhat.com>
Date: Fri, 19 Jul 2013 21:59:01 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <51E981EF.3020007@gmail.com>
In-Reply-To: <51E981EF.3020007@gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] pvmove
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
Cc: Martin Papik <mp6058@gmail.com>

Dne 19.7.2013 20:14, Martin Papik napsal(a):
> Hi everyone
>
> I'm new to the mailing list but not to LVM, until now everything was crystal
> clear and working fine. Now I'm either stuck or found a minor issue. I'm
> trying to move move extents on a physical volume. Not from one physical volume
> to another.
>
> root@myhost# pvmove  /dev/md127:151808-152063 /dev/md127:152064-152319
>    No extents available for allocation
> root@myhost#

Add  --alloc anywhere

But I assume the tool could be a bit more smarter here.
It looks more or less like a bug to me.

Zdenek
