Return-Path: <ultra@mailme.dk>
From: "Klaus Agnoletti" <ultra@mailme.dk>
Date: Tue, 10 Jul 2001 22:07:55 +0200
Message-ID: <MPEELPOMDADEHPNEDEPBIELOCAAA.ultra@mailme.dk>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Just installed LVM on deb - got module errors
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

I just installed lvm 0.9.1 beta 7 from .deb archives via apt-get
For some reason I get the following error when trying to prepare a LVM
partition :

vault:/etc/modutils# pvcreate /dev/hdb1
pvcreate -- LVM driver/module not loaded?

Clearly it is missing a kernel module.

trying to modprobe lvm-mod gives the following error :

vault:/etc/modutils# modprobe lvm-mod
modprobe: Can't locate module lvm-mod

I assume the following messages in /var/log/syslog is related :

Jul 10 22:00:02 vault modprobe: modprobe: Can't locate module char-major-109
Jul 10 22:00:02 vault modprobe: modprobe: Can't locate module char-major-109

So I guess that this really is what it needs. Am I right ? - how do I get
this then ?

If I am totally off the track, please help me back =)


Thanks in advance


Klaus Agnoletti
