Message-ID: <3EBB7489.3060600@gmx.at>
From: kihan <kihan@gmx.at>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] device mapper startup
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
Date: Fri May  9 04:27:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

hello,

i have now compiled a kernel with device-mapper support, and the lvm2 tools.

i have my root filesystem on an lvm-jfs drive, so i need a ramdisk. (it 
worked for me for 2.4.12)
i don't use "devfs", so therefore i need to start "devmap_mknod.sh" on 
each boot, i think after reading the documentation.

so my question is, when do i need to start the script?
1. do i need to run it from the "linuxrc"-script of my ramdisk?
2. do i need to run it again in my "normal" boot scripts?
3. do i need to create any directories, devices etc in "dev" (ramdisk 
also?), before the script runs correctly?

at the moment when my system starts up with the device mapper kernel 
driver, i get following message, when "vgscan" is run from the 
"linuxrc"-script on my ramdisk.

"/dev/mapper/control": no such file or directory

....after that i get a message, which asks, if the kernel has 
device-mapper support. and yes i have complied the kernel with the 
"0.96.08" release, because current cvs from the device-mapper sources do 
not complie, and i'm not he best coder...;-)

thanks for any help again,

manfred
