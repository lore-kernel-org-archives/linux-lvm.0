Return-Path: <oleg@bitband.com>
Message-ID: <3AB5C7F4.A9CCCB0B@bitband.com>
Date: Mon, 19 Mar 2001 10:48:52 +0200
From: Oleg Volkov <oleg@bitband.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Apparent performance degradation for each PV with 
 striping
References: <3AB59501.FF6ED9F3@dataventures.com>
Content-Transfer-Encoding: 7bit
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Donald Thompson wrote:

> dd if=/dev/ide/host0/bus0/target0/lun0/disc of=/dev/null
> gave me around 5500 blocks read per second.
>
> lvcreate -i4 -I4 -L somesize vgname -n lvname
>
> My system:
>
> Linux 2.4.2
> Libc 2.1.3
> Debian Potato
> LVM 0.9.1_beta6 utilities and patch.
> ATA 100 IDE interfaces on MB
> idebus set to 66 in /etc/lilo.conf
> CPU is Athlon 1000mhz thunderbird
> 256 megs of RAM
>
> -Don
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

80G disks may be IBM or Maxtor disks ( right ? )
I had experience with IBM disks. A good stripe
size for them is 64k. I don't know about Maxtor disks
but you can play with stripe size around 64k also.

Basically 64k is a DMA buffer size and should be good.

So try to use -I64 not -I4.


--
Volkov Oleg
BitBand Technologies Ltd.
http://www.bitband.com
