References: <CAKxE60wD76RnJ=Zk690C5vajHjg3xuLANOoRih42VRQKrCriPw@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <7971eb95-828e-37d5-b5fe-9bc67fccc29f@redhat.com>
Date: Wed, 28 Oct 2020 21:15:35 +0100
MIME-Version: 1.0
In-Reply-To: <CAKxE60wD76RnJ=Zk690C5vajHjg3xuLANOoRih42VRQKrCriPw@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] [PATCH] man: document that 2 times poolmetadatasize
 is allocated for lvmthin
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Scott Moser <smoser@brickies.net>

Dne 20. 10. 20 v 21:19 Scott Moser napsal(a):
> diff --git a/man/lvmthin.7_main b/man/lvmthin.7_main
> index ce2343183..e21e516c9 100644
> --- a/man/lvmthin.7_main
> +++ b/man/lvmthin.7_main
> @@ -1101,6 +1101,11 @@ specified with the --poolmetadatasize option.
> When this option is not
>   given, LVM automatically chooses a size based on the data size and chunk
>   size.
> 
> +The space allocated by creation of a thinpool will include
> +a spare metadata LV by default (see "Spare metadata LV").  As a result,
> +the VG must have enough space for the --size option plus twice
> +the specified (or calculated) --poolmetadata value.



Hi

The patch is unfortunately not really precise.

This applies only when you allocate first pool type volume in a VG.

IMHO better is to refer directly into 'lvmthin' man page for closer detail
if user is interested.

Majority of users simply does not care about negligible size of metadata
volume, so the information is rather for very experienced users and
should be in some dedicated section for them.

Regards

Zdenek
