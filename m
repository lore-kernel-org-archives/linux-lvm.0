From: Greg Freemyer <freemyer@NorcrossGroup.com>
Subject: re: [linux-lvm] High level architecture (Long)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20030228212026.PJNT658.imf23bis.bellsouth.net@tiger2>
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
Date: Fri Feb 28 15:18:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>

Steve,

You are right about that being a long e-mail.  I have a Compaq (HP) background, =
and they call this a Disaster Tolerant SAN (DT-SAN).

Your also right about DT-SANs requiring deep pockets, and even with Linux I =
think it will take some fairly deep pockets.

HP has a consulting business specifically targeting DT-SANs. I don't know if =
they support Linux or not.  (It used to be VMS and Tru64 only.)=20

http://h18000.www1.hp.com/products/storageworks/solutions/dtsan/

I have no idea where you will get a overall interest in your DT-SAN project=20

Maybe someone at OSDL (http://www.osdl.org/) or on the linux-ha (heartbeat) =
list can give you a recommendation, or maybe you will have to start your own =
DT-SAN project

(A little more below)

 >>  Hi all,

 >>  1) A highly available, peer replicated (i.e. active-active),
 >>  geographically separated (n locations where n=3D2 and n>2), virtualized,
 >>  and Backed-up SAN solution.  That's a tall order.  Companies such as
 >>  FalconStor provide some of this, but at an exceptionally high price.

You do know how expensive that is from a communications perspective don't you.  =
The commercial offerings I have seen require a T3 or larger. =20

I have never priced one, but I assume your talking the 10's of thousands per =
month if you are going between major cities.

I have priced a 100mbit connection across the north end of Atlanta.  That =
actually wasn't so bad.  Around $2K/month IIRC, but I think that is a rare =
situation with Atlanta having excess fiber in the ground.

 >>  2) SCSI over IP or something similar is desirable so that application
 >>  servers can use the exported virtualized storage (either locally on the
 >>  same LAN or remotely over a WAN).  Security here is a big ?.

I have tried the Intel iSCSI demo initiator/target pair and they seem to work =
well.  (I was just curious, so I did not do much testing.)

http://sourceforge.net/projects/intel-iscsi

The target software allows any Linux box to export a drive (or LV) to a Linux =
computer running the initiator. =20

Since iSCSI was just formally approved, there should be a flurry of real =
targets, but I'm not sure thats what you want anyway.

Another competitive product is HyperSCSI, but I don't think HyperSCSI supports =
routers, so it is purely LAN.  (ie. It is a pure ethernet protocol, not a =
TCP/IP protocol).

 >>  3) A highly available virtualized application server pool that supports
 >>  automatic failover to a remote location.  A combination of Clusters,
 >>  LVS, user-mode-linux and replicated SANs can provide a potential
 >>  solution.

I follow clustering, and I don't know any split clustering solutions for Linux. =
=20

One big issue is when the VIP moves, you have to update the routers to send =
traffic for the VIP to the new location.  This can be done, but it takes =
coordination with your ISP, or a lot of your own infrastructure.
