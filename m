Message-Id: <200303031001.h23A127e010167@pcrz175.hrz.uni-marburg.de>
From: "Thomas Gebhardt" <gebhardt@HRZ.Uni-Marburg.DE>
Subject: [linux-lvm] Accessing VG in multiboot environment
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
Date: Mon Mar  3 04:01:02 2003
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

I'd like to install several linux distributions on one disk
in a multiboot environment, each of them accessing the data
in a LVM 1.x volume group.

Is there a preferred way to handle such a situation? Do I
have to export/import the VG at each reboot?

Ideally the various linux installations should also reside
within the volume group for maximum flexibility (apart from
a small boot/root partitiion in order to avoid the initrd
stuff).

Any pointer to information regarding this issue would be
appreciated.

Thanks and Cheers, Thomas

-- 
Th. Gebhardt (gebhardt@hrz.uni-marburg.de)
---------------------------------------------------------------
HRZ, Hans Meerwein Strasse,        Phone: +49-6421/28-23572
D-35032 Marburg, Germany           Fax  :            -26994
