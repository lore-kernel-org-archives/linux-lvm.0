Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Thu, 31 May 2001 16:52:52 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Severe bug in kernel-2.4.4 lvm
Message-ID: <20010531165252.F517@tykepenguin.com>
References: <Pine.LNX.4.32.0105311616080.3682-100000@falka.mfa.kfki.hu> <20010531161155.A1352@66bassett.freeserve.co.uk>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010531161155.A1352@66bassett.freeserve.co.uk>; from thornber@btconnect.com on Thu, May 31, 2001 at 04:11:55PM +0100
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, May 31, 2001 at 04:11:55PM +0100, Joe Thornber wrote:
> 
> --- /usr/src/linux/drivers/md/lvm-fs.c  Thu May 31 15:48:03 2001
> +++ /tmp/linux/drivers/md/lvm-fs.c      Thu May 31 15:48:17 2001
> @@ -577,7 +572,7 @@
>         allocation_flag = 'A';
>         if (!(pv->pv_allocatable & PV_ALLOCATABLE))
>                 allocation_flag = 'N';
> -       pv_name = strchr(pv->pv_name+1,'/');
> +       pv_name = strrchr(pv->pv_name+1,'/');
>         if ( pv_name == 0) pv_name = pv->pv_name;
>         else               pv_name++;
>         sz = sprintf(buf,

That one's mine - strchr is right(one r in the middle), otherwise devfs users
just get names like "part1" and "disc"(sic) in /proc/lvm rather than long
device names.

patrick
