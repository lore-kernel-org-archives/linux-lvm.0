From: Greg Freemyer <freemyer@NorcrossGroup.com>
Subject: re[2]: [linux-lvm] extending LVM for school project
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20030410192447.XKKY13659.imf38bis.bellsouth.net@tiger2>
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
Date: Thu Apr 10 14:22:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>
Cc: k@kaisung.com

EVMS 2 just released similar cluster functionality on Apr. 1.

I don't know any details, but you might want to look at what they did as far as =
making it cluster aware.

I do know they use Linux-HA (heartbeat) for the cluster infrastructure piece.  =
(i.e. membership, quorum, cluster comm, event notification)

If you don't want to use heartbeat for some reason, CI (cluster interconnect) =
and OSDL cluster (not released/available) also offer cluster infrastructure =
solutions.

Greg

 >>  What about working towards making LVM cluster aware and making it more
 >>  available, putting in better failover mechanisms in a clustered
 >>  environment ...

 >>  If the work is done for for a hybrid setup (no need to have a shared
 >>  disk, or you may have a mix of shared disk and just a some disks
 >>  connected to one of the nodes in the network.) you can save the cost of
 >>  having to buy expensive disks and switches and can do the work with the
 >>  available setup in the university.

 >>  I am myself planning to work towards extending LVM2 for such a setup and
 >>  we can share our work : )O

 >>  Thanks,
 >>  Sharad.

 >>  > >-----Original Message-----
 >>  > >From: Kai-Min Sung [mailto:k@kaisung.com]
 >>  > >Sent: Wednesday, April 09, 2003 11:25 AM
 >>  > >To: Linux-lvm@sistina.com
 >>  > >Subject: [linux-lvm] extending LVM for school project
 >>  > >
 >>  > >Hey everyone,
 >>  > >    I'm a masters student taking a distributed systems project class
 >>  > >and would like to work on extending LVM. My initial idea was to
 >>  modify
 >>  > >LVM and allow it to create physical volumes using disks on remote
 >>  nodes.
 >>  > >But then I read posts about using ENBD to achieve this. Do people on
 >>  > >this list have suggestions or ideas for a fun/interesting project
 >>  that
 >>  > >could be accomplished within 10 weeks?
 >>  > >
 >>  > >Regards,
 >>  > >Kai-Min Sung
 >>  > >
 >>  > >
 >>  > >
 >>  > >_______________________________________________
 >>  > >linux-lvm mailing list
 >>  > >linux-lvm@sistina.com
 >>  > >http://lists.sistina.com/mailman/listinfo/linux-lvm
 >>  > >read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

 >>  _______________________________________________
 >>  linux-lvm mailing list
 >>  linux-lvm@sistina.com
 >>  http://lists.sistina.com/mailman/listinfo/linux-lvm
 >>  read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
