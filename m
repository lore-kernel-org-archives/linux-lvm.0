content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: RE: [linux-lvm] Disk damaged
Message-ID: <82706A2FAC4D08468A1652B4B7DD0C44CB0A43@mx1.bouvet.no>
From: "Kjetil H. Paulsen" <kjetil.paulsen@bouvet.no>
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
Date: Mon Dec  1 03:23:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

not doable to find the same disk, however, it doesn't seem like there =
was=20
any data on the damaged disk... I have a 240gb disk cluster and only =
100gb
was used, the damaged disk  is the last one and is a 60gb disk...=20
will I get it up and running again by executing the commands suggested?=20
I can read all the data on the volume now, but get IO error when trying =
to write...

		-----Opprinnelig melding-----=20
		Fra: Spam [mailto:spam@tnonline.net]=20
		Sendt: su 30.11.2003 13:56=20
		Til: Kjetil H. Paulsen=20
		Kopi:=20
		Emne: Re: [linux-lvm] Disk damaged
	=09
	=09
		=20
		  The  first  thing  you should do is to find another disk of the same
		  size  and  model  and  then  try dd_rescue to move whatever readable
		  information you can.
	=09
	=09
	=09
		> Hi
	=09
		> It seems like one of my disks as gone down, fortunately the last
		> disk in the volume (/dev/hdg). Can I get about this by doing:
	=09
		> vgreduce vol_grp /dev/hdg
		> umount /stuff
		> e2fsadm -L-60G /dev/vol_grp/big
	=09
		> _______________________________________________
		> linux-lvm mailing list
		> linux-lvm@sistina.com
		> http://lists.sistina.com/mailman/listinfo/linux-lvm
		> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
	=09
	=09
	=09
	=09
	=09
		_______________________________________________
		linux-lvm mailing list
		linux-lvm@sistina.com
		http://lists.sistina.com/mailman/listinfo/linux-lvm
		read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
