Return-Path: <gerry@dorfam.ca>
Date: Tue, 3 Jul 2001 17:13:57 -0400 (EDT)
From: <gerry@dorfam.ca>
In-Reply-To: <994015538.6465.5.camel@detrius>
Message-ID: <Pine.LNX.4.33.0107031707230.15782-100000@leopard.dorfam.ca>
MIME-Version: 1.0
Subject: [linux-lvm] LVM on Redhat 2.4.3-12 Kernel
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

I never could get LVM working on the 2.2.19 Redhat kernel.  I had to
download the generic 2.2.19 kernel from kernel.org and then patch it.
Those same patches didn't work on RH's kernel.

I have now upgraded from RH 7.0 to 7.1 and compiled LVM statically in the
2.4.3-12 kernel that came with RH 7.1.  When I boot using this kernel LVM
doesn't work.  It still works if I go back to the 2.2.19 kernel.

My questions....
1. will LVM actually work with RH's 2.4.3-12 kernel?
2. does this kernel have to be patched?
3. do I just need updated LVM software?

In other words, how do I get this going under the new kernel???

Thanks!  Gerry

-- 
"The lyf so short, the craft so long to learne."   Geoffrey Chaucer
