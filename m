Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7H6j7V21888
	for <linux-lvm@redhat.com>; Wed, 17 Aug 2005 02:45:07 -0400
Received: from twilight.cs.hut.fi (twilight.cs.hut.fi [130.233.40.5])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j7H6j69U013280
	for <linux-lvm@redhat.com>; Wed, 17 Aug 2005 02:45:06 -0400
Received: from hilarious.cs.hut.fi (hilarious.cs.hut.fi [130.233.41.145])
	by twilight.cs.hut.fi (Postfix) with ESMTP id 5CB572CEC
	for <linux-lvm@redhat.com>; Wed, 17 Aug 2005 09:44:58 +0300 (EEST)
Received: (from vherva@localhost)
	by hilarious.cs.hut.fi (SGI-8.12.5/8.12.5) id j7H6iwXm035479
	for linux-lvm@redhat.com; Wed, 17 Aug 2005 09:44:58 +0300 (EEST)
Date: Wed, 17 Aug 2005 09:44:57 +0300
From: Ville Herva <vherva@twilight.cs.hut.fi>
Message-ID: <20050817064457.GA35667@niksula.cs.hut.fi>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Upgrade from 2.6.10-ac8 to 2.6.12.5 broke lvm rootfs
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

[repost: first post did not show up. sorry for the possible dupe]

After upgrading the kernel from 2.6.10-ac8 to 2.6.12.5 the initramfs was no     
longer able to mount rootfs.                                                    
                                                                                
  mount: error 6 mounting ext3                                                  
                                                                                
All the configuration options are identical, and upgrading lvm2 package:        
  lvm2-2.00.25-1.01       -> lvm2-2.01.14-1.0                                   
  device-mapper-1.00.19-2 -> device-mapper-1.01.04-1.0                          
                                                                                
Did not change anything.                                                        
                                                                                
Dm, ext3 and the relevant block device drivers statically compiled in.          
                                                                                
The vg has lvm1 format, fwiw.                                                   
                                                                                
I enabled all the debug options I could think of in the nash-based initramfs    
init script. That did not appear to tell much: all I was able to tell was       
that lvm was succesfully called by the init script:                             
                                                                                
mount -t proc /proc /proc                                                       
mount -t sysfs none /sys                                                        
insmod /lib/dm-snapshot.ko                                                      
mkdevices /dev                                                                  
mkdmnod                                                                         
lvm vgscan -v                                                                   
# sleep 5                                                                       
lvm vgchange -ay                                                                
# sleep 5                                                                       
lvm vgmknodes                                                                   
# sleep 5                                                                       
mkrootdev /dev/root                                                             
umount /sys                                                                     
# sleep 5                                                                       
mount -o defaults --ro -t ext3 /dev/root /sysroot                               
switchroot /sysroot                                                             
                                                                                
but those didn't give any meaningful output (other than notices about           
setting log indentation level).                                                 
                                                                                
Finally, I added "sleep 5" after each lvm command (commented out above),        
which appeared "solve" the problem.                                             
                                                                                
Apparently the lvm scripts somehow do their initialization asynchronously
and the init script tries to mount root before it is available. I'm not sure
why this is affected by the kernel version, though.
                                                                                
                                                                                
                                                                                
-- v --                                                                         

v@iki.fi
