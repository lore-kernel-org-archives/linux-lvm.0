From: grobe@gmx.net
MIME-Version: 1.0
References: <20030218224059.M14285@zealot.blacknet.de>
Subject: Re: [linux-lvm] striping efficiency
Message-ID: <19301.1045607385@www67.gmx.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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
Date: Tue Feb 18 16:30:02 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

Hi!

OK, me too : RAID5!!!! (I've lost enough disks in my raids to shout here ;-)

But I have my own question here... I am going to stripe across two PVs which
are two RAID5s. I want to do that as we are getting a fibrechannel storage,
and we want to be able to use two channels. So, I will get /dev/sdc linked =
to
a raid5 at channel A, /dev/sdd at channel B, and with striping, will use
bandwith of both channels in one Volume Group.

What stripsize would you recommend here...?

Thank you + CU, Lars.

--=20
+++ GMX - Mail, Messaging & more  http://www.gmx.net +++
Bitte l=EF=BF=BDcheln! Fotogalerie online mit GMX ohne eigene Homepage!
