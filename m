From: Greg Freemyer <freemyer-ml@NorcrossGroup.com>
Subject: re[2]: [linux-lvm] A little Cluster/Newbie help pls!
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20030328151303.WDJJ21472.imf43bis.bellsouth.net@tiger2>
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
Date: Fri Mar 28 09:19:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>

 >>  As a side note, there is OpenGFS ( i don't know where it is in
 >>  alpha/beta release, but it is open source).

Ignoring SPOF issues, I would say it is beta quality at best.

To handle the SPOFs:
    You must use an external RAID controller.  ($$)
    You have to setup a HA cluster to run the lockserver.  I don't know if =
transparent failover can be achieved.
