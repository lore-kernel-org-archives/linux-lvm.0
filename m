Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k94IwH26029211
	for <linux-lvm@redhat.com>; Wed, 4 Oct 2006 14:58:17 -0400
Received: from rwcrmhc15.comcast.net (rwcrmhc15.comcast.net [204.127.192.85])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k94IwAjr031708
	for <linux-lvm@redhat.com>; Wed, 4 Oct 2006 14:58:10 -0400
Mime-Version: 1.0 (Apple Message framework v752.2)
Message-Id: <84AAA69E-16C1-4265-BEAE-6899574EC6B1@comcast.net>
Content-Type: multipart/signed; micalg=sha1; boundary=Apple-Mail-30--855027941;
	protocol="application/pkcs7-signature"
From: Eric Adair <cberic3@comcast.net>
Date: Wed, 4 Oct 2006 14:58:01 -0400
Subject: [linux-lvm] Re: Grow Live GFS volume in clustered environment?
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


--Apple-Mail-30--855027941
Content-Type: multipart/alternative;
	boundary=Apple-Mail-29--855028159


--Apple-Mail-29--855028159
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	delsp=yes;
	format=flowed

The specific error I'm getting in my system log is:

Oct  4 14:55:24 ftpimg2 lvm[2512]: Volume group for uuid not found:  
qDuA09bdhxxI
RqcN3VRZhCKM1c1aMFx6lZBFD0Rx3RtBTpG0ZdJQXDRj5lBmLUtt


-Eric

----------------


Is it possible to grow live GFS volumes in a clustered environment?  
Or even grow them at all if they are clustered? I am assuming this is  
possible, but I am running into serious roadblocks.

I am trying to grow a live GFS volume in a 2 node cluster. We have 3  
LVM volume groups (1 physical volume each) all mounted to 3 different  
mount points. Everything works great as far as both nodes reading,  
writing, etc to each. Both nodes mount and use each volume  
simultaneously without a hitch.

Now that the volumes are mounted and all in use, I get "error locking  
on node" errors when trying to create new volume groups with new  
physical volumes, or even just adding physical volumes to existing  
logical volume groups. This happens even if I unmount the volume on  
both nodes. I can't even deactivate and reactivate the existing  
volume groups, no matter what I do, without getting the same error.


Am I missing something basic?

Stats:

	FC5 kernel-smp 2.6.17-1.2174
	cluster-1.02.00
	device-mapper.1.02.00
	LVM2.2.02.07
	open-iscsi-1.1-648

	dlm locking, all necessary lvm.conf changes set for cluster locking,  
lvm's set for 2 node 		
	clustering, etc.


-Eric
________________________________

***This message has been dgitally signed by Thawte Certificate  
Authority*



--Apple-Mail-29--855028159
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=ISO-8859-1

<HTML><BODY style=3D"word-wrap: break-word; -khtml-nbsp-mode: space; =
-khtml-line-break: after-white-space; "><DIV>The specific error I'm =
getting in my system log is:</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>Oct=A0 4 14:55:24 ftpimg2 =
lvm[2512]: Volume group for uuid not found: =
qDuA09bdhxxI</DIV><DIV>RqcN3VRZhCKM1c1aMFx6lZBFD0Rx3RtBTpG0ZdJQXDRj5lBmLUt=
t</DIV><DIV><BR class=3D"khtml-block-placeholder"></DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>-Eric</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>----------------</DIV><DIV><B=
R class=3D"khtml-block-placeholder"></DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>Is it possible to grow live =
GFS volumes in a clustered environment? Or even grow them at all if they =
are clustered? I am assuming this is possible, but I am running into =
serious roadblocks.</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>I am trying to grow a live =
GFS volume in a 2 node cluster. We have 3 LVM volume groups (1 physical =
volume each) all mounted to 3 different mount points. Everything works =
great as far as both nodes reading, writing, etc to each. Both nodes =
mount and use each volume simultaneously without a hitch.</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>Now that the volumes are =
mounted and all in use, I get "error locking on node" errors when trying =
to create new volume groups with new physical volumes, or even just =
adding physical volumes to existing logical volume groups. This happens =
even if I unmount the volume on both nodes. I can't even deactivate and =
reactivate the existing volume groups, no matter what I do, without =
getting the same error.=A0</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV>Am I missing something =
basic?</DIV><DIV><BR =
class=3D"khtml-block-placeholder"></DIV>Stats:<DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN>FC5 =
kernel-smp 2.6.17-1.2174</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>cluster-1.02.00</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</SPAN>device-mapper.1.02.00</DIV><DIV><SPAN class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</SPAN>LVM2.2.02.07</DIV><DIV><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</SPAN>open-iscsi-1.1-648<BR><DIV><BR =
class=3D"khtml-block-placeholder"></DIV><DIV><SPAN =
class=3D"Apple-style-span" style=3D"border-collapse: separate; =
border-spacing: 0px 0px; color: rgb(0, 0, 0); font-family: Arial; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; text-align: auto; =
-khtml-text-decorations-in-effect: none; text-indent: 0px; =
-apple-text-size-adjust: auto; text-transform: none; orphans: 2; =
white-space: normal; widows: 2; word-spacing: 0px; "><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</SPAN>dlm =
locking, all necessary lvm.conf changes set for cluster locking, lvm's =
set for 2 node <SPAN class=3D"Apple-tab-span" style=3D"white-space:pre">	=
	</SPAN></SPAN></DIV><DIV><SPAN class=3D"Apple-style-span" =
style=3D"border-collapse: separate; border-spacing: 0px 0px; color: =
rgb(0, 0, 0); font-family: Arial; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; text-align: auto; =
-khtml-text-decorations-in-effect: none; text-indent: 0px; =
-apple-text-size-adjust: auto; text-transform: none; orphans: 2; =
white-space: normal; widows: 2; word-spacing: 0px; "><SPAN =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</SPAN>clustering, etc.</SPAN></DIV><DIV><SPAN class=3D"Apple-style-span" =
style=3D"border-collapse: separate; border-spacing: 0px 0px; color: =
rgb(0, 0, 0); font-family: Arial; font-size: 12px; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; text-align: auto; =
-khtml-text-decorations-in-effect: none; text-indent: 0px; =
-apple-text-size-adjust: auto; text-transform: none; orphans: 2; =
white-space: normal; widows: 2; word-spacing: 0px; "><SPAN =
class=3D"Apple-style-span" style=3D"border-collapse: separate; =
border-spacing: 0px 0px; color: rgb(0, 0, 0); font-family: Arial; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; text-align: auto; =
-khtml-text-decorations-in-effect: none; text-indent: 0px; =
-apple-text-size-adjust: auto; text-transform: none; orphans: 2; =
white-space: normal; widows: 2; word-spacing: 0px; "><SPAN =
class=3D"Apple-style-span" style=3D"border-collapse: separate; =
border-spacing: 0px 0px; color: rgb(0, 0, 0); font-family: Arial; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; text-align: auto; =
-khtml-text-decorations-in-effect: none; text-indent: 0px; =
-apple-text-size-adjust: auto; text-transform: none; orphans: 2; =
white-space: normal; widows: 2; word-spacing: 0px; "><SPAN =
class=3D"Apple-style-span" style=3D"border-collapse: separate; =
border-spacing: 0px 0px; color: rgb(0, 0, 0); font-family: Arial; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; text-align: auto; =
-khtml-text-decorations-in-effect: none; text-indent: 0px; =
-apple-text-size-adjust: auto; text-transform: none; orphans: 2; =
white-space: normal; widows: 2; word-spacing: 0px; "><SPAN =
class=3D"Apple-style-span" style=3D"border-collapse: separate; =
border-spacing: 0px 0px; color: rgb(0, 0, 0); font-family: Arial; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; text-align: auto; =
-khtml-text-decorations-in-effect: none; text-indent: 0px; =
-apple-text-size-adjust: auto; text-transform: none; orphans: 2; =
white-space: normal; widows: 2; word-spacing: 0px; "><SPAN =
class=3D"Apple-style-span" style=3D"border-collapse: separate; =
border-spacing: 0px 0px; color: rgb(0, 0, 0); font-family: Arial; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; text-align: auto; =
-khtml-text-decorations-in-effect: none; text-indent: 0px; =
-apple-text-size-adjust: auto; text-transform: none; orphans: 2; =
white-space: normal; widows: 2; word-spacing: 0px; "><SPAN =
class=3D"Apple-style-span" style=3D"border-collapse: separate; =
border-spacing: 0px 0px; color: rgb(0, 0, 0); font-family: Arial; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; text-align: auto; =
-khtml-text-decorations-in-effect: none; text-indent: 0px; =
-apple-text-size-adjust: auto; text-transform: none; orphans: 2; =
white-space: normal; widows: 2; word-spacing: 0px; "><SPAN =
class=3D"Apple-style-span" style=3D"border-collapse: separate; =
border-spacing: 0px 0px; color: rgb(0, 0, 0); font-family: Arial; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; text-align: auto; =
-khtml-text-decorations-in-effect: none; text-indent: 0px; =
-apple-text-size-adjust: auto; text-transform: none; orphans: 2; =
white-space: normal; widows: 2; word-spacing: 0px; "><SPAN =
class=3D"Apple-style-span" style=3D"border-collapse: separate; =
border-spacing: 0px 0px; color: rgb(0, 0, 0); font-family: Arial; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; text-align: auto; =
-khtml-text-decorations-in-effect: none; text-indent: 0px; =
-apple-text-size-adjust: auto; text-transform: none; orphans: 2; =
white-space: normal; widows: 2; word-spacing: 0px; "><SPAN =
class=3D"Apple-style-span" style=3D"border-collapse: separate; =
border-spacing: 0px 0px; color: rgb(0, 0, 0); font-family: Arial; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; text-align: auto; =
-khtml-text-decorations-in-effect: none; text-indent: 0px; =
-apple-text-size-adjust: auto; text-transform: none; orphans: 2; =
white-space: normal; widows: 2; word-spacing: 0px; "><SPAN =
class=3D"Apple-style-span" style=3D"border-collapse: separate; =
border-spacing: 0px 0px; color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; text-align: auto; =
-khtml-text-decorations-in-effect: none; text-indent: 0px; =
-apple-text-size-adjust: auto; text-transform: none; orphans: 2; =
white-space: normal; widows: 2; word-spacing: 0px; "><SPAN =
class=3D"Apple-style-span" style=3D"border-collapse: separate; =
border-spacing: 0px 0px; color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 12px; font-style: normal; font-variant: normal; font-weight: =
normal; letter-spacing: normal; line-height: normal; text-align: auto; =
-khtml-text-decorations-in-effect: none; text-indent: 0px; =
-apple-text-size-adjust: auto; text-transform: none; orphans: 2; =
white-space: normal; widows: 2; word-spacing: 0px; "><DIV =
style=3D"font-family: Helvetica; "><BR =
class=3D"khtml-block-placeholder"></DIV><DIV style=3D"font-family: =
Helvetica; "><BR class=3D"khtml-block-placeholder"></DIV><DIV =
style=3D"font-family: Helvetica; "><SPAN class=3D"Apple-style-span" =
style=3D"font-family: Helvetica; "><SPAN class=3D"Apple-style-span" =
style=3D"font-family: Helvetica; "><SPAN class=3D"Apple-style-span" =
style=3D"font-family: Helvetica; "><SPAN class=3D"Apple-style-span" =
style=3D"font-family: Helvetica; "><SPAN class=3D"Apple-style-span" =
style=3D"font-family: Helvetica; "><SPAN class=3D"Apple-style-span" =
style=3D"font-family: Helvetica; "><SPAN class=3D"Apple-style-span" =
style=3D"font-family: Helvetica; "><SPAN class=3D"Apple-style-span" =
style=3D"font-family: Helvetica; "><SPAN class=3D"Apple-style-span" =
style=3D"font-family: Helvetica; "><SPAN class=3D"Apple-style-span" =
style=3D"font-family: Helvetica; =
">-Eric</SPAN></SPAN></SPAN></SPAN></SPAN></SPAN></SPAN></SPAN></SPAN></SP=
AN></DIV><DIV style=3D"font-family: Helvetica; "><SPAN =
class=3D"Apple-style-span" style=3D"font-family: Helvetica; "><SPAN =
class=3D"Apple-style-span" style=3D"font-family: Helvetica; "><SPAN =
class=3D"Apple-style-span" style=3D"font-family: Helvetica; "><SPAN =
class=3D"Apple-style-span" style=3D"font-family: Helvetica; "><SPAN =
class=3D"Apple-style-span" style=3D"font-family: Helvetica; "><SPAN =
class=3D"Apple-style-span" style=3D"font-family: Helvetica; "><SPAN =
class=3D"Apple-style-span" style=3D"font-family: Helvetica; "><SPAN =
class=3D"Apple-style-span" style=3D"font-family: Helvetica; "><SPAN =
class=3D"Apple-style-span" style=3D"font-family: Helvetica; "><SPAN =
class=3D"Apple-style-span" style=3D"font-family: Helvetica; =
">________________________________</SPAN></SPAN></SPAN></SPAN></SPAN></SPA=
N></SPAN></SPAN></SPAN></SPAN></DIV><DIV style=3D"font-family: =
Helvetica; "><I style=3D"font-family: Helvetica; font-style: italic; =
"></I></DIV><DIV style=3D"font-family: Helvetica; "><I =
style=3D"font-family: Helvetica; font-style: italic; "><BR =
class=3D"khtml-block-placeholder"></I></DIV><DIV style=3D"font-family: =
Helvetica; "><I style=3D"font-family: Helvetica; font-style: italic; =
"><SPAN class=3D"Apple-style-span" style=3D"font-family: Helvetica; =
font-style: italic; "><SPAN class=3D"Apple-style-span" =
style=3D"font-family: Helvetica; font-style: italic; "><SPAN =
class=3D"Apple-style-span" style=3D"font-family: Helvetica; font-style: =
italic; ">***This message has been dgitally signed by Thawte Certificate =
Authority*</SPAN></SPAN></SPAN></I></DIV><BR =
class=3D"Apple-interchange-newline"></SPAN></SPAN></SPAN></SPAN></SPAN></S=
PAN></SPAN></SPAN></SPAN></SPAN></SPAN></SPAN> =
</DIV><BR></DIV></BODY></HTML>=

--Apple-Mail-29--855028159--

--Apple-Mail-30--855027941
Content-Transfer-Encoding: base64
Content-Type: application/pkcs7-signature;
	name=smime.p7s
Content-Disposition: attachment;
	filename=smime.p7s

MIAGCSqGSIb3DQEHAqCAMIACAQExCzAJBgUrDgMCGgUAMIAGCSqGSIb3DQEHAQAAoIIGJzCCAuAw
ggJJoAMCAQICEEF2Uitin06DEO8ORxY1xRIwDQYJKoZIhvcNAQEEBQAwYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMB4XDTA2MDUwMzAyMzQ0N1oXDTA3MDUwMzAyMzQ0
N1owRTEfMB0GA1UEAxMWVGhhd3RlIEZyZWVtYWlsIE1lbWJlcjEiMCAGCSqGSIb3DQEJARYTY2Jl
cmljM0Bjb21jYXN0Lm5ldDCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAOA2oiXjHgYE
18YSOJH2MaGW+x8Bqv3aTpPdzEwIsht9m3FLQlyuD0g1hYwfEu/pMFlFjkfUH61Jij1gxZoK3Pm9
F+dZxtc8a1eSm2SwvGl572jDRNfmsLPV0Svu0fRSoTCCgwziio3/r2j69SmT6/Lto/Ay7N2Xe23d
3tcFpvh/jjLlJujqiwpU51nNoTMPgxxyOBwxqbYsnV3PzYYBvLmxOgjk/0X+AsYpmZY2t0IH59hp
0x6mgJbwJxWOlnVtFjIAGbjBjfiVMBwP11f+hQqQDPTEBw63FnUu88aKskyZX3rvR4oWJv/i7Xoh
zgcUDegCcODpj43beA5ZwhbjLKMCAwEAAaMwMC4wHgYDVR0RBBcwFYETY2JlcmljM0Bjb21jYXN0
Lm5ldDAMBgNVHRMBAf8EAjAAMA0GCSqGSIb3DQEBBAUAA4GBAAT8YdZdxhNoo2CCNrUIN6SrITg1
cq6w/QRdOtYGIC+INPxDyzmJd7da6NmSITxxE5sR/NDDAYM873oiFIVP/FiiJEfs4bk0Y2opZTPu
YP1qm+y4P5KalGzqtJN8l0qCyoBZ7exhMJf/t9CmmLZW2uOGbs8DMhQA/m/0yKExjO2PMIIDPzCC
AqigAwIBAgIBDTANBgkqhkiG9w0BAQUFADCB0TELMAkGA1UEBhMCWkExFTATBgNVBAgTDFdlc3Rl
cm4gQ2FwZTESMBAGA1UEBxMJQ2FwZSBUb3duMRowGAYDVQQKExFUaGF3dGUgQ29uc3VsdGluZzEo
MCYGA1UECxMfQ2VydGlmaWNhdGlvbiBTZXJ2aWNlcyBEaXZpc2lvbjEkMCIGA1UEAxMbVGhhd3Rl
IFBlcnNvbmFsIEZyZWVtYWlsIENBMSswKQYJKoZIhvcNAQkBFhxwZXJzb25hbC1mcmVlbWFpbEB0
aGF3dGUuY29tMB4XDTAzMDcxNzAwMDAwMFoXDTEzMDcxNjIzNTk1OVowYjELMAkGA1UEBhMCWkEx
JTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0ZSBQ
ZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBMIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDE
pjxVc1X7TrnKmVoeaMB1BHCd3+n/ox7svc31W/Iadr1/DDph8r9RzgHU5VAKMNcCY1osiRVwjt3J
8CuFWqo/cVbLrzwLB+fxH5E2JCoTzyvV84J3PQO+K/67GD4Hv0CAAmTXp6a7n2XRxSpUhQ9IBH+n
ttE8YQRAHmQZcmC3+wIDAQABo4GUMIGRMBIGA1UdEwEB/wQIMAYBAf8CAQAwQwYDVR0fBDwwOjA4
oDagNIYyaHR0cDovL2NybC50aGF3dGUuY29tL1RoYXd0ZVBlcnNvbmFsRnJlZW1haWxDQS5jcmww
CwYDVR0PBAQDAgEGMCkGA1UdEQQiMCCkHjAcMRowGAYDVQQDExFQcml2YXRlTGFiZWwyLTEzODAN
BgkqhkiG9w0BAQUFAAOBgQBIjNFQg+oLLswNo2asZw9/r6y+whehQ5aUnX9MIbj4Nh+qLZ82L8D0
HFAgk3A8/a3hYWLD2ToZfoSxmRsAxRoLgnSeJVCUYsfbJ3FXJY3dqZw5jowgT2Vfldr394fWxghO
rvbqNOUQGls1TXfjViF4gtwhGTXeJLHTHUb/XV9lTzGCAxAwggMMAgEBMHYwYjELMAkGA1UEBhMC
WkExJTAjBgNVBAoTHFRoYXd0ZSBDb25zdWx0aW5nIChQdHkpIEx0ZC4xLDAqBgNVBAMTI1RoYXd0
ZSBQZXJzb25hbCBGcmVlbWFpbCBJc3N1aW5nIENBAhBBdlIrYp9OgxDvDkcWNcUSMAkGBSsOAwIa
BQCgggFvMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTA2MTAwNDE4
NTgwMlowIwYJKoZIhvcNAQkEMRYEFCmQf8yGTb1qJg9EBi4zqcvX9A50MIGFBgkrBgEEAYI3EAQx
eDB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQu
MSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1haWwgSXNzdWluZyBDQQIQQXZSK2KfToMQ
7w5HFjXFEjCBhwYLKoZIhvcNAQkQAgsxeKB2MGIxCzAJBgNVBAYTAlpBMSUwIwYDVQQKExxUaGF3
dGUgQ29uc3VsdGluZyAoUHR5KSBMdGQuMSwwKgYDVQQDEyNUaGF3dGUgUGVyc29uYWwgRnJlZW1h
aWwgSXNzdWluZyBDQQIQQXZSK2KfToMQ7w5HFjXFEjANBgkqhkiG9w0BAQEFAASCAQB2cMhwuFwW
XKz0K8KjOP5OLNNeOl+CnEm7glo42e1kCRz8F39RY1jo7mYxQdeb9fL9vgxTXqKmleP0rs+eyyza
qC/EhyA5bwljABcoSjpsCFqbdjTBRB6okqa8GHRLeZm9Vc/0NpqHaBfaDp+mdQ7CU8VRpW/ljRfT
2dh+lBY+DJ/V0/cRgCKAkyIAfRL08AjfE73GJNakaqREhxnawt2Hshg1jChTXN5j8atFzGpIUa4E
U+mdpXqkACgHb5KQNuIhcVz2fciu/g9fByw+kLgJqfB10kFI2YNd/8CeBY7zQ7QHkF8iPSRRGQSH
U7G+TgiBAPq/zBetywsH0ticpDnAAAAAAAAA

--Apple-Mail-30--855027941--
