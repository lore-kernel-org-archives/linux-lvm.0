Message-ID: <4012D858.1020005@dpincorp.com>
From: "Mr. David" <david@dpincorp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Raid and LVM, GFS newbie question
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
Date: Sat Jan 24 15:44:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi,
I apologize if my questions are too basic for the list.  I am new to 
Redhat implementation in production environment.  I am in proccess of 
impletmenting Redhat ES 2.1 and Redhat AS 2.1..  My background is solaris.

1.  How does most people manage root file systems in linux production 
environment?  I have two JBOD scsi disks for root file systems.  I 
already install the OS on one disk.  I just need to mirror the OS disk 
to the other disk.  Do I use raidtool? or do I use LVM to mirror?  How 
does raidtool and LVM work together?  Or does LVM have RAID 0, 1, 5 
capability also?  What is the easiest/best setup for 24/7 production 
environment?

2.  I need to have LVM support for data disks, does ES 2.1 or AS 2.1 
come with LVM?  If not how difficult is it to implement it.  Is it 
recommended with ES 2.1 or AS 2.1?  Your reccomendation?

4.  How do people do this in production if you have to mass install 
identical systems with Root file systems using Software RAID or LVM?   
Will Ghost/DD do the job?  Any reccomdation?

3.  I need to have mulitiple nodes see the same file systems through the 
SAN impletmentation.  I read about Sistina's GFS.   Is this product 
similar to Veritas SanPoint foundation suite where multiple nodes can 
see same file systems.  How much does GFS cost for, say  for 2 cpu's, 4 
- 6 nodes?  Are there other products that does similiar job?

Thank you for your help!
