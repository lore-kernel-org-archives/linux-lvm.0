Return-Path: <raheesom@navpoint.com>
From: Rupert Heesom <raheesom@navpoint.com>
Date: 07 May 2001 18:42:29 -0400
Message-Id: <989275349.1722.5.camel@localhost>
Mime-Version: 1.0
Subject: [linux-lvm] Upgrading from beta 6 to beta 7
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

Guys:

I've currently got lvm beta6 RPMs installed on my PC, although I only
have test vols in place.

I think I ought to upgrade to beta 7 since there are now RPMs available.
My question is in regard to patching the kernel.  I assume that I just
run the beta 7 patch onto the source which had the beta 6 patch applied.

When then compiling the source to get the updated LVM module, do I need
to recompile the whole kernel & put that in place first as well as
compiling & installing the modules, or do I just need to compile the
modules, and install (make modules; make modules_install) ?

-- 
regs
rupert
