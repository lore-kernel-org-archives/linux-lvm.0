Return-Path: <andreas.klein@gmx.de>
From: "Andreas Klein" <andreas.klein@gmx.de>
Date: Wed, 15 Aug 2001 19:19:23 +0200
Message-ID: <IGEJJBMMFLKMBKEEDDMDGEACCAAA.andreas.klein@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Possible LVM enhancements for HA-Cluster support
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
To: Linux-LVM@sistina.com

Hello Heinz,

i'm in development of a HA-Cluster Software for Linux under GPL. 
I'm planning to use LVM as a base for my Cluster-Software (like 
HPs MC/ServiceGuard). For this i have some ideas which i would 
like to discuss with you as the maintainer of the Linux-LVM if 
you take stock in this.

At the moment i'm doing, in the result, something similar to 
MC/SGs cluster lock disk on a raw device to provide the split brain
syndrom. For now this solution works most of the time (maybe
i have to switch to external quorum server like in MC/SG Metro Cluster).
To put this solution on top of a Linux-LVM i need access to
a VG from every cluster node. But this could be a problem, because
if an inactive node changes the VG or LVOLs the active node doesn't
know about this change. So my idea is to activate a VG on an inactive
node in read only mode to prevent this. 

Would this be an acceptable solution and enhancement for Linux-LVM?

OK, i think an implementation based on SCSI low level commands could be
better, but as far as i have understand your LVM it is so easy to 
implement this but maybe you have another idea?

I would like to hear from you, so far

---
mit freundlichen gruessen / kind regards

Andreas Klein
E-Mail: andreas.klein@gmx.de
----------------------------------------
