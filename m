Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200103100004.f2A04kO26602@webber.adilger.int>
Subject: Re: [linux-lvm] Problems with vgscan
In-Reply-To: <20010309233105.B29DEFAD7@hq.nawigator.pl> from Lukasz Trabinski
 at "Mar 10, 2001 00:31:05 am"
Date: Fri, 9 Mar 2001 17:04:46 -0700 (MST)
MIME-Version: 1.0
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

=A3ukasz Tr=B1bi=F1ski writes:
> I have problems with the vgscan ( Linux, kernel 2.4.2 and 2.4.1)
>=20
> [root@xxx tools]# vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found inactive volume group "test"
> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get
> data of volume group "test" from physical volume(s)
> vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating
> "/etc/lvmtab" and "/etc/lvmtab.d"

Please run "vgscan -v -d" and post the output (compressed if very long).

> I have appled patch from posted to this list (diff -u -r1.3.2.3
> tools/lib/pv_read_all_pv_of_vg.c)

Not related to this problem.

Cheers, Andreas
--=20
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
