Message-ID: <3EA6C508.9020702@roma2.infn.it>
From: Roberto Ammendola <roberto.ammendola@roma2.infn.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] performance tests
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
Date: Wed Apr 23 11:51:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

Hi list,
I would like to hear some opinions about a configuration: I have a dual 
Xeon with 2 RAID5 HW controllers, so that from the OS side I have two 
SCSI disks. I am trying different configurations to see which one has 
the best performances. The machine will be a file server for a bunch of 
people.
The question is: would you use LVM over a SW-RAID0 between the two SCSI 
disks? Is native LVM striping that better (in terms of performance I mean)?
Let me know, I'll run bonnie++ meanwhile, but I don't know if it 
highlights the differences: I should simulate a multiuser stress of the 
disks. Any advice?

ciao rob

-- 
______________________________________________________________________

      Roberto Ammendola    INFN - Roma II - APE group
 tel: +39-0672594504  email: roberto.ammendola@roma2.infn.it   // \
      ICQ: 152497874    MSN: ammendola_ro@hotmail.com          \\_/ //
__________________________________________   ''-.._.-''-.._.. -(||)(')
                                                               '''
