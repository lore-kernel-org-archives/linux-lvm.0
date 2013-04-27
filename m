Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r3RBfJ0x008041
	for <linux-lvm@redhat.com>; Sat, 27 Apr 2013 07:41:19 -0400
Received: from nm19-vm0.bullet.mail.bf1.yahoo.com
	(nm19-vm0.bullet.mail.bf1.yahoo.com [98.139.213.162])
	by mx1.redhat.com (8.14.4/8.14.4) with SMTP id r3RBfHTC004072
	for <linux-lvm@redhat.com>; Sat, 27 Apr 2013 07:41:18 -0400
References: <1367053149.42959.YahooMailNeo@web163001.mail.bf1.yahoo.com>
	<CABYJTamHnQutdjA6CD3D6B+5sZ0gc4+6St3p0ykAYt62t3Eb6Q@mail.gmail.com>
Message-ID: <1367062877.86794.YahooMailNeo@web163006.mail.bf1.yahoo.com>
Date: Sat, 27 Apr 2013 04:41:17 -0700 (PDT)
From: Mahmood Naderan <nt_mahmood@yahoo.com>
In-Reply-To: <CABYJTamHnQutdjA6CD3D6B+5sZ0gc4+6St3p0ykAYt62t3Eb6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] problem mounting the lvm drive
Reply-To: Mahmood Naderan <nt_mahmood@yahoo.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: mohammad azimi <mohammad.reza.azimi@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>



> Run
> vgchange -ay vgname=20
> To activate it then mount it.

Thanks a lot. Can you explain why it had been deactivated?=20

I want to know should I run that command after every reboot?


Regards,
Mahmood



________________________________
From: mohammad azimi <mohammad.reza.azimi@gmail.com>
To: Mahmood Naderan <nt_mahmood@yahoo.com>=20
Cc: LVM general discussion and development <linux-lvm@redhat.com>=20
Sent: Saturday, April 27, 2013 1:54 PM
Subject: Re: [linux-lvm] problem mounting the lvm drive



Hi
Run
vgchange -ay vgname=20
To activate it then mount it.=EF=BF=BD
