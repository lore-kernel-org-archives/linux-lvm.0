Return-Path: <pwk.linuxfan@gmx.de>
From: Peter Kirk <pwk.linuxfan@gmx.de>
Date: Wed, 6 Jun 2001 21:06:16 +0200
MIME-Version: 1.0
Message-Id: <01060621061602.01075@notch>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Switching one of my disks to hdc from hdb
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

Hi,

since some of you told me my Setup with two stripped disks on hda and hdb was 
broken, I would like to put my second disk (/dev/hdb) on the second Controler 
(/dev/hdc) instead of my DVD Drive. Now my question is: What do I have to 
change, in order not to distroy my linux installation in the process ??
I can realize fstab will have to be changed but else ? Anything in some lvm 
files ? Surely ! Please help me


Thank you
pwk.linuxfan
