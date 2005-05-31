Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4VDSKO27702
	for <linux-lvm@redhat.com>; Tue, 31 May 2005 09:28:20 -0400
Received: from strugglers.net (strugglers.net [212.13.198.70])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j4VDSE5Q001345
	for <linux-lvm@redhat.com>; Tue, 31 May 2005 09:28:14 -0400
Received: from andy by strugglers.net with local (Exim 4.50)
	id 1Dd6my-0000NT-RW
	for linux-lvm@redhat.com; Tue, 31 May 2005 13:28:13 +0000
Date: Tue, 31 May 2005 13:28:12 +0000
From: Andy Smith <andy@strugglers.net>
Message-ID: <20050531132812.GT686@strugglers.net>
References: <20050531110414.GP686@strugglers.net>
	<20050531130024.GV15809@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rBVNTu5JXDAWzN2S"
Content-Disposition: inline
In-Reply-To: <20050531130024.GV15809@agk.surrey.redhat.com>
Subject: Re: [linux-lvm] deadlock on snapshot creation;
	any way out without a reboot?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--rBVNTu5JXDAWzN2S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 31, 2005 at 02:00:24PM +0100, Alasdair G Kergon wrote:
> On Tue, May 31, 2005 at 11:04:14AM +0000, Andy Smith wrote:
> > One of my LVs has just become unusable and I am hoping there is a
> > way to fix it without rebooting.
> =20
> What's the output of?
>   dmsetup info -c

Name             Maj Min Stat Open Targ Event  UUID
mainvg-snaphomelv-cow 254   7 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32b=
S66OoLnW4M2C3GjD3d1nEJsps51Hyj8NxCf9AvJJz-cow
mainvg-snapoutpostlonthlroot 254  23 L--w    1    1      0 PqzqVKCpoXCXe6QA=
IW4C32bS66OoLnW4r4xczWa1vAcc211xdMJZY5eUnkJZ93jZ
mainvg-snapcholetroot 254  33 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32b=
S66OoLnW42JSUt6ZnhEjGVug7OhM9oZ2cXyr6SZIo
mainvg-usrlv     254   0 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66Oo=
LnW4mT2ApHrAfpAnDCWjRGAzyrY145rJMmcD
mainvg-snapoutpostlonthlroot-cow 254  22 L--w    1    1      0 PqzqVKCpoXCX=
e6QAIW4C32bS66OoLnW4r4xczWa1vAcc211xdMJZY5eUnkJZ93jZ-cow
mainvg-snapcholetroot-cow 254  31 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4=
C32bS66OoLnW42JSUt6ZnhEjGVug7OhM9oZ2cXyr6SZIo-cow
mainvg-strugglersroot-real 254  12 L--w    2    1      0 PqzqVKCpoXCXe6QAIW=
4C32bS66OoLnW43jwledji1nh8rtcbheq8MUU1vi937zDK-real
mainvg-seinfeldswap 254  25 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS6=
6OoLnW4XScAry8eVwasTOLeIh6HfGSHim3fIuv9
mainvg-snapseinfeldroot-cow 254  27 L--w    1    1      0 PqzqVKCpoXCXe6QAI=
W4C32bS66OoLnW4d7y0mVHS1S7Rfo6J5Oe8cKiesY1aJEQh-cow
mainvg-adminswap 254  43 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66Oo=
LnW48Q2Z20jIewK2Vdt47Kn4IO6KBI28PIAm
mainvg-seinfeldroot 254  24 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS6=
6OoLnW43BT9T40cl5HYYg3j1QIwfp5hc0LIqUsI
mainvg-adminroot 254  38 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66Oo=
LnW4CjHGy8QpGKoH35P5U58Di1NKeYspeIR2
mainvg-admindata 254  42 LIsw    2    1      0 PqzqVKCpoXCXe6QAIW4C32bS66Oo=
LnW4cCHdlPbllQNt50aJANhLrqbjUkK7jCsP
mainvg-tmplv     254   2 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66Oo=
LnW4tfVsPETP9bimi535hqeX6Ch1yhYGePxS
mainvg-snapstrugglersroot 254  13 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4=
C32bS66OoLnW45v4N56kLTeiq2idjUAqiDqTMz031DRI8
mainvg-snaphomelv 254   9 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66O=
oLnW4M2C3GjD3d1nEJsps51Hyj8NxCf9AvJJz
mainvg-snapstrugglersdata 254  18 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4=
C32bS66OoLnW4AxMTVPM37t6T8c8qpINqaP3BhQXo7o7m
mainvg-outpostlonthlroot-real 254  21 L--w    2    1      0 PqzqVKCpoXCXe6Q=
AIW4C32bS66OoLnW4oTAjSEuyiaawrNF6iUbSrZqzWCHqOW1P-real
mainvg-choletroot-real 254  32 L--w    2    1      0 PqzqVKCpoXCXe6QAIW4C32=
bS66OoLnW4ZlGfn0e2THSlmotbck1bJBEPr12ngi7r-real
mainvg-seinfeldroot-real 254  26 L--w    2    1      0 PqzqVKCpoXCXe6QAIW4C=
32bS66OoLnW43BT9T40cl5HYYg3j1QIwfp5hc0LIqUsI-real
mainvg-strugglersswap 254  15 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32b=
S66OoLnW43CcBI91LrT914eNMDyzhdYjym0rVQTsF
mainvg-outpostlonthlswap 254  20 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C=
32bS66OoLnW4BR8eDYVYzQJXlGPplq1YKB27p7h3HtZV
mainvg-strugglersroot 254  14 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32b=
S66OoLnW43jwledji1nh8rtcbheq8MUU1vi937zDK
mainvg-outpostlonthlroot 254  19 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C=
32bS66OoLnW4oTAjSEuyiaawrNF6iUbSrZqzWCHqOW1P
mainvg-homelv    254   6 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66Oo=
LnW4cd3BqQaBDxmVgo7X37SYp33yQBeOA0n0
mainvg-strugglersdata 254  34 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32b=
S66OoLnW4gp5msGLmNEROJHmToKkpBxe8SC8I7xQ6
mainvg-varlv     254   1 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66Oo=
LnW4z0sYK4fz3qSmLuXYIvjR3y0Nt22DgsCB
mainvg-snapdatalv 254   5 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66O=
oLnW4FhuyRyCGWlfQNTjU9ffJmHJO4RUISXYG
mainvg-choletswap 254  30 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66O=
oLnW47YXxUIkZdkdioRs7QxsBBJXFa0jslAWS
mainvg-choletroot 254  29 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66O=
oLnW4ZlGfn0e2THSlmotbck1bJBEPr12ngi7r
mainvg-homelv-real 254   8 L--w    2    1      0 PqzqVKCpoXCXe6QAIW4C32bS66=
OoLnW4cd3BqQaBDxmVgo7X37SYp33yQBeOA0n0-real
mainvg-snapstrugglersroot-cow 254  11 L--w    1    1      0 PqzqVKCpoXCXe6Q=
AIW4C32bS66OoLnW45v4N56kLTeiq2idjUAqiDqTMz031DRI8-cow
mainvg-datalv    254  10 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66Oo=
LnW4OesUvyDaFU9O4jKDhPlChy4LpwYAMoe4
mainvg-snapstrugglersdata-cow 254  16 L--w    1    1      0 PqzqVKCpoXCXe6Q=
AIW4C32bS66OoLnW4AxMTVPM37t6T8c8qpINqaP3BhQXo7o7m-cow
mainvg-snapseinfeldroot 254  28 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C3=
2bS66OoLnW4d7y0mVHS1S7Rfo6J5Oe8cKiesY1aJEQh
mainvg-strugglersdata-real 254  17 L--w    2    1      0 PqzqVKCpoXCXe6QAIW=
4C32bS66OoLnW4gp5msGLmNEROJHmToKkpBxe8SC8I7xQ6-real
mainvg-datalv-real 254   3 L--w    2    1      0 PqzqVKCpoXCXe6QAIW4C32bS66=
OoLnW4OesUvyDaFU9O4jKDhPlChy4LpwYAMoe4-real
mainvg-snapdatalv-cow 254   4 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32b=
S66OoLnW4FhuyRyCGWlfQNTjU9ffJmHJO4RUISXYG-cow

(mainvg-admindata being the one that's giving me problems)

>   lvs -v

  LV                    VG     #Seg Attr   LSize   Maj Min KMaj KMin Origin=
            Snap%  Move Copy%  LV UUID

  admindata             mainvg    1 -wi-so   5.86G  -1  -1 254  42         =
                               cCHdlP-bllQ-Nt50-aJAN-hLrq-bjUk-K7jCsP
  adminroot             mainvg    1 -wi-ao 500.00M  -1  -1 254  38         =
                               CjHGy8-QpGK-oH35-P5U5-8Di1-NKeY-speIR2
  adminswap             mainvg    1 -wi-ao 256.00M  -1  -1 254  43         =
                               8Q2Z20-jIew-K2Vd-t47K-n4IO-6KBI-28PIAm
  choletroot            mainvg    1 owi-ao   1.00G  -1  -1 254  29         =
                               ZlGfn0-e2TH-Slmo-tbck-1bJB-EPr1-2ngi7r
  choletswap            mainvg    1 -wi-ao 256.00M  -1  -1 254  30         =
                               7YXxUI-kZdk-dioR-s7Qx-sBBJ-XFa0-jslAWS
  datalv                mainvg    1 owi-ao   1.00G  -1  -1 254  10         =
                               OesUvy-DaFU-9O4j-KDhP-lChy-4Lpw-YAMoe4
  homelv                mainvg    1 owi-ao   1.00G  -1  -1 254  6          =
                               cd3BqQ-aBDx-mVgo-7X37-SYp3-3yQB-eOA0n0
  outpostlonthlroot     mainvg    1 owi-ao   3.00G  -1  -1 254  19         =
                               oTAjSE-uyia-awrN-F6iU-bSrZ-qzWC-HqOW1P
  outpostlonthlswap     mainvg    1 -wi-ao 256.00M  -1  -1 254  20         =
                               BR8eDY-VYzQ-JXlG-Pplq-1YKB-27p7-h3HtZV
  seinfeldroot          mainvg    1 owi-ao   3.00G  -1  -1 254  24         =
                               3BT9T4-0cl5-HYYg-3j1Q-Iwfp-5hc0-LIqUsI
  seinfeldswap          mainvg    1 -wi-ao 256.00M  -1  -1 254  25         =
                               XScAry-8eVw-asTO-LeIh-6HfG-SHim-3fIuv9
  snapcholetroot        mainvg    1 swi-ao   1.00G  -1  -1 254  33   cholet=
root          0.64             2JSUt6-ZnhE-jGVu-g7Oh-M9oZ-2cXy-r6SZIo
  snapdatalv            mainvg    1 swi-ao 512.00M  -1  -1 254  5    datalv=
              8.21             FhuyRy-CGWl-fQNT-jU9f-fJmH-JO4R-UISXYG
  snaphomelv            mainvg    1 swi-ao 512.00M  -1  -1 254  9    homelv=
              0.04             M2C3Gj-D3d1-nEJs-ps51-Hyj8-NxCf-9AvJJz
  snapoutpostlonthlroot mainvg    1 swi-ao   1.00G  -1  -1 254  23   outpos=
tlonthlroot   1.32             r4xczW-a1vA-cc21-1xdM-JZY5-eUnk-JZ93jZ
  snapseinfeldroot      mainvg    1 swi-ao   1.00G  -1  -1 254  28   seinfe=
ldroot        3.20             d7y0mV-HS1S-7Rfo-6J5O-e8cK-iesY-1aJEQh
  snapstrugglersdata    mainvg    1 swi-ao   1.00G  -1  -1 254  18   strugg=
lersdata      3.48             AxMTVP-M37t-6T8c-8qpI-NqaP-3BhQ-Xo7o7m
  snapstrugglersroot    mainvg    1 swi-ao   1.00G  -1  -1 254  13   strugg=
lersroot      3.97             5v4N56-kLTe-iq2i-djUA-qiDq-TMz0-31DRI8
  strugglersdata        mainvg    1 owi-ao  10.00G  -1  -1 254  34         =
                               gp5msG-LmNE-ROJH-mToK-kpBx-e8SC-8I7xQ6
  strugglersroot        mainvg    1 owi-ao   1.00G  -1  -1 254  14         =
                               3jwled-ji1n-h8rt-cbhe-q8MU-U1vi-937zDK
  strugglersswap        mainvg    1 -wi-ao 256.00M  -1  -1 254  15         =
                               3CcBI9-1LrT-914e-NMDy-zhdY-jym0-rVQTsF
  tmplv                 mainvg    1 -wi-ao   1.00G  -1  -1 254  2          =
                               tfVsPE-TP9b-imi5-35hq-eX6C-h1yh-YGePxS
  usrlv                 mainvg    1 -wi-ao   8.00G  -1  -1 254  0          =
                               mT2ApH-rAfp-AnDC-WjRG-Azyr-Y145-rJMmcD
  varlv                 mainvg    1 -wi-ao   8.00G  -1  -1 254  1          =
                               z0sYK4-fz3q-SmLu-XYIv-jR3y-0Nt2-2DgsCB

--rBVNTu5JXDAWzN2S
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQFCnGZsIJm2TL8VSQsRAlJfAJ43c1Eb0CWcjAu/rIYMCTp7Hd9q6QCeLYYa
4P0jzOF0ExObnNVPPKvd1/M=
=0wu9
-----END PGP SIGNATURE-----

--rBVNTu5JXDAWzN2S--
