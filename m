From: Greg Freemyer <freemyer@NorcrossGroup.com>
Subject: re[4]: [linux-lvm] A little Cluster/Newbie help pls!
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20030328174704.INYS10170.imf25bis.bellsouth.net@tiger2>
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
Date: Fri Mar 28 11:45:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>

 >>  Due to state issues, failover WILL cause any 'during failover' file
 >>  operations to fail. But on the other side of that, the way that samba
 >>  deals with file moves/copies ensures that no data will be lost.. simply,
 >>  restart the operation immediately after the error. In our system, the
 >>  error occurs the moment that the failover machine takes over. other than
 >>  having to redo any 'in failover' operations, the failover is completely
 >>  transparent to clients.. if no operations are occuring, then there will
 >>  be no sign to clients that a failover occured.

 >>  Matt Schillinger

Matt,

You should look at the Linux-HA (heartbeat) archives.  I'm pretty sure you can =
even get truly transparent samba failover, but I have not tried to do that yet.

It was the OpenGFS lock server failover I was talking about.

Greg
