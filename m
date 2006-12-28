In-Reply-To: <20061228110944.5gxv84tcg8ggg08w@www.dragonhold.org>
Subject: RE: [linux-lvm] Mirror between different SAN fabrics
Message-ID: <OFD4DD5BF7.92876779-ONC1257252.003E8F27-C1257252.003F3EA3@schering.de>
From: Christian.Rohrmeier@SCHERING.DE
Date: Thu, 28 Dec 2006 12:31:09 +0100
MIME-Version: 1.0
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: linux-lvm-bounces@redhat.com


Hi,

ahhh, I see where the difference in view comes from: MC-Service Guard is a
HA clustering suite that does not contain a cluster FS; it simply does
package switching upon failover between two or more nodes. The LUNs of the
(under the multipath/RAID/LVM sandwitch) FS that is mounted on one system
are seen by the other, but the FS is NOT mounted on the second system. On
fail-over, the package is switched from one node to the other, and the
mounting of the FS is also moved from one to the other. Hence, the RAID
block and the LVM structures are consistent (albeit possibly not cleanly
unmounted) when they are taken ahold of by the second node.

Right, if I wanted to have cluster FS I'd have to use Veritas or RH Cluster
Suite. MC-Serviceguard is somehting different. =)

-Christian
_________________
Christian Rohrmeier
Schering AG
Corporate IT - Infrastructure and Services
Computer Systems and Operations
Unix Server Operations
Tel +49 30 468 15794
Fax +49 30 468 95794


                                                                           
             Graham Wood                                                   
             <gwood@dragonhold                                             
             .org>                                                      To 
             Sent by:                  LVM general discussion and          
             linux-lvm-bounces         development <linux-lvm@redhat.com>  
             @redhat.com                                                cc 
                                                                           
                                                                   Subject 
             28.12.2006 12:09          RE: [linux-lvm] Mirror between      
                                       different SAN fabrics               
                                                                           
             Please respond to                                             
                LVM general                                                
              discussion and                                               
                development                                                
             <linux-lvm@redhat                                             
                   .com>                                                   
                                                                           
                                                                           





> I haven't tried it in a cluster yet. I was planning on using HP's
> MC-ServiceGuard to deal with HA clustering. I don't see why the LUNs that
> are used on one system with mdadm can't be used another, since the RAID
> block is on the disk and is readable even on a system upon which it
wasn't
> created on. /etc/mdadm.conf will ofcourse need to be copied and kept
> current on all cluster nodes, but with the config file and the RAID block
> on the disk, an "mdadm --assemble" should work. Importing the LVM
> structures should then also not be a problem.
Assuming that the underlying devices are "clean" this may indeed
work... Sometimes.

However, things like the dirty region log are going to be a mess.

Imagine that you've got apache running on node 1 using one GFS volume,
and mysql on the second using another - both backed onto the same md
physical volume.  They will each be writing to the same DRL their
dirty regions, and trampling all over each other's status information.

Then node2 crashes with some IO in progress.  In the time taken for it
to reboot, the DRL could have been totally over-written by node1 - at
this point there may be differences between the two underlying devices
that you don't know about, and you've just caused data corruption.

Even if the devices were clean when the second node came up, the first
has it open, and the fact that it's not in a clean/shutdown state is
likely to be recorded too, and node2 is going to be unhappy about that
too.

All in all, unless md is cluster "aware", it's likely to cause you
trouble down the line....

Graham


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
