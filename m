Return-Path: <markv@wave.co.nz>
Date: Fri, 8 Jun 2001 10:29:36 +1200
From: Mark van Walraven <markv@wave.co.nz>
Subject: Re: [linux-lvm] LILO configuration for LVM "boot" filesystem
Message-ID: <20010608102936.A9167@mail.wave.co.nz>
References: <20010605210727.C1870@pc.ilinx> <3B1F9E1C.1984FAF8@wrkhors.com> <20010607104301.A29848@stocks.pillory.com>
Mime-Version: 1.0
In-Reply-To: <20010607104301.A29848@stocks.pillory.com>; from Jack McKinney on Thu, Jun 07, 2001 at 10:43:02AM -0500
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

On Thu, Jun 07, 2001 at 10:43:02AM -0500, Jack McKinney wrote:
> cd / ; mv tmp tmp.old ; ln -s /var/tmp .
> reboot
> rm -rf /tmp.old
> 
>     Now you don't have to worry about root filling up at all...

/tmp is commonly emptied on boot, unlike /var/tmp.  Vi, for example,
stores it's recovery files in /var/tmp.

I prefer a separate partition for /tmp, to reduce the need to write to
the root fs and thereby lower the risk of damage to it in a crash.

Regards,

Mark.
