Message-ID: <3397328CD915D711BE07000802B083C20236507B@bwga522a.ts.siemens.de>
From: "Sathiamoorthy Balasubramaniyan (ext_TCS)"
	 <Balasubramaniyan.Sathiamoorthy.ext_TCS@ts.siemens.de>
MIME-Version: 1.0
Subject: [linux-lvm] help on pvcreate usage
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
Date: Thu Oct 16 09:20:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

Hi all,
I have 2 external disks connected to my suse 7.0 box :
sdb 80GB (has 4 partitions)
sdc  8GB (has 3 partitions)
I need to increase the size of the 3rd partition, i.e sdc3, of the disk sdc
by borrowing some space from one of the free partitions,ie, sdb4 of the disk
sdb.

 Iam not sure whether i can do this by LVM. My question is:
 Can i use the command pvcreate /dev/sdb4 without disturbing the data on
other partitions in the disk sdb ?

Thanks in Advance,
Bala Sath
SIEMENS Transportation Systems
TS RA D OC
Tel  +49 531 226-6154
Fax +49 531 226-4477
mailto:Balasubramaniyan.Sathiamoorthy.ext_TCS@ts.siemens.de

Note: This e-mail may contain privileged, undisclosed or otherwise
confidential information. 
If you have received this e-mail in error, you are hereby notified that any
review, copying or distribution 
of it is strictly prohibited. Please inform the sender immediately and
destroy the original transmittal.
Thank you for your understanding
