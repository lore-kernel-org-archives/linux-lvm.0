From: "Jan H. van Gils" <JanVG@Knoware.NL>
Subject: RE: [linux-lvm] debian and LVM: Problem with lilo
Message-ID: <000001c2fed7$c3b0e8d0$240b892c@pe1mhp.ampr.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <200304092152.14215.stefan.feeser@felino.de>
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
Date: Wed Apr  9 15:37:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Stefan Wrote :

>
>Hi all,
>
>I have created a volume group and some logical volumes. The 
>volume group 
>contain all directories, only swap and /boot are physical 
>volumes. At the 
>moment debian is running at the ram disk.

What version of debian are you running ?

>
>The installation steps are ok and I would like to create a bootable at 
>/dev/hda1 (my boot volume). I switched to another virtual 
>console and type 
>the following command
>
>lilo -r /target -F /etc/lilo.conf
>
>After that I get the message that
>
>Fatal: Not a number: "/dev/rootvg/rootlv"

You have to make a special initrd image to be able to run root on
a logical volume.
>
>Has anyone an idea what I can do to create a correct boot table?
>
>Thanks
>
>Stefan


But when you are running debian sarge, don't place your root file system
on a
logical volume.
During boot the volume manager has to be able to create a file and that
is not
possible with sarge because it booting with a cramfs filesystem during
boot
and that filesystem is readonly.

I placed the root file system back on a partition.

Greetz Jan

>-- 
>+++++++++++++++++++++++++++++++++++++++++++
>Dipl.-Ing. (FH) Forstwirtschaft
>Stefan Feeser
>+++++++++++++++++++++++++++++++++++++++++++
>have a look to
>--
>http://www.felino.de
>http://www.lug-untermain.de
>http://www.project-ibex.org


----
With regards Jan H. van Gils
Internet web-page http://www.Knoware.NL/users/janvg/
Internet e-mail address JanVG@Knoware.NL
RIPE Whois JHG5-RIPE, 6BONE Whois JHG1-6BONE
