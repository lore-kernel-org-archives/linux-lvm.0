Received: from lacrosse.corp.redhat.com (lacrosse.corp.redhat.com
	[172.16.52.154])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l09N7llp013691
	for <linux-lvm@redhat.com>; Tue, 9 Jan 2007 18:07:47 -0500
Received: from vpn-14-149.rdu.redhat.com (vpn-14-149.rdu.redhat.com
	[10.11.14.149])
	by lacrosse.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	l09N7k14030366
	for <linux-lvm@redhat.com>; Tue, 9 Jan 2007 18:07:47 -0500
Subject: Re: [linux-lvm] lvextend Insufficient free space
From: Dave Wysochanski <dave.wysochanski@redhat.com>
In-Reply-To: <5adb39f00701082249g3a13757csf27383fa9a27e53d@mail.gmail.com>
References: <5adb39f00701082249g3a13757csf27383fa9a27e53d@mail.gmail.com>
Date: Tue, 09 Jan 2007 18:07:49 -0500
Message-Id: <1168384069.4283.87.camel@linux-cxyg.rtp.netapp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On Mon, 2007-01-08 at 22:49 -0800, David Tran wrote:
> Hi, 
> What wrong with my command line? Please help.
> OR
> This is a bug?
> 
> linux-server:/ # vgdisplay
>   --- Volume group ---
>   VG Name               gdata
>   System ID             
>   Format                lvm2 
>   Metadata Areas        3
>   Metadata Sequence No  5
>   VG Access             read/write
>   VG Status             resizable
>   MAX LV                0
>   Cur LV                3
>   Open LV               3
>   Max PV                0
>   Cur PV                3
>   Act PV                3
>   VG Size               544.62 GB
>   PE Size               4.00 MB
>   Total PE              139424
>   Alloc PE / Size       100148 / 391.20 GB
>   Free  PE / Size       39276 / 153.42 GB
>   VG UUID               gROPCK-xUmS-Tk99-nTmp-S63F-otHE-9QJukD
> -------------------------------------------------------------
> /////// So I have 153.42 GB free space NOW
> -------------------------------------------------------------
> linux-server:/ # lvextend -L +100G /dev/gdata/priv
>   Extending logical volume priv to 177.80 GB
>   Insufficient free space: 45517 extents needed, but only 39276
> available
> 

What is the output of these cmds:
uname -a; lvm version; lvdisplay --maps

It might be a bug.
