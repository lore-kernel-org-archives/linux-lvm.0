Message-ID: <3E58E03E.3020401@machturtle.com>
From: David Corbin <dcorbin@machturtle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] "umount" LVM stuff
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
Date: Sun Feb 23 08:53:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM <linux-lvm@sistina.com>

I have created a RAID1 drive.  I've created an LVM setup on top of it so 
I can easily repartition it "at will".  However, I need to do something 
to adjust the RAID device, and I cannot because it is "busy".  What is 
the correct way to "unmount" all the LVM stuff so that nothing is 
currently running on top of /dev/md0, without permanently changing any 
of my LVM configuration?

Thanks
David
