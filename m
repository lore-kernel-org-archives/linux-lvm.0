From: Wolfgang Weisselberg <weissel@netcologne.de>
Subject: Re: [linux-lvm] catch-22
Message-ID: <20011216203341.E26924@tiger.bigcats.invalid>
References: <NBBBKLKHMJHIJLHOGAOJKELJJCAA.steve.wray@the.net.nz> <00a401c18504$33a10ac0$0300000a@pacbell.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <00a401c18504$33a10ac0$0300000a@pacbell.net>; from e@arix.com on Fri, Dec 14, 2001 at 05:02:43PM -0800
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
Date: Sun Dec 16 13:36:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi, Erick!

Erick Calder (e@arix.com) wrote 43 lines:

> a drive part of a volume crashed on me... I've looked through the man pages
> and HOWTO but find no happiness... help!

> # vgextend LVM /dev/hdc
> vgextend -- volume group "LVM" doesn't exist

> # vgcreate LVM /dev/hdc
> vgcreate -- volume group directory or file already exists
> vgcreate -- please choose a different name

> what is the correct procedure to follow? shall I just blow away the /dev/LVM
> directory and do a "pvcreate -ff /dev/hda3"?

I am no expert.  I don't even try to guarantee that you'll
not blow up your data (and the whole planet, too).  But AFAICT
/dev/LVM is created as needed with vgscan.  You did run vgscan
after the HW-change?

You did a vgcfgrestore on the new/replaced /dev/hdc PV?

-Wolfgang

PS: I'd still advise a current, working backup. :-)
