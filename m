From: tomas <tomas@crepido.com>
Subject: Re: Re: [linux-lvm] How to best use LVM?
Message-ID: <Pine.LNX.4.43.0208160835550.7662-100000@beo>
MIME-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
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
Date: Fri Aug 16 01:44:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: linux-lvm@sistina.com

In response to Paul.

"For "reliability of data" I was thinking of using either ext3 or
reiserfs across a RAID set."

I have had some bad experience with ReiserFS but it was probably caused
by a low kernel version (2.4.16). Otherwise ReiserFS rocks when it comes
to resizing filesystems etc.
I would go with ext3 if I were you, I migrated to ext3 because of my
problems (kernel crash).
Don't use ReiserFS with kernels below version (and including) 2.4.16

I would have tested ReiserFS if I had the chance on a newer kernel but I
was not able (for several reasons) to upgrade to 2.4.18 or 2.4.19

/Tomas

------------------------\|//------------------------
--------------------uUU--00--UUUu-------------------
Tomas Roos, Crepido Systems AB
Address: Box 6131, S-40060 G=F6teborg Sweden
Visit: Karl Johansgatan 27
mailto:tomas@crepido.com  http://www.crepido.com
Tel: +46(0)31-7751850  Cell: +46(0)709 545977
----------------------------------------------------
