Return-Path: <jfrank@lxco.com>
Message-ID: <3A5EE491.5E4FB886@lxco.com>
Date: Fri, 12 Jan 2001 12:03:45 +0100
From: =?iso-8859-1?Q?J=FCrgen?= Frank <jfrank@lxco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] how can I init LVM on software RAID  ?
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
To: LVM <linux-lvm@sistina.com>

Hi !!

I want to create the following system :

I use the new kernel (2.4) and I want to use the software raid and the
lvm,
but my problem is... how ?

I can't find a step by step documentation and all what I try don't work.

So what did I done :

* create a mirror system with software raid (last version), after this 
  step I have a good raid system with the drive /dev/md0

* normally now I need to create a partition on the drive , but I read in
the raid docu that the md-drives don't support partitions !!!

But, without a partiton of the type 0x8e I can't run vgscan and
pvcreate...

So, can anyone help me ?!

Juergen

(sorry for the bad english)
