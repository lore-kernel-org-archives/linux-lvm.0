Message-ID: <3EE83C19.10805@maintech.de>
From: Thomas Kleffel <thomas.kleffel@maintech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] How to grow a PV?
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
Date: Thu Jun 12 03:40:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi!

I am running LVM1 ontop of  software-RAID (md). I just added a disk to 
my raid, so my /dev/md0 is about 120G bigger now.

Now my question is: How can I tell LVM to include these additional space 
into the PV that's already there (on /dev/md0)?

I  know it has to be possible because I did it several times (my raid 
has 9 disks now - it hat 4 disks, some time ago) - I just can't rememer :(((
Could someone please give me a hint?

Thanks in advance,

Thomas Kleffel
