Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i28CAG802530
	for <linux-lvm@redhat.com>; Mon, 8 Mar 2004 07:10:16 -0500
Received: from server6.hostpoint.ch (server6.hostpoint.ch [217.26.52.16])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i28CAEST007349
	for <linux-lvm@redhat.com>; Mon, 8 Mar 2004 07:10:14 -0500
Received: from 62-2-186-249.sefanet.ch ([62.2.186.249] helo=markus.org)
	by server6.hostpoint.ch with asmtp (TLSv1:RC4-MD5:128)
	(Exim 4.24)
	id 1B0JaG-0004iQ-KV
	for linux-lvm@redhat.com; Mon, 08 Mar 2004 13:10:12 +0100
Message-ID: <404C628D.1030608@markus.org>
From: Markus Baertschi <markus@markus.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM Multi Path Support
References: <20040303190349.14912.qmail@web60910.mail.yahoo.com>
In-Reply-To: <20040303190349.14912.qmail@web60910.mail.yahoo.com>
Content-Transfer-Encoding: quoted-printable
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Mon Mar  8 07:08:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@redhat.com

I'd like to relate my experiences with multipath support and LVM.
We have an installation with several DB servers connected with
fiber to a SAN unit. All connections are doubled.
- Two fiber cards (Qlogic)
- Two switches
- SAN unit with dual controller (IBM FAStT 700)
We have tested the failover facilities provided by the qla2300-fo driver (p=
ulled fibers) and they work. Each disk shows up once and the driver takes c=
are of the failover facility.

However, we had one very nasty experience last summer. After rebooting (for=
 an unrelated reason) the machines didn't came back up. The vgscan during b=
oot dumped core. The reson was that somebody reconfigured the SAN unit and =
the controllers now had different WWNames. As a result the disks showed up =
twice and our (out of date) LVM could not handle it. Pulling one fiber/path=
 temporarily fixed our problem. Upgrading to the latest LVM code fixed the =
coredump also. But we have not tested if failover would work that way.

Markus
--=20
  Markus Baertschi             Phone: ++41 (21) 807 1677
  Bas du Ross=EF=BF=BD 14b             Fax  : ++41 (21) 807 1678
  CH-1163, Etoy                Email: markus@markus.org
  Switzerland                  Homepage: www.markus.org
