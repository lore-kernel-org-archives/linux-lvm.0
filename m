From: darren.miller@philips.com
Subject: Re: [linux-lvm] LVM2-Snapshot 2.6.5 with udm2
Message-ID: <OFA0803F87.B9DFF62F-ON80256E7B.0048CD50-80256E7B.00491D4A@philips.com>
Date: Mon, 19 Apr 2004 14:16:46 +0100
MIME-Version: 1.0
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: linux-lvm-admin@redhat.com





it would appear that xfs_freeze is the source of my problems, LVM2 doesn't
appear to work well with SGI's XFS, unless there is a tool version issue
here, or do I not need to do xfs_freeze with LVM2?
==============================================================================

Darren Miller
Senior Systems Support Engineer
Microsoft Certified Professional
SCO Advanced Certified Engineer
Infomation Systems Department (Core Server Support)
Philips Semiconductors,Milbrook Industrial Estate,Southampton,SO15
0DJ,England
Direct Dial In: +44 (0) 2380 312681


                                                                                                                                                
                                                                                                                                                
                                                             To:   linux-lvm@redhat.com                                                         
                                                             cc:   linux-lvm-admin@redhat.com                                                   
                                                              (bcc: Darren Miller/SOU/SC/PHILIPS)                                               
                                                             Subject:    [linux-lvm] LVM2-Snapshot 2.6.5 with udm2                              
               darren.miller+FromInterNet@philips                                                                                               
               .com                                          Classification:                                                                    
                                                                                                                                                
               Sent by:                                                                                                                         
               linux-lvm-bounces@redhat.com                                                                                                     
                                                                                                                                                
               16/04/2004 13:41                                                                                                                 
               Please respond to LVM general                                                                                                    
               discussion and development                                                                                                       
                                                                                                                                                
                                                                                                                                                








running command: lvcreate -L 28G -s -n snapFri /dev/vault/vol1 completely
hangs, where it did work with UDM1

or though I was able to remove the previous snapshot from using udm1 with
rc1 kernel.

I still have an error relating to LVM when running lilo which might be a
contributing factor:

Warning: '/proc/partitions' does not match '/dev' directory structure.
    Name change: '/dev/dm-3' -> '/dev/mapper/vault-vol1'

Please advise..
==============================================================================


Darren Miller
Senior Systems Support Engineer
Microsoft Certified Professional
SCO Advanced Certified Engineer
Infomation Systems Department (Core Server Support)
Philips Semiconductors,Milbrook Industrial Estate,Southampton,SO15
0DJ,England
Direct Dial In: +44 (0) 2380 312681

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
