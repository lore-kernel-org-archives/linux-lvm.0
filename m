Return-Path: <vidalrod@informatik.tu-muenchen.de>
Message-ID: <3B0E7C7C.E434D0AE@in.tum.de>
Date: Fri, 25 May 2001 17:38:36 +0200
From: David Vidal Rodriguez <vidalrod@informatik.tu-muenchen.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Symbol not found when pvcreating...
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
To: lvm <linux-lvm@sistina.com>

Hi (again)!
When running the CVS version of kernel+tools, the pvcreate utility
requests the following symbol that apparently isn't present in the
liblvm-10.so.0 library:
int pv_check_partitioned_whole(char *pv_name)

(Error loading shared libraries... blahblah)
An older version of pvcreate (I'm no sure if beta6 or less) does the job
correctly.
Do I have to change anything in the sources in order to get it working?

Another --developer-- question:
I've looked at the LVM code and a structure called partition, #include'd
from <linux/genhd.h>, which contains the relevant information of a
partition. What I don't understand is how to get this information from
the kernel/drive (syscall, ioctl???). I'd be glad if somebody explained
that to me briefly.

Thanks!
--
  ------------------------------------------------------------------------
 David Vidal R. (vidalrod <at> in DOT tum DOT de)
