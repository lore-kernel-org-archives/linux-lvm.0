Return-Path: <bkonosky@texas.net>
Message-ID: <3B5A585F.1070003@texas.net>
Date: Sat, 21 Jul 2001 23:36:47 -0500
From: Ben Konosky <bkonosky@texas.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Help.
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
To: linux-lvm@sistina.com

I had a VG that had three PVs in it, one of the PVs failed, is there any 
way to trick the VG into thinking it only has two PVs in it so I can 
*try* to mount it and see what data I can pull off the remainder. The 
file system is reiserfs, and it was the third PV in the group that died.

Thanks in advance,
Ben Konosky
bkonosky@texas.net
