Return-Path: <grothe@mathematik.tu-darmstadt.de>
From: Holger Grothe <grothe@mathematik.tu-darmstadt.de>
Message-Id: <200102021209.AA293705760@fb0442.mathematik.tu-darmstadt.de>
Subject: Re: [linux-lvm] startup stuff
Date: Fri, 02 Feb 2001 13:09:20 MEZ
In-Reply-To: <Pine.LNX.4.21.0102021159530.399-100000@munster.noc.fr.clara.net>; from "JAmes" at Feb 2, 101 12:19 (noon)
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,
> 
> I did what you suggested but nothing happens attall! I may be wrong but I
> have the impression that on a normal restart on rc2.d is 'looked' at.
> 
Don't know what you mean by "normal restart". On a Debian Potato 
(stable Version) one have in rcS.d

S05keymaps.sh
S10checkroot.sh
[...]
S20modutils
S30checkfs.sh
[...]

So the lvm-stuff (vgchange -ay) should be done before checkfs.sh :-)

> > You surely mean "vgchange -ay".
> 
> yep :-)
> 
> help :-)

A very simple version of the lvm startup script (Debian: /etc/init.d/lvm) 
may look like
-------------------------------------------------------------------------
#! /bin/sh
case "$1" in
        start|"")
                if [ -x /sbin/vgchange ]
                then
                        /sbin/vgchange -a y
                fi
                ;;
        stop)
                if [ -r /etc/lvmtab -a -x /sbin/vgchange ]
                then
                        /sbin/vgchange -a n
                fi
                ;;
        *)
                echo "Usage: $0 {start|stop}"
                exit 1
esac

exit 0
------------------------------------------------------------------------

Don't forget the x-bit.

Holger
--
Holger Grothe  (Email: grothe@mathematik.tu-darmstadt.de)
Fachbereich Mathematik, TU Darmstadt
