Return-Path: <piete.brooks@cl.cam.ac.uk>
Subject: Re: [linux-lvm] LVM vs. /proc/partitions 
In-reply-to: Your message of Fri, 16 Mar 2001 19:43:15 -0500.
             <Pine.LNX.4.30.0103161936340.4654-100000@flowers.house.larsshack.org> 
Mime-Version: 1.0
Date: Sat, 17 Mar 2001 08:59:59 +0000
From: Piete Brooks <Piete.Brooks@cl.cam.ac.uk>
Message-Id: <E14eCZ5-0008KC-00@whittlesey.cl.cam.ac.uk>
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
Cc: Piete.Brooks@cl.cam.ac.uk

>   58 0 8884224 lvma

Yeah -- bummer that !
I assume it'll be sorted out by the kernel HACKers, but til then, you may care 
for a HACK I have for devfs.  If you add to /dev/devfsd.conf (or whatever)
	LOOKUP  ^lvm.$    EXECUTE /choose/your/path/makedev $devname $mntpnt
and then have in /choose/your/path/makedev a script which does a mknod e.g.

#! /bin/sh
# $Header: $
#
# Script to be called by devfsd via /etc/devfsd.conf and /etc/devfsd.cl
# to ensure /dev/mouse, /dev/lvma, etc. exists if it is missing ...

# (echo $0: $1 and $2) >> /tmp/m-l
case "$1" in
mouse)	val=`cat /etc/sysconfig/$1`
	case "$val" in
	*PS*|*ps*)				res=psaux;;
	*ms*|*MS*|*microsoft*|*icrosoft*)	res=ttyS0;;
	esac
	case "$res" in ?*) ln -s $res $2/$1;; esac
	;;
cdrom)
	test -r $2/cd0 && ln -s cd0 $2/$1
	;;
cd[0-9])
	num=`echo $1 | sed 's/cd//'`
	test -r $2/cdroms/cdrom$num && ln -s cdroms/cdrom$num $2/$1
	;;
lvm*)	major=58
	# How *should* this be done ???
	case "$1" in
	lvma)	minor=0;;
	lvmb)	minor=1;;
	lvmc)	minor=2;;
	lvmd)	minor=3;;
	lvme)	minor=4;;
	lvmf)	minor=5;;
	lvmg)	minor=6;;
	lvmh)	minor=7;;
	lvmi)	minor=8;;
	lvmj)	minor=9;;
	lvmk)	minor=10;;
	*)	exit 1;;
	esac
	mknod $2/$1 b $major $minor
	;;
esac
