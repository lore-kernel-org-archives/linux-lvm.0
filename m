Return-Path: <dmeyer@dmeyer.net>
Date: Tue, 20 Feb 2001 13:05:23 -0500
From: dmeyer@dmeyer.net
Subject: Re: [linux-lvm] Startup Script trouble in RH6.2
Message-ID: <20010220130523.A2952@jhereg.dmeyer.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3A9282FC.104A2BFF@lmco.com>
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

In article <3A9282FC.104A2BFF@lmco.com> you write:
> However, if the suggested alternative is to modify rc.sysinit,
> where in the script should I put the lvm startyp? Should it be
> after loading the modules, but before adding the RAID devices?

I modified rc.sysinit - I put in vgscan and vgchange just before the
"Mounting local filesystems" bit.  I also put a vgchange -an in
/etc/rc.d/init.d/halt just before remounting / ro.

-- 
Dave Meyer
dmeyer@dmeyer.net
