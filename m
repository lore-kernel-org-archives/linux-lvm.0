Return-Path: <acrum@pherret.com>
Message-ID: <3A7F2FC2.CC3B1836@pherret.com>
Date: Mon, 05 Feb 2001 17:57:06 -0500
From: Andrew Crum <acrum@pherret.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Wrong major or minor number
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

I have been playing with the LVM stuff for a few days now. I created
everything, got reiserfs
on my logical volume, everything worked OK until today. I don't think I
changed anything, but I can't mount it, I get the error:

/dev/volgrp1/software has wrong major or minor number

Reiserfs has a FAQ on this, and it states that the reiserfs code is not
available to the kernel or it isn't a module that is available. But...I
have another partition, on another disk, that isn't in the LV, and it is
reiserfs, it works fine.

Any help?
