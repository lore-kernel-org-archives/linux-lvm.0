Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5FDiZ028495
	for <linux-lvm@redhat.com>; Tue, 15 Jun 2004 09:44:35 -0400
Received: from taurus.voltaire.com ([212.143.27.73])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i5FDiTXn014719
	for <linux-lvm@redhat.com>; Tue, 15 Jun 2004 09:44:29 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Tue, 15 Jun 2004 16:44:21 +0300
Message-ID: <D4F8F0B3820E754C887699BEF26A89400E4A7E@taurus.voltaire.com>
From: "Dan Bar Dov" <danb@voltaire.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Scanning MD devices - bug or feature?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

I have a problem where LVM fails to create VGs from PVs I make on newly
created MDs.
After looking in the code it looks as if LVM (1.0.8 BTW) is relying on a
device cache, so that newly created devices 
are not accessible. It means that to use an MD device bt LVM, I need to
create the MD device and reboot.

Digging in the code I found that lvm_dir_cache is calling _scan_devs
either with TRUE or FALSE, _scan_devs on 
false scans only /dev/loop and /dev/nb, it does not re-scan /dev/md. In
addition, lvmdiskscan relies on the cache as well.

My first solution was to remove the if - make it scan all the devices
all the time, but that would exclude /dev/loop and nb from the search.
I'm now thinking to add /dev/md to the _notprocdir table.

Another problem I see but need to further investigate is that my
/dev/partitions is so huge that it gets binary characters in it, and
also the proc implementation is not handling the spill over page size
properly.

Any ideas/comments would be appreciated.
Dan

------------------------------------------------------------------------
----------------------------------
/* devices *not* showing up in /proc/partitions must be scanned anyway
*/
static char *_noprocdir[] = {
        LVM_DIR_PREFIX "loop",
        LVM_DIR_PREFIX "nb",
        NULL
};

int lvm_dir_cache(dir_cache_t **dir_cache_ptr)
{
        int ret = 0;
        debug_enter("lvm_dir_cache -- CALLED\n");

        if (!dir_cache_ptr) {
                ret = -LVM_EPARAM;
                goto out;
        }

        if (!_dir_cache) {
                _scan_partitions();
                if(!_cache_size)
                        _scan_devs( TRUE);
                else
                        _scan_devs( FALSE);
        }
