From: Nathan Fredrickson <8nrf@qlink.queensu.ca>
Message-Id: <1070592126.26293.133.camel@rocky>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] wiping an old LVM
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
Date: Thu Dec  4 20:44:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi,
I have browsed the archives and not found a conclusive answer to this: 
How much of an PV partition do I need to wipe with dd so that pvscan
does not find it?

I have found that even if I wipe a partition table with dd and then
repartition with the same sized partitions, the old PV and VG are still
found.  I tried zeroing the start of the LVM partition, but found this
only worked consistently if I wiped nearly the entire partition.  Where
exactly is the metadata that needs to be zeroed?

I'd like to to wipe it regardless of any information about previous LVM
configuration.  This is for install scripts of cluster nodes which are
re-imaged periodically.  I'm using LVM 1.0.3.

Thanks,
Nathan
