Return-Path: <lembark@wrkhors.com>
Message-ID: <3A7235A2.C515ED1C@wrkhors.com>
Date: Fri, 26 Jan 2001 20:42:42 -0600
From: Steven Lembark <lembark@wrkhors.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] configuration question
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

trying to get vg's out of dev for now -- devfs issues.

so i modify ./kernel/lvm.h replacing:

	#define LVM_DIR_PREFIX  "/dev/"

with 
	#define LVM_DIR_PREFIX  "/lvm/"

then configure and compile the code.

probem is that this doesn't seem to purge /dev/ from
all of the code.  is there some other location where
the lvm directory is defined or is this just a 
configuration bug [perhaps a known one at that]?

thanx.

-- 
 Steven Lembark                                   2930 W. Palmer St.
                                                 Chicago, IL  60647
 lembark@wrkhors.com                                   800-762-1582
