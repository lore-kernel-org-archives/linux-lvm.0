Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6B6ROvh009318
	for <linux-lvm@redhat.com>; Tue, 11 Jul 2006 02:27:24 -0400
Received: from smtp3.marviq.com (smtp3.marviq.com [80.248.35.20])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6B6RMmN004593
	for <linux-lvm@redhat.com>; Tue, 11 Jul 2006 02:27:23 -0400
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C6A4B2.CD4D9CEC"
Subject: RE: [linux-lvm] LVM2 maximum logical volume size help
Date: Tue, 11 Jul 2006 08:22:37 +0200
Message-ID: <32F72C4D4D0EC8458CA5BFD76A6D6C68064E9D35@gimli.xb.local>
References: <012401c6a45a$c53bcb80$2901a8c0@robbie>
From: "Shaun Mccullagh" <Shaun.Mccullagh@xb.nl>
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
To: Robbie Coss <robbie@vzavenue.net>, LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C6A4B2.CD4D9CEC
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Kernel 2.6 supports ext3 filesystems up to 32TB, according to RH =
Support.
=20
Do you want to store a lot of files? or a few thousand in which case =
look at the mkfs.ext3 options to reduce the number of Inodes and speed =
up fsck after a crash.
=20
HTH
=20
Shaun

________________________________

From: linux-lvm-bounces@redhat.com on behalf of Robbie Coss
Sent: Mon 10/07/2006 21:55
To: linux-lvm@redhat.com
Subject: [linux-lvm] LVM2 maximum logical volume size help



Hi,

I am currently running RHEL4 update 3  (kernel 2.6.9-34.0.2.EL), and
using LVM2 and the ext3 filesystem.

I need to know what is the maximum logical volume size I can create. =
From
the LVM2 Howto, the max size is stated to be 8 exebytes. However, the
Red Hat doc says that the max filesystem size for ext3 is 8 TB.

I am guessing that means I am limited to 8 TB if I want to use ext3 ???

If so, then are there other filesystems I can use to overcome this =
limit. I
want
to be able to create volumes at least up to 100TB. Is there anything
included
with the Red Hat release that would be a good choice? Or anything free =
not
included with Red Hat? Or anything commercial?

Thanks in advance for any help or opinions.
Robbie

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/






Op dit e-mailbericht is een disclaimer van toepassing, welke te vinden =
is op http://www.xb.nl/disclaimer.html




------_=_NextPart_001_01C6A4B2.CD4D9CEC
Content-Type: application/ms-tnef;
	name="winmail.dat"
Content-Transfer-Encoding: base64

eJ8+Ih0GAQaQCAAEAAAAAAABAAEAAQeQBgAIAAAA5AQAAAAAAADoAAEIgAcAGAAAAElQTS5NaWNy
b3NvZnQgTWFpbC5Ob3RlADEIAQ2ABAACAAAAAgACAAEEgAEANgAAAFJFOiBbbGludXgtbHZtXSBM
Vk0yIG1heGltdW0gbG9naWNhbCB2b2x1bWUgc2l6ZSBoZWxwAAsTAQWAAwAOAAAA1gcHAAsACAAW
ACUAAgA0AQEggAMADgAAANYHBwALAAgAGQAcAAIALgEBCYABACEAAABCQkY1QkZFQTk2RUY0QjRC
ODRCNDMwMjBDMEQ5QjQyMwBlBwEDkAYATBAAADgAAAADADYAAAAAAEAAOQA0eURnsqTGAR4APQAB
AAAABQAAAFJFOiAAAAAAAgFHAAEAAAAqAAAAYz1VUzthPSA7cD1YQjtsPUdJTUxJLTA2MDcxMTA2
MjUyOFotMTA1MzkAAAAeAEkAAQAAADIAAABbbGludXgtbHZtXSBMVk0yIG1heGltdW0gbG9naWNh
bCB2b2x1bWUgc2l6ZSBoZWxwAAAAQABOAAAXqMRapMYBHgBaAAEAAAAdAAAAbGludXgtbHZtLWJv
dW5jZXNAcmVkaGF0LmNvbQAAAAACAVsAAQAAAFcAAAAAAAAAgSsfpL6jEBmdbgDdAQ9UAgAAAABs
aW51eC1sdm0tYm91bmNlc0ByZWRoYXQuY29tAFNNVFAAbGludXgtbHZtLWJvdW5jZXNAcmVkaGF0
LmNvbQAAAgFcAAEAAAAiAAAAU01UUDpMSU5VWC1MVk0tQk9VTkNFU0BSRURIQVQuQ09NAAAAHgBd
AAEAAAAMAAAAUm9iYmllIENvc3MAAgFeAAEAAAA9AAAAAAAAAIErH6S+oxAZnW4A3QEPVAIAAAAA
Um9iYmllIENvc3MAU01UUAByb2JiaWVAdnphdmVudWUubmV0AAAAAAIBXwABAAAAGQAAAFNNVFA6
Uk9CQklFQFZaQVZFTlVFLk5FVAAAAAAeAGYAAQAAAAUAAABTTVRQAAAAAB4AZwABAAAAHQAAAGxp
bnV4LWx2bS1ib3VuY2VzQHJlZGhhdC5jb20AAAAAHgBoAAEAAAAFAAAAU01UUAAAAAAeAGkAAQAA
ABQAAAByb2JiaWVAdnphdmVudWUubmV0AB4AcAABAAAAMgAAAFtsaW51eC1sdm1dIExWTTIgbWF4
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
XQAgAEwAVgBNADIAIABtAGEAeABpAG0AdQBtACAAbABvAGcAaQBjAGEAbAAgAHYAbwBsAHUAbQBl
ACAAcwBpAHoAZQAgAGgAZQBsAHAALgBFAE0ATAAAAAsA9hAAAAAAQAAHMDR5RGeypMYBQAAIMAjr
W82ypMYBAwDeP69vAAADAPE/CQgAAB4A+D8BAAAAEAAAAFNoYXVuIE1jY3VsbGFnaAACAfk/AQAA
AFcAAAAAAAAA3KdAyMBCEBq0uQgAKy/hggEAAAAAAAAAL089WEIvT1U9RklSU1QgQURNSU5JU1RS
QVRJVkUgR1JPVVAvQ049UkVDSVBJRU5UUy9DTj1TSEFVTgAAHgD6PwEAAAAVAAAAU3lzdGVtIEFk
bWluaXN0cmF0b3IAAAAAAgH7PwEAAAAeAAAAAAAAANynQMjAQhAatLkIACsv4YIBAAAAAAAAAC4A
AAADAP0/5AQAAAMAGUAAAAAAAwAaQAAAAAADAB1AAAAAAAMAHkAAAAAAHgAwQAEAAAAGAAAAU0hB
VU4AAAAeADFAAQAAAAYAAABTSEFVTgAAAB4AMkABAAAAHQAAAGxpbnV4LWx2bS1ib3VuY2VzQHJl
ZGhhdC5jb20AAAAAHgAzQAEAAAAUAAAAcm9iYmllQHZ6YXZlbnVlLm5ldAAeADhAAQAAAAYAAABT
SEFVTgAAAB4AOUABAAAAAgAAAC4AAAADAHZA/////wsAKQAAAAAACwAjAAAAAAADAAYQIHpzqAMA
BxAUBAAAAwAQEAAAAAADABEQAAAAAB4ACBABAAAAZQAAAEtFUk5FTDI2U1VQUE9SVFNFWFQzRklM
RVNZU1RFTVNVUFRPMzJUQixBQ0NPUkRJTkdUT1JIU1VQUE9SVERPWU9VV0FOVFRPU1RPUkVBTE9U
T0ZGSUxFUz9PUkFGRVdUSE9VU0EAAAAAAgF/AAEAAAA6AAAAPDMyRjcyQzRENEQwRUM4NDU4Q0E1
QkZENzZBNkQ2QzY4MDY0RTlEMzVAZ2ltbGkueGIubG9jYWw+AAAAonw=

------_=_NextPart_001_01C6A4B2.CD4D9CEC--
