Return-Path: <mjt@tls.msk.ru>
Message-ID: <3B0BB7C5.2F2881B8@tls.msk.ru>
Date: Wed, 23 May 2001 17:14:45 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Converting my Root file system to LVM
References: <200105222325.f4MNPJVw012336@webber.adilger.int>
Content-Transfer-Encoding: 7bit
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

Andreas Dilger wrote:
[]
> No, the problem is in the wrapper script for the LVM tools.  It is using
> "sed" in the script, but that is not on the initrd.  I don't see sed in
> my LVM wrapper script, so you must have a different one.  Either fix the
> wrapper script (edit /sbin/vgscan should be enough), or add "sed" to the
> list of required files, INITRDFILES, in lvmcreate_initrd.

Initrd intended to be used with exactly one version of kernel, so there should
be NO sed there -- it is used to determine kernel iop version, but that known
at an initrd creation time.  Initrd should contain real utils, not wrappers.

Regards,
 Michael.
