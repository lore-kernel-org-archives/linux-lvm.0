From: "John Moser" <jmoser@erc.wisc.edu>
Message-Id: <CBEHLLOPCKAOIAOINGKAMEHOCAAA.jmoser@erc.wisc.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <CBEHLLOPCKAOIAOINGKAMEHACAAA.jmoser@erc.wisc.edu>
Subject: [linux-lvm] Partition resizing and whatnot
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
Date: Wed Feb 20 15:37:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

So, after installation the ATA update patches that people recommended, I now
have a linux system that recognizes the full 160 gigabytes of disk space on
my disks.  However, I'm not entirely sure as to how I should go about
resizing my filesystem.  I'm already well aquanted with adding disks to
existing filesystems and growing them.  However, what are the recommended
steps for taking existing disk partitions, resizing them to fill the disks
they reside on, and then resizing the LVM/e2fs filesystems that use those
disks?

Any help would be appreciated (preferably step by step if you can manage).

Thanks,
-John Moser

--------------------------------
University of Wisconsin-Madison
Engine Research Center, Rm. 1011
Engineering Research
263-2761
Systems Administrator
jmoser@erc.wisc.edu
--------------------------------
