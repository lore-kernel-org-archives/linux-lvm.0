Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9E8SOr06556
	for <linux-lvm@redhat.com>; Thu, 14 Oct 2004 04:28:24 -0400
Received: from home.cru.fr (home.cru.fr [195.220.94.79])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i9E8SD4N028536
	for <linux-lvm@redhat.com>; Thu, 14 Oct 2004 04:28:23 -0400
Received: from [195.220.94.71] (joebar.cru.fr [195.220.94.71])
	by home.cru.fr (8.12.8/8.12.5) with ESMTP id i9E8Rrds003623
	for <linux-lvm@redhat.com>; Thu, 14 Oct 2004 10:27:53 +0200
Message-ID: <416E3889.3090207@cru.fr>
Date: Thu, 14 Oct 2004 10:27:53 +0200
From: Vincent Carpier - Comite Reseaux des Universites <vincent.carpier@cru.fr>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature";
	micalg=sha1; boundary="------------ms030907010106080207010005"
Subject: [linux-lvm] LVM2 - Crash
Reply-To: sysadmin@cru.fr,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a cryptographically signed message in MIME format.

--------------ms030907010106080207010005
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: 7bit

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html;charset=ISO-8859-1" http-equiv="Content-Type">
  <title></title>
</head>
<body bgcolor="#ffffff" text="#000000">
<meta http-equiv="CONTENT-TYPE" content="text/html; charset=utf-8">
<title></title>
<meta name="GENERATOR" content="OpenOffice.org 1.1.0  (Linux)">
<meta name="CREATED" content="20040910;12403800">
<meta name="CHANGED" content="20041013;16103000">
<style>
	<!--
		@page { size: 21cm 29.7cm; margin: 2cm }
	-->
	</style>
<p align="left"><font color="#000000"><font size="4">Hello, <br>
</font></font></p>
<p align="left"><font color="#000000"><font size="4">I have a big
problem with LVM2 (FC2) and the snapshot on a Dell PE1650 or Dell
PE1750 (strangely not on a Dell GX240).<br>
The host is frozen after 3 snapshot.<br>
</font></font></p>
<p align="left"><font color="#000000"><font size="4">A bug ??<br>
</font></font></p>
<p align="left"><font color="#000000"><font size="4"><b>------------<br>
Essai FC2 sur
PE1750 <br>
no raid</b></font></font></p>
<p style="" align="left"><font color="#000000"><font size="4">install
+ upgrade</font></font></p>
<p
 style="border-style: none none solid; border-color: -moz-use-text-color -moz-use-text-color rgb(0, 0, 0); border-width: medium medium 1px; padding: 0cm 0cm 0.07cm;">
/dev/sda1 38G 292M 36G 1% /<br>
/dev/mapper/vg0-home 9.7G 33M 9.1G 1%
/home<br>
/dev/mapper/vg0-usr 5.8G 1.1G 4.5G 19%
/usr<br>
/dev/mapper/vg0-var 2.0G 206M 1.7G 11% /var</p>
<p
 style="border-style: none none solid; border-color: -moz-use-text-color -moz-use-text-color rgb(0, 0, 0); border-width: medium medium 1px; padding: 0cm 0cm 0.07cm;">
2.6.8-1.521smp<br>
lvm2-2.00.15-2</p>
<p
 style="border-style: none none solid; border-color: -moz-use-text-color -moz-use-text-color rgb(0, 0, 0); border-width: medium medium 1px; padding: 0cm 0cm 0.07cm;">
[root@auto1 /]# lvscan <br>
ACTIVE '/dev/vg0/home' [9.77 GB] next free
(default)<br>
ACTIVE '/dev/vg0/usr' [5.86 GB] next free
(default)<br>
ACTIVE '/dev/vg0/var' [1.95 GB] next free (default)</p>
<p
 style="border-style: none none solid; border-color: -moz-use-text-color -moz-use-text-color rgb(0, 0, 0); border-width: medium medium 1px; padding: 0cm 0cm 0.07cm;">
[root@auto1 /]# lvcreate -L500M -s -n snap1 /dev/vg0/var<br>
Logical
volume "snap1" created</p>
<p
 style="border-style: none none solid; border-color: -moz-use-text-color -moz-use-text-color rgb(0, 0, 0); border-width: medium medium 1px; padding: 0cm 0cm 0.07cm;">
commande : lvscan et lvdisplay, mount snap -&gt; ok</p>
<p
 style="border-style: none none solid; border-color: -moz-use-text-color -moz-use-text-color rgb(0, 0, 0); border-width: medium medium 1px; padding: 0cm 0cm 0.07cm;">
Deuxi&eacute;me snapshot</p>
<p
 style="border-style: none none solid; border-color: -moz-use-text-color -moz-use-text-color rgb(0, 0, 0); border-width: medium medium 1px; padding: 0cm 0cm 0.07cm;">
[root@auto1 /]# lvscan <br>
ACTIVE '/dev/vg0/home' [9.77 GB] next free
(default)<br>
ACTIVE '/dev/vg0/usr' [5.86 GB] next free
(default)<br>
ACTIVE Original '/dev/vg0/var' [1.95 GB] next free
(default)<br>
ACTIVE Snapshot '/dev/vg0/snap1' [500.00 MB] next free
(default)<br>
ACTIVE Snapshot '/dev/vg0/snap2' [500.00 MB] next free
(default)</p>
<p
 style="border-style: none none solid; border-color: -moz-use-text-color -moz-use-text-color rgb(0, 0, 0); border-width: medium medium 1px; padding: 0cm 0cm 0.07cm;">
commande : lvscan et lvdisplay, mount snap -&gt; ok</p>
<p
 style="border-style: none none solid; border-color: -moz-use-text-color -moz-use-text-color rgb(0, 0, 0); border-width: medium medium 1px; padding: 0cm 0cm 0.07cm;">
Troisi&eacute;me snapshot</p>
<p
 style="border-style: none none solid; border-color: -moz-use-text-color -moz-use-text-color rgb(0, 0, 0); border-width: medium medium 1px; padding: 0cm 0cm 0.07cm;">
[root@auto1 /]# lvscan <br>
ACTIVE '/dev/vg0/home' [9.77 GB] next free
(default)<br>
ACTIVE '/dev/vg0/usr' [5.86 GB] next free
(default)<br>
ACTIVE Original '/dev/vg0/var' [1.95 GB] next free
(default)<br>
ACTIVE Snapshot '/dev/vg0/snap1' [500.00 MB] next free
(default)<br>
ACTIVE Snapshot '/dev/vg0/snap2' [500.00 MB] next free
(default)<br>
ACTIVE Snapshot '/dev/vg0/snap3' [500.00 MB] next free
(default)</p>
<p
 style="border-style: none none solid; border-color: -moz-use-text-color -moz-use-text-color rgb(0, 0, 0); border-width: medium medium 1px; padding: 0cm 0cm 0.07cm;">&nbsp;
freeze !!</p>
<p
 style="border-style: none none solid; border-color: -moz-use-text-color -moz-use-text-color rgb(0, 0, 0); border-width: medium medium 1px; padding: 0cm 0cm 0.07cm;">no
log, no message on the console, possibilit&eacute; de commande
tel que ls, df, ps<br>
j'essai de stopper le process lvscan -&gt;
impossible (&eacute;tat : D uninterruptible sleep (usually IO))</p>
<p
 style="border-style: none none solid; border-color: -moz-use-text-color -moz-use-text-color rgb(0, 0, 0); border-width: medium medium 1px; padding: 0cm 0cm 0.07cm;">
Try to remove snap : lvremove /dev/vg0/snapx -&gt; freeze<br>
</p>
<p
 style="border-style: none none solid; border-color: -moz-use-text-color -moz-use-text-color rgb(0, 0, 0); border-width: medium medium 1px; padding: 0cm 0cm 0.07cm;">
<b><font size="4"><font color="#800000">Crash<br>
</font></font></b></p>
<pre class="moz-signature" cols="72">-- 
       Vincent Carpier
Comit&eacute; R&eacute;seau des Universit&eacute;s
      <a class="moz-txt-link-freetext" href="http://www.cru.fr">http://www.cru.fr</a>
--
Validation signature -&gt; <a class="moz-txt-link-freetext" href="http://igc.cru.fr/trust.html">http://igc.cru.fr/trust.html</a>
--
Informations sur la signature &eacute;lectronique et les certificats
                   <a class="moz-txt-link-freetext" href="http://www.cru.fr/igc">http://www.cru.fr/igc</a>
</pre>
</body>
</html>

--------------ms030907010106080207010005
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
Z2ktYmluL2xvYWRjcmw/Q0E9YWMtdXRpbGlzYXRldXImZm9ybWF0PURFUjBOBgNVHSAERzBF
MEMGDikDBgEEAAG3XwMBAgAEMDEwLwYIKwYBBQUHAgEWI2h0dHA6Ly9pZ2MuY3J1LmZyL3Jl
ZmVyZW5jZXMvcGMucGRmMA0GCSqGSIb3DQEBBAUAA4IBAQB6QLv2WttBvWTlMAmqxxfvoYSO
SVo2HpzEQDwLkampkxI2eBvT902YCV0sWA9VvxowB1hKtA5GSn7XDqu6QGrN/479niz1PUmi
r9o/d16P1G+kDUPgvo6WbN7UV4w1AtTmuCyblYiuDXSdzNCl/4339pM0xoZTspORlxxX1Ncr
KQoxmvm6vwFkGqcoWQzdcJfAe2aHEhFV7dCExumPUGkGEwsyRqU3zwTPJy51KO1HjimMRI5v
uH3dCwvNAdG741YJ70qZPRzTiYZkJQ9LcZjkLKtOz9RLJycbvo2ZpzjvLnWmuwnUgDch4EN8
6vxgQz0VaXhAGlkOY14uXzWcjZEMMIIEpDCCA4ygAwIBAgICApYwDQYJKoZIhvcNAQEEBQAw
VDELMAkGA1UEBhMCRlIxDDAKBgNVBAoTA0NSVTEXMBUGA1UEAxMOYWMtdXRpbGlzYXRldXIx
HjAcBgkqhkiG9w0BCQEWD2NhLWFkbWluQGNydS5mcjAeFw0wNDA2MTExMzQ0MTNaFw0wNTA2
MTExMzQ0MTNaMHYxCzAJBgNVBAYTAkZSMSYwJAYDVQQKEx1Db21pdGUgUmVzZWF1IGRlcyBV
bml2ZXJzaXRlczEYMBYGA1UEAxMPVmluY2VudCBDYXJwaWVyMSUwIwYJKoZIhvcNAQkBFhZ2
aW5jZW50LmNhcnBpZXJAY3J1LmZyMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDH51zi
s/psOuPkLjEqFWwhr7bqSkpe/pP2ipAeqFwhUJnvdgCJDBhwG5PpG3kqAs2+GGqSlU/MGjf3
sGtMlP1zR2z1hO/0tfWZrr7k01gXWUUV2Gh0n4fsFVwZwjT2oxQR+HV54VOCnC/e8ztU2BmM
J3hagG2tVvGkkOzh7u//IwIDAQABo4IB4DCCAdwwDAYDVR0TAQH/BAIwADARBglghkgBhvhC
AQEEBAMCBLAwDgYDVR0PAQH/BAQDAgXgMHAGCWCGSAGG+EIBDQRjFmFDZXJ0aWZpY2F0IGFj
LXV0aWxpc2F0ZXVyLiBQb3VyIHRvdXRlIGluZm9ybWF0aW9uIHNlIHJlcG9ydGVyIOAgaHR0
cDovL2lnYy5jcnUuZnIvYWMtdXRpbGlzYXRldXIvMB0GA1UdDgQWBBT4hGerWiXfRr8WFiY/
JHxij/vQETB3BgNVHSMEcDBugBQVCnwotaymvNf9MjMdeb2zSQoxkKFTpFEwTzELMAkGA1UE
BhMCRlIxDDAKBgNVBAoTA0NSVTESMBAGA1UEAxMJYWMtcmFjaW5lMR4wHAYJKoZIhvcNAQkB
Fg9jYS1hZG1pbkBjcnUuZnKCAQIwTwYDVR0fBEgwRjBEoEKgQIY+aHR0cDovL2lnYy5jcnUu
ZnIvY2dpLWJpbi9sb2FkY3JsP0NBPWFjLXV0aWxpc2F0ZXVyJmZvcm1hdD1ERVIwTgYDVR0g
BEcwRTBDBg4pAwYBBAABt18DAQIABDAxMC8GCCsGAQUFBwIBFiNodHRwOi8vaWdjLmNydS5m
ci9yZWZlcmVuY2VzL3BjLnBkZjANBgkqhkiG9w0BAQQFAAOCAQEAekC79lrbQb1k5TAJqscX
76GEjklaNh6cxEA8C5GpqZMSNngb0/dNmAldLFgPVb8aMAdYSrQORkp+1w6rukBqzf+O/Z4s
9T1Joq/aP3dej9RvpA1D4L6Olmze1FeMNQLU5rgsm5WIrg10nczQpf+N9/aTNMaGU7KTkZcc
V9TXKykKMZr5ur8BZBqnKFkM3XCXwHtmhxIRVe3QhMbpj1BpBhMLMkalN88EzycudSjtR44p
jESOb7h93QsLzQHRu+NWCe9KmT0c04mGZCUPS3GY5CyrTs/USycnG76Nmac47y51prsJ1IA3
IeBDfOr8YEM9FWl4QBpZDmNeLl81nI2RDDGCAo0wggKJAgEBMFowVDELMAkGA1UEBhMCRlIx
DDAKBgNVBAoTA0NSVTEXMBUGA1UEAxMOYWMtdXRpbGlzYXRldXIxHjAcBgkqhkiG9w0BCQEW
D2NhLWFkbWluQGNydS5mcgICApYwCQYFKw4DAhoFAKCCAYkwGAYJKoZIhvcNAQkDMQsGCSqG
SIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMDQxMDE0MDgyNzUzWjAjBgkqhkiG9w0BCQQxFgQU
bi5ZgR3S8ABk3p+aagEJ60/8YPkwUgYJKoZIhvcNAQkPMUUwQzAKBggqhkiG9w0DBzAOBggq
hkiG9w0DAgICAIAwDQYIKoZIhvcNAwICAUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwaQYJ
KwYBBAGCNxAEMVwwWjBUMQswCQYDVQQGEwJGUjEMMAoGA1UEChMDQ1JVMRcwFQYDVQQDEw5h
Yy11dGlsaXNhdGV1cjEeMBwGCSqGSIb3DQEJARYPY2EtYWRtaW5AY3J1LmZyAgICljBrBgsq
hkiG9w0BCRACCzFcoFowVDELMAkGA1UEBhMCRlIxDDAKBgNVBAoTA0NSVTEXMBUGA1UEAxMO
YWMtdXRpbGlzYXRldXIxHjAcBgkqhkiG9w0BCQEWD2NhLWFkbWluQGNydS5mcgICApYwDQYJ
KoZIhvcNAQEBBQAEgYA/ZEdzRieUM/eKKB+k+4jsvBjREIkLJsjiM9a2svKfEmzRHh3zMVNs
82gcs0cDTYWfFXz5IpHzEI36WzUYC4eri96KrU1l6uIIgotN/+0IVdj53yUmUgHWczfVCO1b
6lmj3T955mqSgva8KsF31xEoE0JzH5s+R36ysjpGuwIH9wAAAAAAAA==
--------------ms030907010106080207010005--
