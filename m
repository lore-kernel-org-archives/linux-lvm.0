Return-Path: <ulf@twc.de>
Message-ID: <3A7E61D7.D417A879@twc.de>
Date: Mon, 05 Feb 2001 09:18:31 +0100
From: Ulf Bartelt <ulf@twc.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] startup stuff an dnew question :-)
References: <Pine.LNX.4.21.0102021438490.380-100000@munster.noc.fr.clara.net>
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@sistina.com

JAmes wrote:
> 
> It works ! Thanks to everybody who helped. I am too used to debian
> packages doing all for you.
> 
> /etc/rcS.d is the one that worked. So has init2 got anything to do with
> /etc/rc2.d ???
> 
> Another question I have is can anybody show me a good install plan, a
> partition scheme for a machine where everything but the / is lvm'ed. I
> haven't seen this discussed anywhere. At the moment I am just testing on a
> box with a partition / a swap and a /home .
> 
> If I did a standard installation using say 5 partitions / /usr /var/ /home
> swap, it would be a pain transferring this to an lvm system. So how do you
> lot do it ?

This is how I did it on my router/mailserver:

Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/hda2                31729     14865     15226  49% /
/dev/hda1                 3963      1273      2486  34% /boot
/dev/vgodo/tmp           63461        19     60821   0% /tmp
/dev/vgodo/usr          222135    180405     30262  86% /usr
/dev/vgodo/var           63461     27578     33917  45% /var
/dev/vgodo/home          63461      2467     60339   4% /home
/dev/vgodo/spool_squid  507748     23395    458139   5% /var/spool/squid

But the tricky part is: hda2 and hda1 are LVs too...

I just faked partition map entries for them and I use them only by this
"partition aliases", so I can boot a system living totally in LVs using
conventional things like lilo...

Have a look into http://www.freenet.de/y.e.t.i./

I'm using this trick for over a year now and I'm still happy with it.
All my Linuxes @home are set up this way ( if not a diskless install :-)
)...

Bye!
	Ulf.
