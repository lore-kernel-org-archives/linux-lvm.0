Message-ID: <3E6C61AE.2060307@netland.nl>
From: Ron Arts <raarts@netland.nl>
MIME-Version: 1.0
References: <BDEMIPDEGABMNEFIHCPDMEOFEJAA.bill+f.9sfuw6uo@tao-group.com>
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg=sha1; boundary="------------ms010508000707090503040108"
Subject: [linux-lvm] not enough free/allocatable physical extents to extend logical volume
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
Date: Mon Mar 10 08:17:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a cryptographically signed message in MIME format.

--------------ms010508000707090503040108
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

Am I making some stupid mistake here?
I want to extend the space on /dev/vg1/mysql on physical volume /dev/sdb4

The command I tried is:

[root@cms-db root]# lvextend -L +50G /dev/vg1/mysql /dev/sdb4
lvextend -- extending logical volume "/dev/vg1/mysql" to 100 GB
lvextend -- not enough free/allocatable physical extents to extend logical volume "/dev/vg1/mysql"

But pvdisplay says there should be enough PE there:

[root@cms-db root]# pvdisplay /dev/sdb4
--- Physical volume ---
PV Name               /dev/sdb4
VG Name               vg1
PV Size               108.92 GB [228428235 secs] / NOT usable 4.25 MB [LVM: 236 KB]
PV#                   1
PV Status             available
Allocatable           yes
Cur LV                2
PE Size (KByte)       4096
Total PE              27883
Free PE               18358
Allocated PE          9525
PV UUID               C7C5NM-PpaJ-hSbj-jPqn-f1TF-mvuQ-M7a70T

lvdisplay says the following:

[root@cms-db root]# lvdisplay /dev/vg1/mysql
--- Logical volume ---
LV Name                /dev/vg1/mysql
VG Name                vg1
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                50 GB
Current LE             12800
Allocated LE           12800
Stripes                2
Stripe size (KByte)    16
Allocation             next free
Read ahead sectors     10000
Block device           58:0


According to the FAQ I should not specify the physical volume, and when
I tried that it worked, but now O don't know where my space is allocated.

Ron Arts

-- 
Netland Internet Services
bedrijfsmatige internetoplossingen

http://www.netland.nl   Kruislaan 419              1098 VA Amsterdam
info: 020-5628282       servicedesk: 020-5628280   fax: 020-5628281

Let's split up, we can do more damage that way.

--------------ms010508000707090503040108
Content-Type: application/x-pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIJdjCC
AxkwggKCoAMCAQICAwdzkDANBgkqhkiG9w0BAQQFADCBkjELMAkGA1UEBhMCWkExFTATBgNV
BAgTDFdlc3Rlcm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMQ8wDQYDVQQKEwZUaGF3dGUx
HTAbBgNVBAsTFENlcnRpZmljYXRlIFNlcnZpY2VzMSgwJgYDVQQDEx9QZXJzb25hbCBGcmVl
bWFpbCBSU0EgMjAwMC44LjMwMB4XDTAyMDUxMzEyNDI0OFoXDTAzMDUxMzEyNDI0OFowXDEN
MAsGA1UEBBMEQXJ0czERMA8GA1UEKhMIUm9uIFIuQS4xFjAUBgNVBAMTDVJvbiBSLkEuIEFy
dHMxIDAeBgkqhkiG9w0BCQEWEXJhYXJ0c0BuZXRsYW5kLm5sMIIBIjANBgkqhkiG9w0BAQEF
AAOCAQ8AMIIBCgKCAQEAsz1vQDs+fOlea3WOBrQay1HHCqENWzUhuaMzDYKduzVxGzwNmc7j
HnR0QflErghjp61ihnDQI1EF3NbIlSAne3fiCQ/9i2Ztbtxa1dlhzu3iZzMvCX4MDaIFwgk1
rkdVG2sVZwgjV9nvroVZoV3Mqgh2ev7Cd6USxG9yJ3HFaK/BntOhCnRv52jTPOFqlZfD37FH
XNmllxdmdfD7VKE7ssTr+wq336cm2uqqY0BEiovD1W6gyG2UXDBRo7ExhCroJzzirmsffW09
p5XTdzC5CO3tdYqz5rtUua5ED0AwJGK7WO4YO2jHRSg7jykc+XvSXvL9SdlhKMqeWt1b/im+
XQIDAQABoy4wLDAcBgNVHREEFTATgRFyYWFydHNAbmV0bGFuZC5ubDAMBgNVHRMBAf8EAjAA
MA0GCSqGSIb3DQEBBAUAA4GBABNzXukOa8Lhmw1d12+RvwFORDhX2FEy+iaXkG6RDTcctEuc
QBAebt1ialWEa3MAI5R7xKhkF78W/RilmHbSMr5MX3RfSnmi49n0+rzqtXDygci1PJfZFLSi
cNx8GreiFF9H1id3F0LmJpkc2WEEJxJ5ofKVpXjjrt1MkMm2X8KtMIIDGTCCAoKgAwIBAgID
B3OQMA0GCSqGSIb3DQEBBAUAMIGSMQswCQYDVQQGEwJaQTEVMBMGA1UECBMMV2VzdGVybiBD
YXBlMRIwEAYDVQQHEwlDYXBlIFRvd24xDzANBgNVBAoTBlRoYXd0ZTEdMBsGA1UECxMUQ2Vy
dGlmaWNhdGUgU2VydmljZXMxKDAmBgNVBAMTH1BlcnNvbmFsIEZyZWVtYWlsIFJTQSAyMDAw
LjguMzAwHhcNMDIwNTEzMTI0MjQ4WhcNMDMwNTEzMTI0MjQ4WjBcMQ0wCwYDVQQEEwRBcnRz
MREwDwYDVQQqEwhSb24gUi5BLjEWMBQGA1UEAxMNUm9uIFIuQS4gQXJ0czEgMB4GCSqGSIb3
DQEJARYRcmFhcnRzQG5ldGxhbmQubmwwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIB
AQCzPW9AOz586V5rdY4GtBrLUccKoQ1bNSG5ozMNgp27NXEbPA2ZzuMedHRB+USuCGOnrWKG
cNAjUQXc1siVICd7d+IJD/2LZm1u3FrV2WHO7eJnMy8JfgwNogXCCTWuR1UbaxVnCCNX2e+u
hVmhXcyqCHZ6/sJ3pRLEb3InccVor8Ge06EKdG/naNM84WqVl8PfsUdc2aWXF2Z18PtUoTuy
xOv7Crffpyba6qpjQESKi8PVbqDIbZRcMFGjsTGEKugnPOKuax99bT2nldN3MLkI7e11irPm
u1S5rkQPQDAkYrtY7hg7aMdFKDuPKRz5e9Je8v1J2WEoyp5a3Vv+Kb5dAgMBAAGjLjAsMBwG
A1UdEQQVMBOBEXJhYXJ0c0BuZXRsYW5kLm5sMAwGA1UdEwEB/wQCMAAwDQYJKoZIhvcNAQEE
BQADgYEAE3Ne6Q5rwuGbDV3Xb5G/AU5EOFfYUTL6JpeQbpENNxy0S5xAEB5u3WJqVYRrcwAj
lHvEqGQXvxb9GKWYdtIyvkxfdF9KeaLj2fT6vOq1cPKByLU8l9kUtKJw3Hwat6IUX0fWJ3cX
QuYmmRzZYQQnEnmh8pWleOOu3UyQybZfwq0wggM4MIICoaADAgECAhBmRXK3zHT1z2N2RYTQ
LpEBMA0GCSqGSIb3DQEBBAUAMIHRMQswCQYDVQQGEwJaQTEVMBMGA1UECBMMV2VzdGVybiBD
YXBlMRIwEAYDVQQHEwlDYXBlIFRvd24xGjAYBgNVBAoTEVRoYXd0ZSBDb25zdWx0aW5nMSgw
JgYDVQQLEx9DZXJ0aWZpY2F0aW9uIFNlcnZpY2VzIERpdmlzaW9uMSQwIgYDVQQDExtUaGF3
dGUgUGVyc29uYWwgRnJlZW1haWwgQ0ExKzApBgkqhkiG9w0BCQEWHHBlcnNvbmFsLWZyZWVt
YWlsQHRoYXd0ZS5jb20wHhcNMDAwODMwMDAwMDAwWhcNMDQwODI3MjM1OTU5WjCBkjELMAkG
A1UEBhMCWkExFTATBgNVBAgTDFdlc3Rlcm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMQ8w
DQYDVQQKEwZUaGF3dGUxHTAbBgNVBAsTFENlcnRpZmljYXRlIFNlcnZpY2VzMSgwJgYDVQQD
Ex9QZXJzb25hbCBGcmVlbWFpbCBSU0EgMjAwMC44LjMwMIGfMA0GCSqGSIb3DQEBAQUAA4GN
ADCBiQKBgQDeMzKmY8cJJUU+0m54J2eBxdqIGYKXDuNEKYpjNSptcDz63K737nRvMLwzkH/5
NHGgo22Y8cNPomXbDfpL8dbdYaX5hc1VmjUanZJ1qCeu2HL5ugL217CR3hzpq+AYA6h8Q0JQ
UYeDPPA5tJtUihOH/7ObnUlmAC0JieyUa+mhaQIDAQABo04wTDApBgNVHREEIjAgpB4wHDEa
MBgGA1UEAxMRUHJpdmF0ZUxhYmVsMS0yOTcwEgYDVR0TAQH/BAgwBgEB/wIBADALBgNVHQ8E
BAMCAQYwDQYJKoZIhvcNAQEEBQADgYEAMbFLR135AXHl9VNsXXnWPZjAJhNigSKnEvgilegb
SbcnewQ5uvzm8iTrkfq97A0qOPdQVahs9w2tTBu8A/S166JHn2yiDFiNMUIJEWywGmnRKxKy
QF1q+XnQ6i4l3Yrk/NsNH50C81rbyjz2ROomaYd/SJ7OpZ/nhNjJYmKtBcYxggMnMIIDIwIB
ATCBmjCBkjELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdlc3Rlcm4gQ2FwZTESMBAGA1UEBxMJ
Q2FwZSBUb3duMQ8wDQYDVQQKEwZUaGF3dGUxHTAbBgNVBAsTFENlcnRpZmljYXRlIFNlcnZp
Y2VzMSgwJgYDVQQDEx9QZXJzb25hbCBGcmVlbWFpbCBSU0EgMjAwMC44LjMwAgMHc5AwCQYF
Kw4DAhoFAKCCAWEwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcN
MDMwMzEwMDk1ODA2WjAjBgkqhkiG9w0BCQQxFgQUdbkDgHo3WmwnrjRyxaksp4yR/5AwUgYJ
KoZIhvcNAQkPMUUwQzAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwIC
AUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwga0GCyqGSIb3DQEJEAILMYGdoIGaMIGSMQsw
CQYDVQQGEwJaQTEVMBMGA1UECBMMV2VzdGVybiBDYXBlMRIwEAYDVQQHEwlDYXBlIFRvd24x
DzANBgNVBAoTBlRoYXd0ZTEdMBsGA1UECxMUQ2VydGlmaWNhdGUgU2VydmljZXMxKDAmBgNV
BAMTH1BlcnNvbmFsIEZyZWVtYWlsIFJTQSAyMDAwLjguMzACAwdzkDANBgkqhkiG9w0BAQEF
AASCAQCZbHTL3w7qkxX4J9EjN4r+q60d9AqVf8tYTQF5sMHTY1q0h3t/W4IUk0rgMUTpxzx+
xQOu2/e5SFOPB7vJqJEdxM5e9DhpmECAJXtuWrvcFMUEibpox1hPPpDVk1BFI4pEBP27BQtW
qj32gncFhSuXgbVworJIzwd9RXmQFEbGh6I/JQOU4QKA9xg3Kn4AulgSjvbMsOoI2axzLyPd
AFZ+zjRXe8oyIsqNPk1QDCwop21iDjX8EsMytc4djEDl1llLGmZCeg4QL1I9vYa/VHrfWfY4
baGzgNL6NxyWJZQOvKwMT+PlGcXpqJq22UHOcWPF1WouAqkXgv+l2gSq0ol7AAAAAAAA
--------------ms010508000707090503040108--
