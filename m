Return-Path: <urs@isnogud.escape.de>
Subject: Re: [linux-lvm] Problem mounting ext2 fs on LVM
References: <200102271702.f1RH2lm27059@webber.adilger.net>
From: Urs Thuermann <urs@isnogud.escape.de>
Date: 27 Feb 2001 18:51:00 +0100
In-Reply-To: <200102271702.f1RH2lm27059@webber.adilger.net>; from Andreas Dilger on Tue, 27 Feb 2001 10:02:47 -0700 (MST)
Message-ID: <m27l2ct3p7.fsf@isnogud.escape.de>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Andreas Dilger <adilger@turbolinux.com> writes:

> What does it say in the syslog?  This will tell you why ext2 thinks it
> can't mount, and will give us a clue on how to fix LVM.  I'm guessing
> that when ext2 tries to set the blocksize to 1k it fails.

Yes, I have a couple of messages in my syslog, like

Feb 27 17:04:39 isnogud kernel: VFS: Unsupported blocksize on dev lvm(58,0).


urs
