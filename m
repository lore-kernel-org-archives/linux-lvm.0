From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] Re: problem with lvm on root-fs
Message-ID: <20021017071524.GD20994@percy.comedia.it>
References: <200210170859.03682.sw@global-linxs.de>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200210170859.03682.sw@global-linxs.de>
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
Date: Thu Oct 17 02:20:24 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Oct 17, 2002 at 08:59:03AM +0200, Stefan Weigel wrote:
>Hi erveryone!
>I'm a little bit closer now. I've create an initrd with lvmcreate_initrd.
>In this initrd there was no module for my mylex-raid-controller. I've fixed 
>that problem, e.g. put the kernel module in it and changed linuxrc.
>After rebooting there's another kernel panic, but on this time the system 
>finds my volume groups. Output:
>
>kernel panic: no init found. Try passing init= to...
>
this usually means it couldn't mount your root fs, or got it wrong

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
