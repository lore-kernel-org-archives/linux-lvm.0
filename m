content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <1DCD421BDE8C3C478E9A0A84B75702931165D6@srv-pae-ex01.rge-rs.com.br>
From: "Ricardo Mattia" <rmattia@rge-rs.com.br>
Subject: [linux-lvm] S.A.M.E methodology
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
Date: Thu Jan  8 06:03:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hello.

	Today we have a host running Oracle 8.1.7 on AIX 4.3.3.
	We decided to migrate this system from RISC to Intel and the
choosed operating system was SUSE Linux.
	Besides that, we are changing the way Oracle Datafile's are
distributed. After some internet research, we got in touch with a
methodology called S.A.M.E, which stands for Stripe and Mirror
Everything.=20
	Basicaly, we need to Stripe all the storage available using LVM
(on operating system level) and mirror everything (on storage level). Of
course we increase our risk of an entire system failure in case of just
"one" RAID crash.
	This methodology is explained on Juan Loaiza's whitepaper, from
Oracle Corporation.

	So, my question is : Has anyone implemented this stuff using
Linux SUSE and LVM? If yes, is it work and could you give me some tips
about it?=20
=09
Thanks in advance.

Best Regards,
Ricardo Mattia
http://www.rge-rs.com.br
51 3218-3168
