Return-Path: <raheesom@navpoint.com>
From: Rupert Heesom <raheesom@navpoint.com>
Date: 08 May 2001 08:25:01 -0400
Message-Id: <989324702.3147.1.camel@localhost>
Mime-Version: 1.0
Subject: [linux-lvm] Am I patching the kernel incorrectly??
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

I had previously patched the kernel (stock 2.4.3) with the beta 6 patch.

Now I'm trying to update to beta 7.  I tried patching the kernel is
exactly the same way as before (maybe a mistake).  Most of the output is
pasted in here (at the end).  I'm concerned about the prompts I got -

"Reversed (or previously applied) patch detected!  Assume -R? [n]"

As you can see, I decided to reply "Y".  Was that a correct assumption?

Afterwards I read the man page on "patch" and am now even less sure that
I did the right thing.

I don't want to compile the kernel modules (I have lvm as a module)
until I know that the source is in good condition.

patching file drivers/md/Makefile
Reversed (or previously applied) patch detected!  Assume -R? [n] y
The next patch would delete the file drivers/md/lvm-snap.h,
which does not exist!  Assume -R? [n] y
patching file drivers/md/lvm-snap.h
patching file Documentation/ioctl-number.txt
Reversed (or previously applied) patch detected!  Assume -R? [n] y
Hunk #1 succeeded at 187 (offset 1 line).

-- 
regs
rupert
