content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <023521542756A0459EBDC0A21978DFB4241B88@exch.eachnetsh>
From: =?gb2312?B?1u6zrA==?= <zhu_chao@eachnet.com>
Subject: [linux-lvm] =?gb2312?B?tPC4tDogW2xpbnV4LWx2bV0gUy5BLk0uRSBtZXRob2RvbG9neQ==?=
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
Date: Thu Jan  8 07:51:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="gb2312"
To: linux-lvm@redhat.comlinux-lvm@redhat.com

Hi,
	What storage are you using on Linux? How many disks do you have?
	If you have only less than 10 disks, why not just using storage raid10 =
feature?
	We used SAME on Sun/T3(9disk/raid10) via storage hardware.
	If I have many T3, then in every single t3, I use Raid1 and use VxVM =
for Stripe.It is mature solution and I used it on solaris/aix. But not =
on linux yet.
	If you are afraid of Raid Crash, you can try to have dual controller =
raid,(but currently linux kernel does not Dynamic Multipathing yet).
	Or you can use poor man's stripe:
	/oradata1 (datafile 1,5 ..here) --raid10
	/oradata2 (datafile 2,6 ..here) --raid10
	/oradata3 (datafile 3,7,, here) --raid10
	/oradata4 (datafile 4,8... here) --raid10
Regards.
Zhu Chao.


-----=D4=AD=CA=BC=D3=CA=BC=FE-----
=B7=A2=BC=FE=C8=CB: Ricardo Mattia [mailto:rmattia@rge-rs.com.br]
=B7=A2=CB=CD=CA=B1=BC=E4: 2004=C4=EA1=D4=C28=C8=D5 19:01
=CA=D5=BC=FE=C8=CB: linux-lvm@redhat.com
=D6=F7=CC=E2: [linux-lvm] S.A.M.E methodology


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


_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
