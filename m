Date: Wed, 2 Aug 2000 13:55:02 -0700
From: Charles Duffy <cduffy@mvista.com>
Subject: [linux-lvm] 0.8final crash in lvmdiskscan
Message-ID: <20000802135502.B4447@mvista.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="24zk1gE8NUlDmwG9"
Content-Disposition: inline
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com


--24zk1gE8NUlDmwG9
Content-Type: multipart/mixed; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

As per the subject, I've been experiencing a segfault in lvmdiskscan.
The following gdb log will hopefully be useful in debugging.

--h31gzZEtNLTqOjlF
Content-Type: application/octet-stream
Content-Disposition: attachment; filename="lvmdiskscan_gdb_session.bz2"
Content-Transfer-Encoding: base64

QlpoOTFBWSZTWYcQsUMABeNfgHDyXGf//7/n37q/7//6YAZ/eabiGhPsyKroGgANFR6QDQ0D
QNAAADTQ0AAAAAZQhpT9GlPwqYxRoAAAABoAAA0BxkaZMTQZMmE0yBkNAaA0yaGAE0BhISQk
mm9TRDagaepoxGgBoAaDEAA0eoMqnqMgAAA0AAAAAAADR6gBJEBE9IAJpoaE0Mmk9JgaQDR6
TEBpk0awXh9iNoWXc3txPtrv377t/JvN90daEgP6i4mZEIW+t/HrPax229Pp24raNnlUR6Mc
XX68Hi1+XCmgxQSPI9UqLNa7DKS5IG3hcgpBgyK4LihsqiqwydZ/F6gvtVCaIkopYMFDICSo
OYbhIgoccdLZgwZwQlFTNsOZzuadyXFF+/sHJcNvIRBBDgjNRUkCneFRtBaOwirMY3ZCpUGR
b6ao+95lMog8uwrpTSkheYZXRkdO3FGYTI9D3482ZWEhWjsy/JXfBZBBtxVfARMy4Esv3Yrg
MKXwBRbD7pa1P5iTUBIqVfJoeqbQA4qYXcZ+kx89dC7DHBhTnVjAAADO+lkbwiBCW5TlokmH
OGmSyoENCKhj2rsi4ggKc0LcktZAyuEmRts78Kbtfz4j6mBkIKZGx97lAy5YkDIfSAlpOxJw
TIGDr0mL1HbzHUg5MPjV6s8W/tutl5DMDj4ziEkJkAl28nogbNB2c6nt3yDDAu8zLwyDgy4F
DQ58wqY/2j5ImCRIPOhQsc+gHCmC5poD690CGeEjhJvsXVTLxxTvDTG0X7CpI7LWmYcNkjPc
YbiPQMDXkVmgOzajuSpaJiq5IQFLFTKIC4K+CggXUIFh0OIFmBU6MJ4EgFUF18JVcJ6zgCGW
EAKBHDOuDnibRri7CkiGjAkbhYqHzjw1w0owWmLVMgeXpQg0q5thVzxfxncv+FkhC5MiWwyE
zym3vGphgCM3EcchIIhIIhNKzbTtaSVVNpAxsbZUhIVvfNJC1UIWQ2k/6xIX011ASC2wlXz2
XJBBSlQKj4HC5xoEkggukBmGCEu2L633IQtDkRIWQSFoEhenF6TCdwYrIQvlnJYXPGZkhGlI
QIjjSGB7iVkIWAaCQ9xyh5/CxwehaxiZeQ7YI3BIX7AggN0Qxbot4sJNtgio2gYxDELFK5Ji
BlgGkMoTDxgMZ5gvIe8h4kkLcCL63MWtNu6pFQQKIoLuIjkj3O5ED4hUYFGPaOiUsmO1IAqc
pw9qP3+y3G3r1kNLB2ERe3gBKjCF7/YLr3XTwagGCSExArhAuGyKE9QDulxnKCDY2M1T1EoN
YI3AoZkh7AjKEcVgAyoWcdJjjMXDO68EomJDGNBSHkTz0Z85oMRKwSCIDBqk+LmfmjntSVCo
s9HCMrzVEUQiRcSJDCAUD9CBReoAUWVvAfmTthHYiAuVxsIqe5IE2Q55JC8VUhLL3kT5A3kY
iO8jltE59AOipSZMVpHIghyhUU7cbf7iT37Us2h0CNBfBBoshOCUjvuhIG3NCYggUIVrmb3f
mrcrB2b6Qv2HE3QfBpqCLX4+/9u6ylIAcmkhUxXDNAAmN1cUhBKDcQagSLwVCGVB6doDshMy
EyTAGa0AHHGJT3HEcs7rFVPjamVpAAo9aZ8VF3gAUBhQRe0lWzdT0otJy8bavlQgr7dRILAz
w5gIhSrFzlxBkQQ0RQ4JXSCcBTTzHbSvRXNNXdWqy2mENkzABzY4OwYRgercQ1tI1cWE/Xcl
jNWwvGEMVMo6M4ZCRBAVAkO0mDAmCXxZAo41jNhBqki0d2TL4CiEFS1Ay86ykQH9TaKCMbBV
hK4znDBswHOUIsUaW5mvDpLyosgTh47zpIbRMsSR9GQ/Q5kg7Lo4wdghLlHz4DoGqOgdWNMi
ciRnaaeD6JoQVGSbFXmu45NcAKZqaN5EScFDW2TaYyyDcWKbY83rI/9jwgYO4n5teq2pCRHI
gHQuY0XUEgTF28ZcnC/EMCRt/USxdscAzX23aNEZTDbJ69g+0NelBI/8XckU4UJCHELFDA==

--h31gzZEtNLTqOjlF--

--24zk1gE8NUlDmwG9
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.1 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE5iIqmr/O29KUQmJURAmOLAJ4sJhEPX9YXPbTbmnKsTy04TwUQ/QCdEb1+
FjLJZR3BGHGDA5RBENdhcAQ=
=LvUI
-----END PGP SIGNATURE-----

--24zk1gE8NUlDmwG9--
