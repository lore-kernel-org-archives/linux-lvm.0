Return-Path: <glenn@gecpalau.com>
Message-ID: <3AED19D0.5430A65F@gecpalau.com>
Date: Mon, 30 Apr 2001 16:52:48 +0900
From: Glenn Shannon <glenn@gecpalau.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] VGScan Crash workaround for DevFS
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

Uhm......I got a workaround to work for me......

I put the following into my /etc/rc.d/rc.sysinit file right after the
part where the / partition is mounted read-write:

if [ ! -e /dev/hda ] ; then
 action "Linking HDA for DevFS Compatibility" ln -s
/dev/ide/host0/bus0/target0/lun0/disc /dev/hda
fi
if [ ! -e /dev/hda1 ] ; then
 action "Linking HDA for DevFS Compatibility" ln -s
/dev/ide/host0/bus0/target0/lun0/part1 /dev/hda1
fi
if [ ! -e /dev/hda2 ] ; then
 action "Linking HDA for DevFS Compatibility" ln -s
/dev/ide/host0/bus0/target0/lun0/part2 /dev/hda2
fi
if [ ! -e /dev/hda3 ] ; then
 action "Linking HDA for DevFS Compatibility" ln -s
/dev/ide/host0/bus0/target0/lun0/part3 /dev/hda3
fi
if [ ! -e /dev/hda4 ] ; then
 action "Linking HDA for DevFS Compatibility" ln -s
/dev/ide/host0/bus0/target0/lun0/part4 /dev/hda4
fi
if [ ! -e /dev/hda5 ] ; then
 action "Linking HDA for DevFS Compatibility" ln -s
/dev/ide/host0/bus0/target0/lun0/part5 /dev/hda5
fi
if [ ! -e /dev/hda6 ] ; then
 action "Linking HDA for DevFS Compatibility" ln -s
/dev/ide/host0/bus0/target0/lun0/part6 /dev/hda6
fi
if [ ! -e /dev/hda7 ] ; then
 action "Linking HDA for DevFS Compatibility" ln -s
/dev/ide/host0/bus0/target0/lun0/part7 /dev/hda7
fi
if [ ! -e /dev/hda8 ] ; then
 action "Linking HDA for DevFS Compatibility" ln -s
/dev/ide/host0/bus0/target0/lun0/part8 /dev/hda8
fi
if [ ! -e /dev/hda9 ] ; then
 action "Linking HDA for DevFS Compatibility" ln -s
/dev/ide/host0/bus0/target0/lun0/part9 /dev/hda9
fi
if [ ! -e /dev/hda10 ] ; then
 action "Linking HDA for DevFS Compatibility" ln -s
/dev/ide/host0/bus0/target0/lun0/part10 /dev/hda10
fi


Hope this helps anyone out there.....but I'd still like to know why this
isn't needed in 2.4.3 but it is in 2.4.4.....is there something
different with the way DevFS works? As far as I can tell the DevFS
hasn't changed a bit.....


Glenn
