Return-Path: <ragnark@stine.vestdata.no>
Date: Thu, 28 Jun 2001 02:23:07 +0200
From: =?iso-8859-1?Q?Ragnar_Kj=F8rstad?= <lvm@ragnark.vestdata.no>
Message-ID: <20010628022307.A380@vestdata.no>
Mime-Version: 1.0
Subject: [linux-lvm] LVM metadata corruption?
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

Hi

We had a LVM problem that we believe was caused by corrupted
LVM-metadata. Can anyone confirm if this is a likely explanation?

1. Installed LVM 
2. Created a single vg on a single device with a single lv
3. Used without problems for a while
4. Added a new device
5. Add the device to the vg, extend the lv and the filesystem
6. We experienced scsi-problems at this time.
7. Fixed scsi termination

After a reboot, mounting the filesystem(xfs) oopsed.

lvdisplay -v segfaulted, but there was no backtrace.

We recreated the lvm vg and lv, and the filesytem - everything worked
fine.


My theory is that the vgextend or lvextend corrupted the lvm-metadata
because of the scsi-termination problem. LVM doesn't update the metadata
using a transactional log, does it? so if a write failed, the data will
become corrupted? (yes, I know a copy is saved in the /etc/lvm files)

Unfortenately we needed the system back online right away, so the
metadata is no gone. No way of debugging it futher.


Thank you.



-- 
Ragnar Kjorstad
Big Storage
