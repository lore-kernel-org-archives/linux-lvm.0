Return-Path: <michael_e_brown@dell.com>
Date: Wed, 28 Mar 2001 10:46:50 -0600 (CST)
From: Michael E Brown <michael_e_brown@dell.com>
In-Reply-To: <200103281340.f2SDe0D25856@smtp6.us.dell.com>
Message-ID: <Pine.LNX.4.30.0103281010350.10643-100000@blap.linuxdev.us.dell.com>
MIME-Version: 1.0
Subject: [linux-lvm] Re: alternate pathing with lvm?
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
Cc: josv@osp.nl, Stephan.Hendl@lds.brandenburg.de

Check out the latest redhat rawhide kernel.
ftp://ftp.redhat.com/pub/rawhide/SRPMS/SRPMS/kernel-2.4.2*

The version that is there now is kernel-2.4.2-0.1.28.src.rpm. Install that
RPM and look in /usr/src/redhat/SOURCES for linux-2.4.2-multipath*

This is an 'md' layer enhancement to do multipath (alternate pathing).

This version has some known bugs. Watch for kernel-2.4.2-0.1.x where
x>=40, for a version with fixes.

--
Michael Brown
Linux Systems Group
Dell Computer Corp
