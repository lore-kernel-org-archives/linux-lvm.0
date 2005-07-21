Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6LEaYV05372
	for <linux-lvm@redhat.com>; Thu, 21 Jul 2005 10:36:34 -0400
Received: from strugglers.net (strugglers.net [212.13.198.70])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j6LEaX4f021411
	for <linux-lvm@redhat.com>; Thu, 21 Jul 2005 10:36:33 -0400
Received: from andy by strugglers.net with local (Exim 4.50)
	id 1Dvc9u-0008Fg-BL
	for linux-lvm@redhat.com; Thu, 21 Jul 2005 14:36:22 +0000
Date: Thu, 21 Jul 2005 14:36:22 +0000
From: Andy Smith <andy@strugglers.net>
Message-ID: <20050721143622.GC8874@strugglers.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="JuvCcU5w0Coraqvt"
Content-Disposition: inline
Subject: [linux-lvm] Unusable LV, how to unlock it?
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
To: linux-lvm <linux-lvm@redhat.com>


--JuvCcU5w0Coraqvt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi there,

Just now one of my LVs became unusable, as in every operation done
on its mounted filesystem just blocks forever.

I believe it is still mounted however that is inside a Xen domain
that no longer exists so I don't know how to confirm that.

Based on previous advice I tried to run "dmsetup info -c" and "lvs
-v" to compare results, but "lvs -v" also gets stuck here:

[andy@curacao andy]$ sudo lvs -v
    Finding all logical volumes

I believe the "stuck" LV is /dev/mapper/mainvg-adminroot.

Anyone have any suggestions how I can get use of this LV again
without rebooting?  Here is the output from "dmsetup info -c":

[andy@curacao andy]$ sudo dmsetup info -c
Name             Maj Min Stat Open Targ Event  UUID
mainvg-snapoutpostlonthlroot 254  18 L--w    0    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW43KIFDMhuc66kGoKopCggfSa4ijWQCF1B
mainvg-snapcholetroot 254  28 L--w    0    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW48TFpObhJOO6dcjNdwBMNL1IxV5AvbUaK
mainvg-snaphomelv-cow 254   3 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4ft5n3X4Wesr501vvlHBdydbx31jkfKMV-cow
mainvg-saffronswap 254  50 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4zSKpfytAZ9EUG4rqIvZABneBhuWRkxht
mainvg-saffronroot 254  49 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW40HQxP1U2QHGJ7cYPF7rtRD0sLiLYFucm
mainvg-ruminantswap 254  45 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4YLA67yfx2jRo4tylP31c127lFMxVKXqB
mainvg-ruminantroot 254  44 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4NolJn0Zj9cLM4kMcNIW1nGAE6LWbphJz
mainvg-usrlv     254   0 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4mT2ApHrAfpAnDCWjRGAzyrY145rJMmcD
mainvg-snapoutpostlonthlroot-cow 254  17 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW43KIFDMhuc66kGoKopCggfSa4ijWQCF1B-cow
mainvg-snapcholetroot-cow 254  26 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW48TFpObhJOO6dcjNdwBMNL1IxV5AvbUaK-cow
mainvg-ruminantdata 254  46 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4hbYSoa2T5XuNRw73bU5BOXmTBDv6ibVX
mainvg-strugglersroot-real 254  12 L--w    2    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW43jwledji1nh8rtcbheq8MUU1vi937zDK-real
mainvg-blueswap  254  48 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4RjnFTRybYJqK8drln4HzMYWnbfk33aSu
mainvg-seinfeldswap 254  25 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4XScAry8eVwasTOLeIh6HfGSHim3fIuv9
mainvg-snapseinfeldroot-cow 254  22 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4yh6e80ZEQafHKSe4jo6ydJWe1T0A1lkj-cow
mainvg-blueroot  254  47 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4Xx1o20L4fpev6EU5wMB6mHhayQsnRLQg
mainvg-adminswap 254  43 L--w    0    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW48Q2Z20jIewK2Vdt47Kn4IO6KBI28PIAm
mainvg-seinfeldroot 254  24 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW43BT9T40cl5HYYg3j1QIwfp5hc0LIqUsI
mainvg-adminroot 254  38 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4CjHGy8QpGKoH35P5U58Di1NKeYspeIR2
mainvg-admindata 254  42 L--w    0    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4cCHdlPbllQNt50aJANhLrqbjUkK7jCsP
mainvg-tmplv     254   2 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4tfVsPETP9bimi535hqeX6Ch1yhYGePxS
mainvg-admindata-real 254  39 L--w    2    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4cCHdlPbllQNt50aJANhLrqbjUkK7jCsP-real
mainvg-snapstrugglersroot 254  13 L--w    0    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW41yOu8xefQnL6FK69xAojAvXYqLcAlI0g
mainvg-snaphomelv 254   5 L--w    0    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4ft5n3X4Wesr501vvlHBdydbx31jkfKMV
mainvg-outpostlonthlroot-real 254  16 L--w    2    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4oTAjSEuyiaawrNF6iUbSrZqzWCHqOW1P-real
mainvg-snapstrugglersdata 254  33 L--w    0    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4gKZfk2xyEo6749X1uLWyPhxF3tP8sfvM
mainvg-choletroot-real 254  27 L--w    2    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4ZlGfn0e2THSlmotbck1bJBEPr12ngi7r-real
mainvg-seinfeldroot-real 254  21 L--w    2    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW43BT9T40cl5HYYg3j1QIwfp5hc0LIqUsI-real
mainvg-strugglersswap 254  15 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW43CcBI91LrT914eNMDyzhdYjym0rVQTsF
mainvg-outpostlonthlswap 254  20 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4BR8eDYVYzQJXlGPplq1YKB27p7h3HtZV
mainvg-strugglersroot 254  14 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW43jwledji1nh8rtcbheq8MUU1vi937zDK
mainvg-outpostlonthlroot 254  19 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4oTAjSEuyiaawrNF6iUbSrZqzWCHqOW1P
mainvg-homelv    254   6 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4cd3BqQaBDxmVgo7X37SYp33yQBeOA0n0
mainvg-strugglersdata 254  34 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4gp5msGLmNEROJHmToKkpBxe8SC8I7xQ6
mainvg-varlv     254   1 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4z0sYK4fz3qSmLuXYIvjR3y0Nt22DgsCB
mainvg-snapdatalv 254   9 L--w    0    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4HAJcH84mtd6DzqhjIxPsZGM0fhFKIp9B
mainvg-adminroot-real 254  36 L--w    2    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4CjHGy8QpGKoH35P5U58Di1NKeYspeIR2-real
mainvg-choletswap 254  30 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW47YXxUIkZdkdioRs7QxsBBJXFa0jslAWS
mainvg-choletroot 254  29 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4ZlGfn0e2THSlmotbck1bJBEPr12ngi7r
mainvg-homelv-real 254   4 L--w    2    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4cd3BqQaBDxmVgo7X37SYp33yQBeOA0n0-real
mainvg-snapstrugglersroot-cow 254  11 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW41yOu8xefQnL6FK69xAojAvXYqLcAlI0g-cow
mainvg-datalv    254  10 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4OesUvyDaFU9O4jKDhPlChy4LpwYAMoe4
mainvg-snapadminroot 254  37 L--w    0    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW46RYghmBICie3mZ3GbWDWt4L2rziM1iuc
mainvg-snapstrugglersdata-cow 254  32 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4gKZfk2xyEo6749X1uLWyPhxF3tP8sfvM-cow
mainvg-snapseinfeldroot 254  23 L--w    0    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4yh6e80ZEQafHKSe4jo6ydJWe1T0A1lkj
mainvg-snapadmindata 254  41 L--w    0    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4MifVzYFYKQGTZDyn3ZxjL7CLyh70DrxK
mainvg-strugglersdata-real 254  31 L--w    2    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4gp5msGLmNEROJHmToKkpBxe8SC8I7xQ6-real
mainvg-snapadminroot-cow 254  35 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW46RYghmBICie3mZ3GbWDWt4L2rziM1iuc-cow
mainvg-datalv-real 254   7 L--w    2    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4OesUvyDaFU9O4jKDhPlChy4LpwYAMoe4-real
mainvg-snapdatalv-cow 254   8 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4HAJcH84mtd6DzqhjIxPsZGM0fhFKIp9B-cow
mainvg-snapadmindata-cow 254  40 L--w    1    1      0 PqzqVKCpoXCXe6QAIW4C32bS66OoLnW4MifVzYFYKQGTZDyn3ZxjL7CLyh70DrxK-cow

It seems odd to me that any of the LVs above with "snap" in their
name show an open count since I don't have any of them mounted
currently.

Kernel 2.6.11 with Xen patches (2.0.6).

Thanks,
Andy

--JuvCcU5w0Coraqvt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQFC37LmIJm2TL8VSQsRAgGvAJ9oBTeaiJxLaOmQac8ET+x25WvQvACghV6b
5d57J32PL7n1hPCVTDh4UWE=
=vs2T
-----END PGP SIGNATURE-----

--JuvCcU5w0Coraqvt--
