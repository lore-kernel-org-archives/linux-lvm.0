Return-Path: <C.R.Ritson@ncl.ac.uk>
Message-Id: <4.3.1.1.20010619151359.00afa100@popin.ncl.ac.uk>
Date: Tue, 19 Jun 2001 15:33:14 +0100
From: Chris Ritson <C.R.Ritson@ncl.ac.uk>
Mime-Version: 1.0
Subject: [linux-lvm] Problem if snapshot exists after crash or reboot
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I am using linux 2.4.5-ac6 (SMP) which includes lvm 0.91_beta7 as a file 
server. I have done no further patching so far. I am hoping to use LVM 
snapshots for two things:-

a) To ensure a backup from a quiet filesystem

b) To offer the users the possibility of looking into yesterday's snapshot 
for the file that they have just corrupted or deleted. I think this would 
avoid 95% of all my restore requests.

I understand that snapshots are not (yet) persistent, but that shouldn't be 
a problem unless the system is rebooted.

The problem is that if a snapshot exists and the system is shutdown 
(running "vgchange -a n" on the way), then the "vgchange -a y" fails with 
error 9 on the way back up again. I can avoid this if I lvremove the 
snapshots on the way down, but this would not help if the power failed or 
the system crashed. I need something that can fix this as the system comes 
up. My current idea is to run vgscan to get a list of volume groups, and 
then to run vgcfgrestore on the first listed volume group that has failed 
to activate, repeating until all volume groups can be activated. This is 
messy and may be dangerous. It also requires knowlege of which physical 
device to use for each volume group. I don't think this is easily available 
other than by using some sort of consistant naming scheme.

Comments and advice would be welcome.

Chris Ritson
--
EMAIL:	C.R.Ritson@newcastle.ac.uk	POST:	Chris Ritson,
PHONE:	+44 191 222 8175			Department of Computing Science,
FAX :	+44 191 222 8232				University of Newcastle upon Tyne,
ROOM:	618 Claremont Bridge (the Mill)		United Kingdom NE1 7RU.
