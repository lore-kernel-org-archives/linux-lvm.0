Return-Path: <frodet@nvg.ntnu.no>
Date: Tue, 21 Aug 2001 15:25:38 +0200 (CEST)
From: =?iso-8859-1?Q?Frode_Tenneb=F8?= <frodet@nvg.org>
Message-ID: <Pine.LNX.4.33.0108211517460.13063-100000@hagbart.nvg.ntnu.no>
MIME-Version: 1.0
Subject: [linux-lvm] 2.4.9 + lvm-1.0.1rc1 + ext2online
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: =?iso-8859-1?Q?Frode_Tenneb=F8?= <frodet@nvg.org>

I thought I should mention that I have tested the linux 2.4.9,
LVM 1.0.1rc1 with ext2online patch and have not experienced any problems
so far.

I have previously had problems with 0.9beta6 as shiped from SGI with their
XFS patches (see :
http://lists.sistina.com/pipermail/linux-lvm/2001-August/008206.html). I
believe the fault was in the LVM code since the problems only occured
when LVM was active and an LVM volume was mounted. I guess the bug got
cleaned out during the process to 1.0.

 -Frode
