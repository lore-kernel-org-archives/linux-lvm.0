Message-ID: <395917AA.C98CA287@ednet.ns.ca>
Date: Tue, 27 Jun 2000 18:07:54 -0300
From: Patrick Boutilier <boutilpj@ednet.ns.ca>
MIME-Version: 1.0
Subject: Re: [linux-lvm] ReiserFS/XFS/JFS, LVM, Raid5
References: <B45465FD9C23D21193E90000F8D0F3DF6834DF@mailsrv.linkvest.ch>
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg=sha1; boundary="------------ms7223FF6F476FA1BCDA74A22F"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: Jean-Eric Cuendet <Jean-Eric.Cuendet@linkvest.com>
Cc: "'linux-lvm@msede.com'" <linux-lvm@msede.com>

This is a cryptographically signed message in MIME format.

--------------ms7223FF6F476FA1BCDA74A22F
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

We use LVM + Reiserfs on 2 production boxes. One is a 5x36 gig Raid 5
(Dell (AMI) PERC Controller) while the other is just two 18 gig drives
LVMed together. So far there have been no problems.

Jean-Eric Cuendet wrote:

> Hi,
> I'd like to build such a system:
> - Kernel + root on non-LVM Raid0/ext2 partition (no problemo)
> A big partition (100Gb) which lokks like:
> - Raid5 (linux md)
> - LVM
> - filesystem
>
> It's a classic schema, but my question is:
> Does anyone already tried it?
> Any success? failure? Drawback?
> Does XFS + LVM or JFS + LVM or ReiserFS + LVM be stable enough for
> production?
> Do they all have resize tools?
>
> Thanks
> -jec
>
> _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _
> Jean-Eric Cuendet
> Linkvest SA
> Av des Baumettes 19, 1020 Renens Switzerland
> Tel +41 21 632 9043  Fax +41 21 632 9090
> http://www.linkvest.com  E-mail: jean-eric.cuendet@linkvest.com
> _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _

--------------ms7223FF6F476FA1BCDA74A22F
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIHkQYJKoZIhvcNAQcCoIIHgjCCB34CAQExCzAJBgUrDgMCGgUAMAsGCSqGSIb3DQEHAaCC
BVowggVWMIIEPqADAgECAgEBMA0GCSqGSIb3DQEBBAUAMIGeMSEwHwYJKoZIhvcNAQkBFhJj
YWNlcnRAZWRuZXQubnMuY2ExHjAcBgNVBAMTFUNlcnRpZmljYXRlIEF1dGhvcml0eTEMMAoG
A1UECxMDSVRTMSwwKgYDVQQKEyNOb3ZhIFNjb3RpYSBEZXBhcnRtZW50IG9mIEVkdWNhdGlv
bjELMAkGA1UEBhMCQ0ExEDAOBgNVBAcTB0hhbGlmYXgwHhcNMDAwNTE1MTczNDM3WhcNMDEw
NTE1MTczNDM3WjCBnzEjMCEGCSqGSIb3DQEJARYUYm91dGlscGpAZWRuZXQubnMuY2ExHTAb
BgNVBAMTFFBhdHJpY2sgSi4gQm91dGlsaWVyMQwwCgYDVQQLEwNJVFMxLDAqBgNVBAoTI05v
dmEgU2NvdGlhIERlcGFydG1lbnQgb2YgRWR1Y2F0aW9uMQswCQYDVQQGEwJDQTEQMA4GA1UE
BxMHSGFsaWZheDCBnzANBgkqhkiG9w0BAQEFAAOBjQAwgYkCgYEAwjmASQC93TvjP+BvORjW
Ugs96DQR2wBW3xpX1KTfdRoQDNvXNru1/7yjZWRvwCPSQ7T3Pp83NADH1UDutS3YTliXvnrv
rxII0cFcGtccE1cGqCcfKLtc79xHzDZsN6PMki0EO6kZ8PviK1CBumy3IOgwLzb7vaNSJQhs
yB8V37MCAwEAAaOCAh4wggIaMAkGA1UdEwQCMAAwEQYJYIZIAYb4QgEBBAQDAgWgMAsGA1Ud
DwQEAwIF4DBDBglghkgBhvhCAQ0ENhY0Tm92YSBTY290aWEgRGVwYXJ0bWVudCBvZiBFZHVj
YXRpb24gVXNlciBDZXJ0aWZpY2F0ZTAdBgNVHQ4EFgQU9H+SDsZXq4mR/ZjROA4lfgJpqygw
gcsGA1UdIwSBwzCBwIAUUmsUMhmk9qX5ag2ErozFlTINqNyhgaSkgaEwgZ4xITAfBgkqhkiG
9w0BCQEWEmNhY2VydEBlZG5ldC5ucy5jYTEeMBwGA1UEAxMVQ2VydGlmaWNhdGUgQXV0aG9y
aXR5MQwwCgYDVQQLEwNJVFMxLDAqBgNVBAoTI05vdmEgU2NvdGlhIERlcGFydG1lbnQgb2Yg
RWR1Y2F0aW9uMQswCQYDVQQGEwJDQTEQMA4GA1UEBxMHSGFsaWZheIIBADAJBgNVHREEAjAA
MAkGA1UdEgQCMAAwOAYJYIZIAYb4QgEEBCsWKWh0dHBzOi8vc2VjdXJlLmVkbmV0Lm5zLmNh
L2NnaS1iaW4vZ2V0Y3JsMDgGCWCGSAGG+EIBAwQrFilodHRwczovL3NlY3VyZS5lZG5ldC5u
cy5jYS9jZ2ktYmluL2dldGNybDAxBglghkgBhvhCAQcEJBYiaHR0cHM6Ly9zZWN1cmUuZWRu
ZXQubnMuY2EvcmVuZXdhbDANBgkqhkiG9w0BAQQFAAOCAQEAWI9FQ3XPE9I/3e+AN9hKlUJb
FbsgT8cYLPNUomfd2j3TiNUsMjeT85aLqJ1AqP7sLTJJoadMDE/JZtCrVaDAxJ9V063y9KDe
4HFQ9ZR9W0wrAurpXwZgplKwOxQzXe7eW/a6pyIpdQ/NcyD3f9nYMzucvq/q8dQnEcKEC1yQ
XtI0wozpGzWC9P8d2ggi2c67dIGVClXv9EWTDdAg5Fmjmvk0oN+srKSTml7RvE78GAHAjSgy
Vi8ZRwmD+Rjh9KRFFd9IGkpRT8ipF1iO6HTqRt9PT8qi6QPiCJnxW7iS8GNl/HZAEKerJGw4
1UgR1m94lQyQ8pxBMa0AajT3UceSDzGCAf8wggH7AgEBMIGkMIGeMSEwHwYJKoZIhvcNAQkB
FhJjYWNlcnRAZWRuZXQubnMuY2ExHjAcBgNVBAMTFUNlcnRpZmljYXRlIEF1dGhvcml0eTEM
MAoGA1UECxMDSVRTMSwwKgYDVQQKEyNOb3ZhIFNjb3RpYSBEZXBhcnRtZW50IG9mIEVkdWNh
dGlvbjELMAkGA1UEBhMCQ0ExEDAOBgNVBAcTB0hhbGlmYXgCAQEwCQYFKw4DAhoFAKCBsTAY
BgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0wMDA2MjcyMTA3NTRa
MCMGCSqGSIb3DQEJBDEWBBSPXLHZNMDEeiPTB1EQXN0CBdLwATBSBgkqhkiG9w0BCQ8xRTBD
MAoGCCqGSIb3DQMHMA4GCCqGSIb3DQMCAgIAgDAHBgUrDgMCBzANBggqhkiG9w0DAgIBQDAN
BggqhkiG9w0DAgIBKDANBgkqhkiG9w0BAQEFAASBgDe899BsxgnO63ssibhoki1tQ2RsvsBX
Eospzy+bRkIWXz9vg4y2IKuISjHtg9XyAFNSRLAZ1vNa/Nwnb7zrru3w4eTJMJXGwO3VhrBX
TbG+WLLKIOgfsm4sz/PdbsTvKjuNq6Jl1DcvlC2dGi5yfSMMk4Sulm9gmVToD2WgFj4x
--------------ms7223FF6F476FA1BCDA74A22F--
