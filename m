From: Greg Freemyer <freemyer@NorcrossGroup.com>
Subject: re: [linux-lvm] LVM test suite
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20021023220100.NINF7377.imf24bis.bellsouth.net@TAZ2>
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
Date: Wed Oct 23 17:01:03 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>

 >>  Is there a publicly available LVM test suite?

 >>  OSDL would like to incorporate it into the Scalable Test Platform to
 >>  allow automated regression testing.

In the XFS regression test suite there is a XFS/LVM snapshot test.  (test 068).

http://oss.sgi.com/cgi-bin/cvsweb.cgi/linux-2.4-xfs/cmd/xfstests/068

It does not isolate where the problem is, but a successful run does show that =
the combination work together.

It could easily be modified to work with other filesystems. It does use some of =
the XFS test harness, but it should be easy to eliminate that tie-in.

Greg Freemyer
Internet Engineer
Deployment and Integration Specialist
Compaq ASE - Tru64 v4, v5
Compaq Master ASE - SAN Architect
The Norcross Group
www.NorcrossGroup.com
