Return-Path: <dice@mfa.kfki.hu>
Date: Fri, 4 May 2001 11:47:47 +0200 (CEST)
From: Gergely Tamas <dice@mfa.kfki.hu>
Message-ID: <Pine.LNX.4.32.0105041145080.651-100000@falka.mfa.kfki.hu>
MIME-Version: 1.0
Subject: [linux-lvm] CVS checkout unavailable ?
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

Hi!

I'm not able to check-out current LVM from CVS.

(Logging in to cvs@cvs.globalfilesystem.org)
CVS password:
cvs server: Updating LVM
cvs server: failed to create lock directory in repository `/data/cvs/LVM':
Permission denied
cvs server: failed to obtain dir lock in repository `/data/cvs/LVM'
cvs [server aborted]: read lock failed - giving up
(Logging out of cvs@cvs.globalfilesystem.org)

What happend to it?

I use this script

#!/bin/sh
export CVSROOT=:pserver:cvs@cvs.globalfilesystem.org:/data/cvs
cvs login
cvs -z3 checkout -r LVM_0-9-patches LVM
cvs logout

Thanks in advance,
Gergely
