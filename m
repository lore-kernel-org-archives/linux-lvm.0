From: Greg Freemyer <freemyer@NorcrossGroup.com>
Subject: re[2]: [linux-lvm] Re: Re: Sharing LVM's via NFS on Redhat 8.0 Part2 - SAMBA?
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20030219162140.DBFH1290.imf33bis.bellsouth.net@tiger2>
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
Date: Wed Feb 19 10:20:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>

 >>  I have some data on logical volumes that are shared via NFS and I=20
 >>  haven't seen any problems, but now that you have asked the question I'm=20
 >>  starting to wonder if I'm putting that data at risk without even being=20
 >>  aware of it....

It depends on your client load, not LVM.

nfs is not a particularly good back-end for database applications.  There can =
be cache-coherency issues.

Oracle in particular only has a very limited number of NFS servers that it =
certifies as a back-end for Oracle clusters (i.e. RAC).

The not yet released NFS 4.0 is supposed to resolve the cache coherency issue, =
but I'm no expert.

Greg Freemyer
