Return-Path: <lishiomin@alinka.com>
Message-ID: <XFMail.20010418182257.lishiomin@alinka.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Resent-Message-Id: <3ADDBB97.36395EBD@alinka.com>
Resent-To: intermezzo-discuss@lists.sourceforge.net
Date: Wed, 18 Apr 2001 18:22:57 +0200 (CEST)
From: Ludovic Ishiomin <lishiomin@alinka.com>
Subject: [linux-lvm] The ALINKA Linux Clustering Letter
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hello All,

Since one year now, the Alinka team has been writing
a weekly summary of the activity in mailing-lists=20
relative to linux clustering (such as beowulf, linux
virtual server, linux-ha or journaling file systems) and=20
general clustering news.

This "digest" is provided freely as a weekly email
from clustering@alinka.com and is intended to give
a good overview of the linux clustering news for people
without enough time to read all about it.

As the ALINKA Linux Clustering Letter covers this=20
mailing-list, and as many of you readers of this list
might not even know that the ALINKA Linux Clustering
Letter exists (We had an annoucement last year on the
mailing-lists, but we did not make any other posts),
I take the opportunity of the first birthday of the
ALINKA Linux Clustering Letter to tell you about it.

Here is a sample of the ALINKA Linux Clustering Letter.
If you like it, you can subscribe to the list: send an=20
e-mail to clustering@alinka.com from the address you=20
wish to subscribe, with the word "subscribe" in the subject.


-----------The ALINKA Linux Clustering Letter-------------



The ALINKA Linux Clustering Letter,=20

Wednesday, April the 11th. 2001
by Antoine Brenner (abrenner@alinka.com)


Dear readers, I am happy to send you this week's edition of
clustering@alinka.com

This edition is the 52th since we started the Letter: this
is also first birthday of the ALINKA Linux Clustering Letter !

clustering@alinka.com is a free weekly e-mail newsletter on linux=20
clustering. It provides a summary of the weekly activity in
mailing-lists relative to linux clustering (such as beowulf,=20
linux virtual server or linux-ha) and general clustering news.
For more information about ALINKA, see: http://www.alinka.com


News from the High Performance world, by Dr Laurent Gatineau
(lgatineau@alinka.com)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Tips and tricks from the Beowulf mailing list
=3D=3D=3D=3D=3D=3D=3D=3D
* Scott Shealy [m1] seeks comparaison  about P4 and Athlon. Some  CPUs
  benchmarks were given  [m3, m5], but as  Josh Fryman [m2] explain it
  without  a  good compiler benchmarks  could  be not  usefull. In the
  memory side, P4 have a good bandwith, see [m4, m6]
[m1] http://geocrawler.com/archives/3/423/2001/4/150/5484689/
[m2] http://geocrawler.com/archives/3/423/2001/4/100/5489036/
[m3] http://geocrawler.com/archives/3/423/2001/4/150/5532781/
[m4] http://geocrawler.com/archives/3/423/2001/4/150/5486554/
[m5] http://geocrawler.com/archives/3/423/2001/4/100/5490088/
[m6] http://geocrawler.com/archives/3/423/2001/4/100/5492228/

* There was a long  thread about what  tools to use for cloning nodes.
  Some  pointers were  given:   systemimager  [1],  lui  [2],   Scyld,
  kickstart from RedHat, Dolly [3], imgdisk [4], or just copy one hard
  drive on an other one... One can of course use Alinka Raisin [5] !
[1] http://sourceforge.net/projects/systemimager/
[2] http://oss.software.ibm.com/lui
[3] http://www.cs.inf.ethz.ch/CoPs/patagonia/
[4] http://www-unix.mcs.anl.gov/systems/software/city/
[5] http://www.alinka.com/araisin.php3
=20
* Don Morton  [m1] was   looking  for information   about PBS  and PGI
  interactions. He answered  himself [m2]  and  gave a pointer to   an
  online documentation [1]
[1] http://www.cs.umt.edu/~morton/PBS/
[m1] http://geocrawler.com/archives/3/423/2001/4/50/5507440/
[m2] http://geocrawler.com/archives/3/423/2001/4/50/5511697/

* J.W.Armstrong [m1] is looking for a parallel make for cluster.  Greg
  Lindahl  [m2]    warn  him because  compiles are     not  always CPU
  bounds. Dean  Carpenter  [m3]  gave  a  link  to ANTS [1]   (a  load
  balancing system).  Andreas  Boklund  [m4] gave results with  MPmake
  and Mosix.
[1] http://unthought.net/antsd/
[m1] http://geocrawler.com/archives/3/423/2001/4/50/5532806/
[m2] http://geocrawler.com/archives/3/423/2001/4/0/5533061/
[m3] http://geocrawler.com/archives/3/423/2001/4/0/5533381/
[m4] http://geocrawler.com/archives/3/423/2001/4/0/5536620/

* Javier  Iglesias [m1]  wants to build  a  cluster with two NICs  per
  node, one for administration and  one for computation. He is looking
  for advice.  Robert G.  Brown [m2] answered  that  on a cluster  two
  NICs could not help for some applications.  Peter H. Koenig [m3] and
  Dr O. Parchment [m4] gave two links two similar architecture [1,2].
[1] http://www.tu-chemnitz.de/urz/anwendungen/CLIC/index.php3?lang=3Den
[2] http://www.soton.ac.uk/~sucsweb/Research/Metropolis
[m1] http://geocrawler.com/archives/3/423/2001/3/50/5479935/
[m2] http://geocrawler.com/archives/3/423/2001/4/150/5482880/
[m3] http://geocrawler.com/archives/3/423/2001/4/100/5490272/
[m4] http://geocrawler.com/archives/3/423/2001/4/100/5490384/

* Wes  Wells [m1] is  looking for  an alternative  to NFS.  Rob Latham
  [m2]   gave  its opinion  about some   solutions.  Jag [m3] and Greg
  Lindahl [m4] wrote that AFS could have some limitations depending on
  what is needed.
[m1] http://geocrawler.com/archives/3/423/2001/4/50/5517812/
[m2] http://geocrawler.com/archives/3/423/2001/4/0/5518993/
[m3] http://geocrawler.com/archives/3/423/2001/4/0/5519315/
[m4] http://geocrawler.com/archives/3/423/2001/4/0/5530241/


News from the High Availability world, by Guillaume GIMENEZ
(ggimenez@alinka.com)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
drbd
=3D=3D=3D=3D=3D=3D=3D=3D
* Ard van Breemen said [m1] that drbd and PostgreSQL 7.1
will be made for eachother.
[m1] http://www.geocrawler.com/lists/3/SourceForge/3756/0/5522029/

* Mike Debreceni advise us that PostgreSQL before 7.1 is
very slow with protocol C.
[m2] http://www.geocrawler.com/lists/3/SourceForge/3756/0/5515718/
[m3] http://www.geocrawler.com/lists/3/SourceForge/3756/0/5520220/

LVS
=3D=3D=3D=3D=3D=3D=3D=3D
* Wensong Zhang announces [m4] ipvs release 0.2.9 for kernel 2.4
is available on LVS website [1].
[1] http://www.LinuxVirtualServer.org/
[m4]
http://marc.theaimsgroup.com/?l=3Dlinux-virtual-server&m=3D98705209023369&w=
=3D2

* Mike keefe posted [m5] a performance evaluation of LVS.
[m5]
http://marc.theaimsgroup.com/?l=3Dlinux-virtual-server&m=3D98685085410292&w=
=3D2


News on the Filesystems front, by  Ludovic Ishiomin
(lishiomin@alinka.com)
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Coda
=3D=3D=3D=3D=3D
* Clemens Hermann wanted to know if he could use Coda to do mail
replication
[1m].
Jan Harkes answered that Coda can give surprises on reintegration and
gave the URL of unisson [1] [2m].
* Steffen Neumann succeeded to build a prototype of a backup solution of
a Coda server, but had some concerns about large scale Backup [3m].
* Steffen Schaefer asked if it is possible to change the Venus timeout.
Jan Harles answered that it is possible but not adviseable because
of the protocol used by RPC2 [4m].
* Dermot Cassidy had problems to configure and run its
updateclnt/updatesrv daemon [5m].
* Steffen Neumann gave some tips about management of volumes on Coda and
ACLs [6m].
* Oliver had some configuration questions on how to setup a replicated
volume [7m]. Jan Harkes gave explanations about VSG and how it is=20
used on clients and servers [8m].
* David Petterson had problems running procmail (can't read .procmailrc
in the home directory) [9m]. Jan Harkes described its configuration=20
that runs without any problems [10m].
[1m] http://www.coda.cs.cmu.edu/maillists/codalist-2001/0264.html
[2m] http://www.coda.cs.cmu.edu/maillists/codalist-2001/0265.html
[3m] http://www.coda.cs.cmu.edu/maillists/codalist-2001/0270.html
[4m] http://www.coda.cs.cmu.edu/maillists/codalist-2001/0275.html
[5m] http://www.coda.cs.cmu.edu/maillists/codalist-2001/0276.html and
the followings.
[6m] http://www.coda.cs.cmu.edu/maillists/codalist-2001/0282.html
[8m] http://www.coda.cs.cmu.edu/maillists/codalist-2001/0281.html
[9m] http://www.coda.cs.cmu.edu/maillists/codalist-2001/0286.html
[10m] http://www.coda.cs.cmu.edu/maillists/codalist-2001/0284.html
[1] http://www.cis.upenn.edu/~bcpierce/unison/

GFS
=3D=3D=3D=3D=3D
* Anne Malicia had some questions about page cache management in GFS for
the 2.4 kernel [11m]. It appears she found a bug [12m].
* There was a thread about the implementation of flock() in GFS which
leaves the process in D-state (that increase the load of the machine)
[13m]. Eventually, Mike Tilstra modified the code so that only one=20
process is in a D state [14m].
* Gil Shallom asked about Callback policy and pointed that it has a big
impact about performance [15m]. Ken Preslan detailed the one adopted
in GFS [16m].
* David Zafman detailed features of the in-kernel membership service
written by Compaq and announced that it should be released in Open=20
Source [17m]. David Teigland enjoyed the announce [18m]. Jeff Darcy
was not convinced by in-kernel membership, and felt that it is better
to stay in user space [19m].=20
* There was a technical thread about integration of IBM DLM and GFS
[20m].
[11m]
http://lists.sistina.com/pipermail/gfs-devel/2001-April/001931.html
[12m]
http://lists.sistina.com/pipermail/gfs-devel/2001-April/001940.html
[13m]
http://lists.sistina.com/pipermail/gfs-devel/2001-April/001929.html and
the followings.
[14m]
http://lists.sistina.com/pipermail/gfs-devel/2001-April/001941.html
[15m]
http://lists.sistina.com/pipermail/gfs-devel/2001-April/001930.html
[16m]
http://lists.sistina.com/pipermail/gfs-devel/2001-April/001937.html
[17m]
http://lists.sistina.com/pipermail/gfs-devel/2001-April/001939.html
[18m]
http://lists.sistina.com/pipermail/gfs-devel/2001-April/001942.html
[19m]
http://lists.sistina.com/pipermail/gfs-devel/2001-April/001943.html
[20m]
http://lists.sistina.com/pipermail/gfs-devel/2001-April/001946.html and
the followings.

Intermezzo
=3D=3D=3D=3D=3D
* Vladimir Ivaschenko was not able to get to the b1_0_0 branch of the
cvs [21m].
Shirish Patak gave the tip [22m].
[21m] http://www.geocrawler.com/archives/3/8077/2001/4/0/5528423/
[22m] http://www.geocrawler.com/archives/3/8077/2001/4/0/5530462/

JFS
=3D=3D=3D=3D=3D
* Andreww Klaasseen wanted to know how close to production release is
JFS. Steve Best gave the plans [23m].
* James Lewis Nance reported the same problems he found with earlier
drop when building mozilla with the latest JFS drop [24m].
[23m]
http://oss.software.ibm.com/pipermail/jfs-discussion/2001-April/000195.html
[24m]
http://oss.software.ibm.com/pipermail/jfs-discussion/2001-April/000196.html

LVM
=3D=3D=3D=3D=3D
* Arthur Viak reported problems with vgcreate [25m]. Holger Grothe
asnwered that a kernel upgrade is needed [26m].
* Jonathan DeHaan upgraded from beta5 to beta6 and had problems with
vgscan
[27m]. Andreas Dilger advices to use beta5 patch with beta5 tools [28m].
* There was a thread about the way to patch 2.2.19 with LVM [29m].
* Jorg de Jong announced lvmgui 0.3 [30m].
* Terje Kvernes announced the development of a LVM library in Perl
[31m].
* Heinz Mauelshagen announced LVM 0.9.1beta7 [32m].
* Erik B=EF=BF=BDgfors was not able to remove a logical volume after using a
snapshot [33m]. Heinz Mauelshagen confirmed that it is an old bug
which is fixed in the latest version [34m].
[25m]
http://lists.sistina.com/pipermail/linux-lvm/2001-April/006606.html
[26m]
http://lists.sistina.com/pipermail/linux-lvm/2001-April/006609.html
[27m]
http://lists.sistina.com/pipermail/linux-lvm/2001-April/006597.html
[28m]
http://lists.sistina.com/pipermail/linux-lvm/2001-April/006601.html
[29m]
http://lists.sistina.com/pipermail/linux-lvm/2001-April/006615.html
[30m]
http://lists.sistina.com/pipermail/linux-lvm/2001-April/006620.html
[31m]
http://lists.sistina.com/pipermail/linux-lvm/2001-April/006628.html
[32m]
http://lists.sistina.com/pipermail/linux-lvm/2001-April/006629.html
[33m]
http://lists.sistina.com/pipermail/linux-lvm/2001-April/006639.html
[34m]
http://lists.sistina.com/pipermail/linux-lvm/2001-April/006640.html


XFS
=3D=3D=3D=3D=3D
* Brandy Dawkins asked if Oracle runs fine on XFS [35m]. Adam
Cioccarelli related its experience [36m] and Steve Lord added that
direct IO available with XFS should be a great interest to Oracle [37m].
* Stephen Adler reported its very good experience with XFS [38m].
* Ed McKenzie was unable to mount an XFS partition by label. After a bit
of investigation, he had the same problem with ext2 partition, and
concluded that the problem comes from mount and devfsd [39m].
* Ryo Ono wanted to partition a disk with XFS so that it would be
readable on both Irix and Linux [40m]. Nathan Scott recommended=20
to use the fx utility on Irix [41m], because fdisk on Linux does=20
not handle properly the SGI disklabel [42m], although the kernel=20
recognizes themp properly [43m].
* Thomas Graichen asked if LVM snapshoting is planned for XFS. Steve
Lord answered that this feature is planned, bu there still a lot of=20
work to stabilize XFS. He also announced that Peter Braam is working on
integrating snapfs and Intermezzo with XFS [44m].
* Lennert Buytenhek found a bug with XFS and named pipe [45m]. Steve
Lord confirmed it and hacked the cvs to correct it [46m].
* Doug wanted to know if CXFS (Clustered XFS filesystem) would be ported
to Linux. Steve Lord announced that a port is planned [47m].
* Justin Tripp reported a weird behavior on a NFS exported XFS
filesystem [48m].
Steve Lord confirmed the problem and sent a patch [49m] which resolved
the problem [50m]. Later Ajay Shekhawat reported a oops on its
NFS server exporting an XFS volume [51m].
* Kenneth Leung tried the new RedHat Wolverine ISO image with XFS
support provided by SGI (0.10 prerelease) and found a problem with=20
automount [52m]. Russel Catalan confirmed this is a RedHat Wolverine
issue [53m].
* Petru Paler was unable to compile XFS on a sparc64 box. He had to add
a #include in a XFS file [54m]. Later he reported an oops during XFS
recovery [55m].

[35m]
http://linux-xfs.sgi.com/projects/xfs/mail_archive/0104/msg00039.html
[36m]
http://linux-xfs.sgi.com/projects/xfs/mail_archive/0104/msg00040.html
[37m]
http://linux-xfs.sgi.com/projects/xfs/mail_archive/0104/msg00041.html
[38m]
http://linux-xfs.sgi.com/projects/xfs/mail_archive/0104/msg00064.html
[39m]
http://linux-xfs.sgi.com/projects/xfs/mail_archive/0104/msg00127.html
[40m]
http://linux-xfs.sgi.com/projects/xfs/mail_archive/0104/msg00161.html
[41m]
http://linux-xfs.sgi.com/projects/xfs/mail_archive/0104/msg00181.html
[42m]
http://linux-xfs.sgi.com/projects/xfs/mail_archive/0104/msg00267.html
[43m]
http://linux-xfs.sgi.com/projects/xfs/mail_archive/0104/msg00162.html
[44m]
http://linux-xfs.sgi.com/projects/xfs/mail_archive/0104/msg00190.html
[45m]
http://linux-xfs.sgi.com/projects/xfs/mail_archive/0104/msg00220.html
[46m]
http://linux-xfs.sgi.com/projects/xfs/mail_archive/0104/msg00248.html
[47m]
http://linux-xfs.sgi.com/projects/xfs/mail_archive/0104/msg00297.html
[48m]
http://linux-xfs.sgi.com/projects/xfs/mail_archive/0104/msg00260.html
[49m]
http://linux-xfs.sgi.com/projects/xfs/mail_archive/0104/msg00261.html
[50m]
http://linux-xfs.sgi.com/projects/xfs/mail_archive/0104/msg00274.html
[51m]
http://linux-xfs.sgi.com/projects/xfs/mail_archive/0104/msg00278.html
[52m]
http://linux-xfs.sgi.com/projects/xfs/mail_archive/0104/msg00288.html
[53m]
http://linux-xfs.sgi.com/projects/xfs/mail_archive/0104/msg00299.html
[54m]
http://linux-xfs.sgi.com/projects/xfs/mail_archive/0104/msg00292.html
[55m]
http://linux-xfs.sgi.com/projects/xfs/mail_archive/0104/msg00305.html


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
To subscribe to the list, send e-mail to clustering@alinka.com from the
address you wish to subscribe, with the word "subscribe" in the subject.

To unsubscribe from the list, send e-mail to clustering@alinka.com from=20
the address you wish to unsubscribe from, with the word "unsubscribe" in
the subject.

Alinka is the editor of the ALINKA ORANGES and ALINKA RAISIN=20
administration software for Linux clusters.=20
(Web site: http://www.alinka.com )
