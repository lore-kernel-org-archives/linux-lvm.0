Return-Path: <carenas@chasqui.lared.net.pe>
Date: Thu, 26 Apr 2001 04:17:00 -0500 (PET)
From: Carlo Marcelo Arenas Belon <carenas@chasqui.lared.net.pe>
Subject: Re: [linux-lvm] Cannot unmount my /usr partition.....
In-Reply-To: <3AE7D6AA.895E9C79@gecpalau.com>
Message-ID: <Pine.LNX.4.33.0104260410000.25537-100000@chasqui.LaRed.net.pe>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

<SNIP>
> Boots fine (better than fine!) and devfs reiser and lvm seem to play
> well together while they are running...... but upon shutdown I cannot
> unmount my /usr partition for some reason it is busy.

that means that something is running on /usr

> I have hacked the init scripts to let me reboot successfully (as it IS a
> production machine with automatic reboot times entered in the cron) but
> it cannot deactivate my LVM due to the /usr partition being busy.

did you add "vgchange -a n" to your halt script?, also you should add
"vgchange -a y" to your /etc/rc.d/rc.sysinit as instructed on sistina's
documentation

regards,

Carlo
