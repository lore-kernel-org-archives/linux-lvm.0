From: Joachim Banzhaf <jbanzhaf@ngi.de>
Subject: Re: [linux-lvm] lvm and a dead disk
References: <16228.26968.804811.803799@gargle.gargle.HOWL> <20030915152521.N2618@sistina.com>
In-Reply-To: <20030915152521.N2618@sistina.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200309151838.27194.jbanzhaf@ngi.de>
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
Date: Mon Sep 15 11:39:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Am Montag, 15. September 2003 15:25 schrieb Heinz J . Mauelshagen:
> Peter,
>
> the LVM1 way is to replace the broken disk, pvcreate the new one and
> vgcfgrestore the metadata to it.

In other words: since you did that already, it is as good as it gets as far as 
LVM is concerned. Now contact your filesystem guru(s). :-)

I am not an expert on that, but if the filesystem is reiserfs, perhaps the -S 
switch of reiserfsck helps? But before you try, better make a backup of the 
current status (something like dd if=/dev/your-vg/your-lv 
of=/your-big-backuppath/bakfile).

good luck,

Joachim Banzhaf
