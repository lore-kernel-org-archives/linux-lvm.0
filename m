From: Greg Freemyer <freemyer@NorcrossGroup.com>
Subject: re: [linux-lvm] invalid number of free physical extents
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20020827204539.YTUD10186.imf28bis.bellsouth.net@TAZ2>
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
Date: Tue Aug 27 15:50:17 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>

My mistake,

I thought I had plenty of free space on the VG, put apparently, I was wrong.

I have reduced the size of a couple of my test LVs and it is working now.

Greg
 >>  All,

 >>  I have a VG which I have used extensively for snapshot testing.

 >>  Now everytime I try to get a snapshot, it fails with error code 13

 >>  Per the man entry:

 >>  13 invalid number of free physical extents

 >>  I don't want to rebuild this VG because some of the other LVs on it have
 >>  valid data.

 >>  Is there a lvm repair tool that might fix this for me.

 >>  Thanks,
 >>  Greg
 >>  =3D=3D=3D=3D=3D=3D
 >>  Greg Freemyer
 >>  Internet Engineer
 >>  Deployment and Integration Specialist
 >>  Compaq ASE - Tru64 v4, v5
 >>  Compaq Master ASE - SAN Architect
 >>  The Norcross Group
 >>  www.NorcrossGroup.com

 >>  _______________________________________________
 >>  linux-lvm mailing list
 >>  linux-lvm@sistina.com
 >>  http://lists.sistina.com/mailman/listinfo/linux-lvm
 >>  read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html





Greg Freemyer
Internet Engineer
Deployment and Integration Specialist
Compaq ASE - Tru64 v4, v5
Compaq Master ASE - SAN Architect
The Norcross Group
www.NorcrossGroup.com
