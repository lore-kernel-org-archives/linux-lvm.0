Message-ID: <3894AD20.F826BEFF@alwan.com>
Date: Sun, 30 Jan 2000 15:29:04 -0600
From: Chris Anderson <chris@alwan.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Trouble 2.2.14 setup - unresolved symbol lvm_map_ptr (My 
 first time)
References: <200001301944.UAA20420@e35.marxmeier.com>
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg=sha1; boundary="------------msAB9091B029B348BC99144B6B"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: Michael Marxmeier <mike@msede.com>, "linux-lvm@msede.com" <linux-lvm@msede.com>

This is a cryptographically signed message in MIME format.

--------------msAB9091B029B348BC99144B6B
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Michael Marxmeier wrote:

> > IMO there's no obvious reason, why it should core there with size == 8.
> >
> > Do you have an old libc in place by accident which might give us a
> > reason to assume an broken malloc()?
> > If so: try with an actual one.
> >
> > Any ideas from other list members?
>
> Conventional wisdom tells that when malloc crashes the free list
> (aka arena) has been trashed. This can happen eg. by a double free
> (some malloc versions check against this) or by writing beyond the
> end of a buffer.
>
> You might want to try the following:
> env MALLOC_CHECK_=1 vgcreate ...
>

This is printed out when I set the check.  Also it does not crash if I set
it to 1.

malloc: using debugging hooks
realloc(): invalid pointer 0x804b730!

Whats next?  Should I look for a double free?

>
> This will use a debugging version of malloc which might print
> sone diagnostics to stderr if a problem is encountered.
>
> see malloc(3) for additional information.
>
> Hope this helps
> Michael
>
> --
> Michael Marxmeier           Marxmeier Software AG
> E-Mail: mike@msede.com      Besenbruchstrasse 9
> Phone : +49 202 2431440     42285 Wuppertal, Germany
> Fax   : +49 202 2431420     http://www.msede.com/

--------------msAB9091B029B348BC99144B6B
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIJ8gYJKoZIhvcNAQcCoIIJ4zCCCd8CAQExCzAJBgUrDgMCGgUAMAsGCSqGSIb3DQEHAaCC
B+owggS0MIIEHaADAgECAhBtaAr33EWpnFUtfXtMoojcMA0GCSqGSIb3DQEBBAUAMIHMMRcw
FQYDVQQKEw5WZXJpU2lnbiwgSW5jLjEfMB0GA1UECxMWVmVyaVNpZ24gVHJ1c3QgTmV0d29y
azFGMEQGA1UECxM9d3d3LnZlcmlzaWduLmNvbS9yZXBvc2l0b3J5L1JQQSBJbmNvcnAuIEJ5
IFJlZi4sTElBQi5MVEQoYyk5ODFIMEYGA1UEAxM/VmVyaVNpZ24gQ2xhc3MgMSBDQSBJbmRp
dmlkdWFsIFN1YnNjcmliZXItUGVyc29uYSBOb3QgVmFsaWRhdGVkMB4XDTk5MDIwNjAwMDAw
MFoXDTAwMDIwNjIzNTk1OVowggEQMRcwFQYDVQQKEw5WZXJpU2lnbiwgSW5jLjEfMB0GA1UE
CxMWVmVyaVNpZ24gVHJ1c3QgTmV0d29yazFGMEQGA1UECxM9d3d3LnZlcmlzaWduLmNvbS9y
ZXBvc2l0b3J5L1JQQSBJbmNvcnAuIGJ5IFJlZi4sTElBQi5MVEQoYyk5ODEeMBwGA1UECxMV
UGVyc29uYSBOb3QgVmFsaWRhdGVkMTMwMQYDVQQLEypEaWdpdGFsIElEIENsYXNzIDEgLSBO
ZXRzY2FwZSBGdWxsIFNlcnZpY2UxFzAVBgNVBAMUDkNocmlzIEFuZGVyc29uMR4wHAYJKoZI
hvcNAQkBFg9jaHJpc0BhbHdhbi5jb20wXDANBgkqhkiG9w0BAQEFAANLADBIAkEAwcx0X9Qo
J8OVKX1LTdNsaIlHnUBk/hc+OZ3NINyQpJu3Wqc8rs0y5rci49hx4ri6e1mX7aR+oa0KpSuw
WpXjIwIDAQABo4IBkjCCAY4wCQYDVR0TBAIwADCBrwYDVR0gBIGnMIAwgAYLYIZIAYb4RQEH
AQEwgDAoBggrBgEFBQcCARYcaHR0cHM6Ly93d3cudmVyaXNpZ24uY29tL0NQUzBiBggrBgEF
BQcCAjBWMBUWDlZlcmlTaWduLCBJbmMuMAMCAQEaPVZlcmlTaWduJ3MgQ1BTIGluY29ycC4g
YnkgcmVmZXJlbmNlIGxpYWIuIGx0ZC4gKGMpOTcgVmVyaVNpZ24AAAAAAAAwEQYJYIZIAYb4
QgEBBAQDAgeAMIGGBgpghkgBhvhFAQYDBHgWdmQ0NjUyYmQ2M2YyMDQ3MDI5Mjk4NzYzYzlk
MmYyNzUwNjljNzM1OWJlZDFiMDU5ZGE3NWJjNGJjOTcwMTc0N2RhNWQzZjIxNDFiZWFkYjJi
ZDJlODkyMTBhZDZiZjdkNzExNDg5Y2ExYjI0NGZhZjNlYTQ1MGMwMwYDVR0fBCwwKjAooCag
JIYiaHR0cDovL2NybC52ZXJpc2lnbi5jb20vY2xhc3MxLmNybDANBgkqhkiG9w0BAQQFAAOB
gQBCRY8YtczgpvVSl1NQYedWLlDvsdhHah3qYQQ02DjB6KJF13/CcjrLZcUaXYyYkvH7BB8L
kU7ueovQVcS5J0zsrLCDwe/LQAVXYFh71ZQ3LZ1kv3bkMMxs5YLaoy1GG7g9X6w41CQgR2M7
gkzTTQAEc68lq9Ks3BOc7usMdMc4uTCCAy4wggKXoAMCAQICEQDSdi6NFAw9fbKoJV2v7g11
MA0GCSqGSIb3DQEBAgUAMF8xCzAJBgNVBAYTAlVTMRcwFQYDVQQKEw5WZXJpU2lnbiwgSW5j
LjE3MDUGA1UECxMuQ2xhc3MgMSBQdWJsaWMgUHJpbWFyeSBDZXJ0aWZpY2F0aW9uIEF1dGhv
cml0eTAeFw05ODA1MTIwMDAwMDBaFw0wODA1MTIyMzU5NTlaMIHMMRcwFQYDVQQKEw5WZXJp
U2lnbiwgSW5jLjEfMB0GA1UECxMWVmVyaVNpZ24gVHJ1c3QgTmV0d29yazFGMEQGA1UECxM9
d3d3LnZlcmlzaWduLmNvbS9yZXBvc2l0b3J5L1JQQSBJbmNvcnAuIEJ5IFJlZi4sTElBQi5M
VEQoYyk5ODFIMEYGA1UEAxM/VmVyaVNpZ24gQ2xhc3MgMSBDQSBJbmRpdmlkdWFsIFN1YnNj
cmliZXItUGVyc29uYSBOb3QgVmFsaWRhdGVkMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKB
gQC7WkSKBBa7Vf0DeootlE8VeDa4DUqyb5xUv7zodyqdufBou5XZMUFweoFLuUgTVi3HCOGE
QqvAopKrRFyqQvCCDgLpL/vCO7u+yScKXbawNkIztW5UiE+HSr8Z2vkV6A+HthzjzMaajn9q
JJLj/OBluqexfu/J2zdqyErICQbkmQIDAQABo3wwejARBglghkgBhvhCAQEEBAMCAQYwRwYD
VR0gBEAwPjA8BgtghkgBhvhFAQcBATAtMCsGCCsGAQUFBwIBFh93d3cudmVyaXNpZ24uY29t
L3JlcG9zaXRvcnkvUlBBMA8GA1UdEwQIMAYBAf8CAQAwCwYDVR0PBAQDAgEGMA0GCSqGSIb3
DQEBAgUAA4GBAIi4Nzvd2pQ3AK2qn+GBAXEekmptL/bxndPKZDjcG5gMB4ZbhRVqD7lJhaSV
8Rd9Z7R/LSzdmkKewz60jqrlCwbe8lYq+jPHvhnXU0zDvcjjF7WkSUJj7MKmFw9dWBpJPJBc
VaNlIAD9GCDlX4KmsaiSxVhqwY0DPOvDzQWikK5uMYIB0DCCAcwCAQEwgeEwgcwxFzAVBgNV
BAoTDlZlcmlTaWduLCBJbmMuMR8wHQYDVQQLExZWZXJpU2lnbiBUcnVzdCBOZXR3b3JrMUYw
RAYDVQQLEz13d3cudmVyaXNpZ24uY29tL3JlcG9zaXRvcnkvUlBBIEluY29ycC4gQnkgUmVm
LixMSUFCLkxURChjKTk4MUgwRgYDVQQDEz9WZXJpU2lnbiBDbGFzcyAxIENBIEluZGl2aWR1
YWwgU3Vic2NyaWJlci1QZXJzb25hIE5vdCBWYWxpZGF0ZWQCEG1oCvfcRamcVS19e0yiiNww
CQYFKw4DAhoFAKCBhjAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEP
Fw0wMDAxMzAyMTI5MDZaMCMGCSqGSIb3DQEJBDEWBBTMAh9+ZRYm++8VbelY5kpWRCeY2zAn
BgkqhkiG9w0BCQ8xGjAYMAcGBSsOAwIHMA0GCCqGSIb3DQMCAgEoMA0GCSqGSIb3DQEBAQUA
BEBJfT6Y049J8WrUS9WLwESGCeTfIdlfzFa2cfQBBFZoGpEFnvvB614m3guYbhVZdM9wi1kN
MRBZIXMuiXROwQk/
--------------msAB9091B029B348BC99144B6B--
