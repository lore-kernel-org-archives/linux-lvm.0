Return-Path: <zoo1@core.com>
Date: Sat, 16 Dec 2000 16:18:10 -0500
From: zoo1@corecomm.net
Message-ID: <20001216161810.A1006@bar.nowhere>
Mime-Version: 1.0
Subject: [linux-lvm] serializing fsck
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

(is Ted Ts'o reading this list, by any chance?)

it seems my fsck on bootup is having trouble figuring out on which
physical devices various lvols reside, and so is starting up all the
fsck's simultaneously. i'm working around this by fiddling with the fsck
parameters in /etc/fstab, and i suspect that's probably the only really
general solution (since striping would throw wrenches into the works
anyway), but i'd like to know if i've overlooked some other possibility?

-- 
   PGP/GnuPG key (ID 1024D/BFE0D6D0) available from keyservers everywhere

       "Everything I am today, I owe to people whom it is now too late
                                   to punish."
