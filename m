Message-ID: <3DAD8837.8070803@netland.nl>
From: Ron Arts <raarts@netland.nl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] performance comparison soft-hardware RAID + LVM:
 bad
References: <3DAC940D.7010903@netland.nl> <3DAD24A0.814E4028@silicide.dk>
Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg=sha1; boundary="------------ms080909040704000403000307"
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
Date: Wed Oct 16 11:04:10 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a cryptographically signed message in MIME format.

--------------ms080909040704000403000307
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit

Jon Bendtsen wrote:
> Ron Arts wrote:
> 

[snip]

(I received your report, thanks)


>  
> 
>>Results are below. Anyone care to comment? Especially LVM performance
>>disappointed here.
> 
> 
> I cant clearly see what is LVM setup and what isnt. Remember that LVM 
> doesnt allocate blocks sequeltial, but by default the first one free.
> So, when you create 3 lv's, and then you mkfs them, then you allocate
> at least the first block. Then when you fill the rest of the
> filesystem...
> you allocate the next blocks. Results are one block in the beginning,
> a wide gap, and then the rest of the blocks.
> 

Sorry, I don't understand. Why the gap?
Omn the other hand, the underlying devices are RAID-1 in software, the
allocation shouldn't matter should it?

> 
> 
>>LVM machine setup:
>>
>>2 18Gb disks. I created 3 partitions on both disks, 128Mb, 512Mb and 17Gb
>>Equal partitions were combined into RAID-1 devices (md driver).
>>First md device mounted on /boot, second for swapfile, and third
>>as basis for LVM
>>
>>Out of the volume group four LV were created and mounted as follows:
>>
>>[root@nbs-126 root]# df
>>Filesystem           1K-blocks      Used Available Use% Mounted on
>>/dev/vg0/root          4225092   1293064   2717400  33% /
>>/dev/md0                124323     11517    106387  10% /boot
>>/dev/vg0/home          4225092     32828   3977636   1% /home
>>none                    514996         0    514996   0% /dev/shm
>>/dev/vg0/var           4225092     51720   3958744   2% /var
>>/dev/vg0/mysql        16513960     32828  15642272   1% /var/lib/mysql
>>
>>Is there a reason for the performance degradation I saw with LVM?
> 
> 
> I've done 3 (or 0.5 + 0.5 + 1) benchmarks. The first 2 times i didnt do
> it well enough. I dont believe you have done it well enough, you clearly
> dont have enough numbers. I found that using tiobench i had to variate
> the number of threads (concurrent read/write) and the blocksize, before
> i
> got the best performance. And it variates alot. (See my .pdf, which i
> will
> mail to you). I've got lots of numbers. I used gnuplot to create graphs,

Okay, but lots of numbers still don't explain why in this particular case
performance was so slow. If I understand why, I can begin to make
optimizations.

To give some background:
I do this because I need such a setup for a particular application
(MySQL high volume logging server). If I understand the issues involved
I can make more informed choices implementing the application.
Should it log using multiple threads or one? Will readers from the
datbase hinder the writing process a lot? What is the best way
to add disks using LVM, without taking a large performance hit?

This server must be up 24x7. I found something called scsirastools
that can deal with hotswapping SCSI disks under software RAID.

I thought I'd first try some benchmarks with bonnie to get a feel
for the issues involved, and seeing the performance (and CPU) hit
for my LVM setup (and having never used LVM before) I decided
to ask you guys about this.


And thanks for your report, at least it confirmed what I
had seen: software raid is faster then hardware.

Regards,
Ron Arts


-- 
Netland Internet Services
bedrijfsmatige internetoplossingen

http://www.netland.nl   Kruislaan 419              1098 VA Amsterdam
info: 020-5628282       servicedesk: 020-5628280   fax: 020-5628281

Does old mail ever arrive?

--------------ms080909040704000403000307
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
MDIxMDE2MTUzOTM1WjAjBgkqhkiG9w0BCQQxFgQUfHgNjD95jwLO0F+G61ba3/5WQe4wUgYJ
KoZIhvcNAQkPMUUwQzAKBggqhkiG9w0DBzAOBggqhkiG9w0DAgICAIAwDQYIKoZIhvcNAwIC
AUAwBwYFKw4DAgcwDQYIKoZIhvcNAwICASgwga0GCyqGSIb3DQEJEAILMYGdoIGaMIGSMQsw
CQYDVQQGEwJaQTEVMBMGA1UECBMMV2VzdGVybiBDYXBlMRIwEAYDVQQHEwlDYXBlIFRvd24x
DzANBgNVBAoTBlRoYXd0ZTEdMBsGA1UECxMUQ2VydGlmaWNhdGUgU2VydmljZXMxKDAmBgNV
BAMTH1BlcnNvbmFsIEZyZWVtYWlsIFJTQSAyMDAwLjguMzACAwdzkDANBgkqhkiG9w0BAQEF
AASCAQAPodgjE78zT4zfPPfl5+NBUYPBhLpDgj8YE6ERBzHjE5Bizhszdezy0tTYFJn4wCqc
jM2il7L+ygUgnLQB+QxzZNESAs9lUSQmwq/JRI4ykL18VN2An9n32WyxzVOTW3tBOHwaJq0m
ZOdQGJWsskMJPc7OQ6E2iER45COpHUSZqYLhIeQxBqkC+QylPE5OuwoZhrhW8RftHH9S8d5y
xNoUPs+EDIrwijBXKf31K8Iij+iM7cduBxvJ/RvtIz+SQXrH1UZY5h9AYu2Jp6FtMIsWlrNt
+YtTnR2ltUyFP59le9jVp0cjQyIcdNCt7IreGeNb5OattF+UghnBOhJWIzF3AAAAAAAA
--------------ms080909040704000403000307--
