From: Frank Van Damme <frank.vandamme@student.kuleuven.ac.be>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200307271524.49670.frank.vandamme@student.kuleuven.ac.be>
Subject: [linux-lvm] 2 Q's: power outages during pvmove and fragmentation
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
Date: Sun Jul 27 08:25:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hello,

I just bought a new hard disk and put them in my system (It now has 60 gigs=
 +=20
40 gigs), but it might be I move the 40 gigger to another system. Also, the=
=20
60 gigger is faster so I prefer having as much of my data on it as possible=
=2E=20
So I have 2 questions about pvmove.

1: suppose my hamster bites my power cord during a pvmove and only half of =
the=20
data will have moved. How great a disaster does this result in? Does lvm mo=
ve=20
one extend and does it write to disk which LE has been mapped to which PE, =
or=20
does it first write all the data and rewrite the metadata?

2: does lvm ever get fragmented if one moves data around across different=20
disks a lot?

thx.

=2D-=20
=46rank Van Damme    http://www.openstandaarden.be=20
~~~~~~~~~~~~~~~    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
"Je pense, donc je suis brevet=E9."
