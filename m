Message-Id: <200112171354.fBHDskD18934@pcx4168.holstein.com>
From: "Todd M. Roy" <troy@holstein.com>
In-Reply-To: <20011217035359.A4880@tiger.bigcats.invalid> (message from
	Wolfgang Weisselberg on Mon, 17 Dec 2001 03:53:59 +0100)
Subject: Re: [linux-lvm] invalidate: busy buffer
References: <20011214191634.GB24486@auctionwatch.com> <20011216205044.F26924@tiger.bigcats.invalid> <20011216215414.GB12889@sky.net> <20011217035359.A4880@tiger.bigcats.invalid>
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
Date: Mon Dec 17 07:53:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

My $0.02 ..

I never run vgscan unless I change my LVM configuration.
vgchange -a y of course must be run prior to mounting
LVM volumes.  The one caveat is that /proc must be mounted,
and if root is mounted read only, as it usually is on boot,
you have to use the -n option to mount it.  

So one may find early in my slackware rc.S file:

mount -n /proc
/sbin/vgchange -a y
umount -n /proc

yes, I umount /proc so the rc.S can mount it "normally" later.

-- todd --

>  X-Apparently-To: todd_m_roy@yahoo.com via web13608.mail.yahoo.com; 16 Dec 2001 19:15:50 -0800 (PST)
>  X-RocketRCL: 1105;1;82599241
>  X-Track: -10
>  From: Wolfgang Weisselberg <weissel@netcologne.de>
>  Mail-Followup-To: linux-lvm@sistina.com
>  Content-Disposition: inline
>  Sender: linux-lvm-admin@sistina.com
>  Reply-To: linux-lvm@sistina.com
>  X-Original-Date: Mon, 17 Dec 2001 03:53:59 +0100
>  Date: Mon, 17 Dec 2001 03:53:59 +0100
>  
>  Hi, Ulrich!
>  
>  Ulrich Wiederhold (U.Wiederhold@gmx.net) wrote 26 lines:
>  
>  > * Wolfgang Weisselberg <weissel@netcologne.de> [011216 20:50]:
>  > > BTW, is there a good reason to run vgscan on boot time every
>  > > time?  I have had more sorrow than joy with that.  If my
>  > > vg's really changed, I can always run it from the (non-LVM)
>  > > / which will come up, even if only as an emergency system.
>  
>  > Ok, but you need to run vgscan && vgchange -ay every time you wanna use
>  > your LVM-drives, and I think that's normally every time you boot your
>  > PC.
>  
>  Funny, my PC boots and mounts the LVs even though I commented
>  out vgscan entirely in the boot process.  vgchange is another
>  thing, though...
>  
>  > But... I add them
>  > to /etc/rcS.d/S99local incl. the mount command.
>  
>  Faaar to late -- considering that all the daemons start up early
>  and need fancy things like /usr, /var and sometimes /tmp ..
>  
>  
>  -Wolfgang
>  
>  _______________________________________________
>  linux-lvm mailing list
>  linux-lvm@sistina.com
>  http://lists.sistina.com/mailman/listinfo/linux-lvm
>  read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>  
