From: Greg Freemyer <freemyer-ml@NorcrossGroup.com>
Subject: re[2]: [linux-lvm] Max storage size per system
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <20030305173231.AWX18401.imf58bis.bellsouth.net@tiger2>
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
Date: Wed Mar  5 11:45:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: Text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>

 >>  On Wednesday 05 March 2003 07:05, Anders Widman wrote:
 >>  > Hm,  sounds  like  lots.  :)  What kind of devices will you be running
 >>  > with.  Even  with  300GB  drives  you will need 300-400 of them to get
 >>  > 100TB.

 >>  Easily achieved w/ such technologies as iscsi and hyperscsi (;

Don't leave out good old FC (Fibre Channel).

I just went to a seminar where EMC is going to start supporting 300 GB ide =
drives in their CX line.  (To be announced shortly.)

I think a maxed out cx600 holds 240 drives.  (Some of these may still need to =
be fibre drives, not ide.)

So you put in a couple of CX600s full of drives and use LVM to manage it.

The only trouble is $$, not technology.

Greg
--=20
Greg Freemyer
