Message-Id: <5.1.0.14.0.20020105005533.00bb8c28@pop.ihug.com.au>
From: Timshel Knoll <timshel@pobox.com>
Subject: Re: [linux-lvm] Fixing corrupted LVM PV headers?
In-Reply-To: <20020103142740.A12868@lynx.no>
References: <3C352FFF.1946.1910201@localhost>
    <3C352FFF.1946.1910201@localhost>
MIME-Version: 1.0
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Fri Jan  4 08:11:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Andreas Dilger <adilger@turbolabs.com>
Cc: linux-lvm@sistina.com

At 02:27 PM 3/01/2002 -0700, Andreas Dilger wrote:

>Well, this seems to become my specialty:
>
>- Look in include/linux/lvm.h for descriptions of the LVM metadata (see
>   pv_disk_t, lv_disk_t, vg_disk_t, etc)
>... etc

Thanks, this is exactly what I was looking for. I will try this over the next
few days and let you know how it went. Just need to find a web copy of
the kernel sources - mine were on my LVM /usr filesystem ... ;-/
Oh the irony ...

Cheers,

Timshel

Timshel Knoll <timshel@pobox.com>
Debian GNU/Linux developer, email <timshel@debian.org>
