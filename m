Return-Path: <weissel@netcologne.de>
From: Wolfgang Weisselberg <weissel@netcologne.de>
Date: Thu, 26 Jul 2001 13:36:32 +0200
Subject: Re: [linux-lvm] lvm on root
Message-ID: <20010726133632.A26425@tiger.bigcats.invalid>
References: <Pine.LNX.4.33.0107251827170.28361-100000@willow.nutstreet.net> <Pine.LNX.4.33.0107260038030.3644-100000@greebo.foobarhouse.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0107260038030.3644-100000@greebo.foobarhouse.com>; from jamesp@foobarhouse.com on Thu, Jul 26, 2001 at 12:39:20AM +0100
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

James Pattinson (jamesp@foobarhouse.com) wrote 42 lines:

> Because it looks nice, and for the geek-factor :)

Because one can.  That's why I used soft-raid, that's why I
use SMP... but I still have a non-lvm root/bootpartition.

> [root@greebo /root]# bdf
> Filesystem           1k-blocks      Used Available Use% Mounted on
> /dev/vg00/lvol1         262132     92988    169144  36% /
> /dev/vg00/lvol2        3145628   2382316    763312  76% /usr
> /dev/vg00/lvol3         262132    103400    158732  40% /var
[...]

Personally, I name my LVs to match their (usual) mountpoints,
because I do not want to remember the number/mountpoint
matching, so I have LV names like 

    /dev/main_vg/usr
    /dev/main_vg/var
    /dev/main_vg/var_spool_news         # mounts on /var/spool/news
etc.

-Wolfgang
