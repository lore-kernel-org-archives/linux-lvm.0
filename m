Return-Path: <bernat@free.fr>
Date: Fri, 13 Jul 2001 18:41:53 +0200
From: Vincent Bernat <bernat@free.fr>
Subject: Re: [linux-lvm] Newbie question
Message-ID: <20010713184153.C4738@lucas.loria>
References: <FDEJIMPDHJAAPNLFKBMGAECACEAA.tgs@iafrica.com> <20010712094638.B418@btconnect.com> <200107121612.MAA13656@burns.luca.2y.net> <20010713131200.C32198@sistina.com> <200107131652.MAA15766@burns.luca.2y.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200107131652.MAA15766@burns.luca.2y.net>; from luca@lucarella.com.ar on Fri, Jul 13, 2001 at 12:33:31PM -0300
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

Le Fri Jul 13, 2001 at 12:33 -0300, 
Leandro Lucarella <luca@lucarella.com.ar> disait :

> Now I have a question. I read the HOWTO migrate the old root partition to a
> LV, and the method is to make a LV on another HD (or the same if it's
> room), copy the root FS to this LV, delete the old partition and add it to
> the new LV. My question is. It's possible to make a VG without striping
> ('cause I have just 1 HD in the begining) and then, when I add the old
> partition to the VG, make this VG to do striping????

The FAQ seems to say it is not possible. You cannot add a PV to a
stripping LV. It may change in the future.
