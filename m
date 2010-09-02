Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o82BqhI2007572
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2010 07:52:43 -0400
Received: from ExchIPMX1.lsuhsc.edu (exchipmx1.lsuhsc.edu [155.58.210.24])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o82BqXvt016574
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2010 07:52:33 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01CB4A95.00C2A80A"
Date: Thu, 2 Sep 2010 06:50:13 -0500
Message-ID: <2E9263050F8EE046972BE0510E7A71DA03D99F3C@SH-EXCHBE2.master.lsuhsc.edu>
References: <mailman.25972.1283360318.9817.linux-lvm@redhat.com>
From: "Patterson, James" <JPatte@lsuhsc.edu>
Subject: Re: [linux-lvm] HDD failure - please help!
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.

------_=_NextPart_001_01CB4A95.00C2A80A
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

> Striping (like RAID0) actually makes your data *more* vulnerable (but =
faster).

Stuart, I just mentioned that in passing - I did NOT use striping.=20

> If you wanted RAID5, your best bet on linux is the md driver. =20
> Or else a hardware RAID controller.

I don't/didn't want RAID.=20

> Since you don't have any details on exactly what kind of LVs you =
created

The default FC11 creation - whatever that may be.

> your first step is getting a copy of the metadata. =20
> There should be a copy at the beginning of each drive.

Yes. How do I access it? None of the drives will mount. I am thinking =
here that I should create a special boot disk with the LVM tools on it =
(they are not present on the FC11 boot iso, afaik).

> If you had a single logical volume, and you were configured as=20
> jbod (Just a Bunch of Disks)

I'm reasonably certain that's what I had.

> then you should look back a month or so in the archives
> where another user made the same mistake, but got a significant =
portion
> of his data back from the good drives.  I won't repeat the steps here.
> (You'll need an external USB adapter, freezer, new drive to replace =
failed,

I looked...could you please be a bit more specific? I didn't see =
anything.

> Hopefully, you've learned your lesson and won't presume (or assume) =
next time.

Well, truly, the only thing I've learned is never to use LVM if it's =
going to cause me to lose data on all 5 drives when one goes down. The =
logic behind it's use appears to be to just make life "easier" by using =
one larger disk. The reality of the situation is that I don't have one =
large disk - I have 5 disks. If LVM can't figure out how to restore from =
four remaining disks (or alternatively I can't figure out how to use LVM =
tools to do so) then it's less than useful for me.

James

------_=_NextPart_001_01CB4A95.00C2A80A
Content-Type: application/ms-tnef;
	name="winmail.dat"
Content-Transfer-Encoding: base64

eJ8+Ig4LAQaQCAAEAAAAAAABAAEAAQeQBgAIAAAA5AQAAAAAAADoAAEIgAcAGAAAAElQTS5NaWNy
b3NvZnQgTWFpbC5Ob3RlADEIAQ2ABAACAAAAAgACAAEEgAEAKwAAAFJlOiBbbGludXgtbHZtXSBI
REQgZmFpbHVyZSAtIHBsZWFzZSBoZWxwIQA+DgEFgAMADgAAANoHCQACAAYAMgANAAQANQEBIIAD
AA4AAADaBwkAAgAGADIADQAEADUBAQmAAQAhAAAARUYwRTU0NEE3Q0Y0Mzc0RUFERUI5ODNFN0FG
MzU0RTkAggcBA5AGADQNAAA5AAAAAwAmAAAAAAADADYAAAAAAEAAOQAKqMIAlUrLAR4APQABAAAA
BQAAAFJlOiAAAAAAAgFHAAEAAAAyAAAAYz1VUzthPSA7cD1MU1VNQztsPVNILUVYQ0hCRTItMTAw
OTAyMTE1MDEzWi0zMjEwMgAAAB4ASQABAAAAIgAAAGxpbnV4LWx2bSBEaWdlc3QsIFZvbCA3OSwg
SXNzdWUgMQAAAEAATgAA8/nr9knLAR4AWgABAAAAHQAAAGxpbnV4LWx2bS1ib3VuY2VzQHJlZGhh
dC5jb20AAAAAAgFbAAEAAABXAAAAAAAAAIErH6S+oxAZnW4A3QEPVAIAAAAAbGludXgtbHZtLWJv
dW5jZXNAcmVkaGF0LmNvbQBTTVRQAGxpbnV4LWx2bS1ib3VuY2VzQHJlZGhhdC5jb20AAAIBXAAB
AAAAIgAAAFNNVFA6TElOVVgtTFZNLUJPVU5DRVNAUkVESEFULkNPTQAAAB4AXQABAAAAHQAAAGxp
bnV4LWx2bS1yZXF1ZXN0QHJlZGhhdC5jb20AAAAAAgFeAAEAAABXAAAAAAAAAIErH6S+oxAZnW4A
3QEPVAIAAAAAbGludXgtbHZtLXJlcXVlc3RAcmVkaGF0LmNvbQBTTVRQAGxpbnV4LWx2bS1yZXF1
ZXN0QHJlZGhhdC5jb20AAAIBXwABAAAAIgAAAFNNVFA6TElOVVgtTFZNLVJFUVVFU1RAUkVESEFU
LkNPTQAAAB4AZgABAAAABQAAAFNNVFAAAAAAHgBnAAEAAAAdAAAAbGludXgtbHZtLWJvdW5jZXNA
cmVkaGF0LmNvbQAAAAAeAGgAAQAAAAUAAABTTVRQAAAAAB4AaQABAAAAHQAAAGxpbnV4LWx2bS1y
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
MzYwMzE4Ljk4MTcubGludXgtbHZtQHJlZGhhdC5jb20+AAAAAB4ARxABAAAADwAAAG1lc3NhZ2Uv
cmZjODIyAAALAPIQAQAAAB8A8xABAAAAYgAAAFIAZQAlADMAQQAgAFsAbABpAG4AdQB4AC0AbAB2
AG0AXQAgAEgARABEACAAZgBhAGkAbAB1AHIAZQAgAC0AIABwAGwAZQBhAHMAZQAgAGgAZQBsAHAA
IQAuAEUATQBMAAAAAAALAPYQAAAAAEAABzCOPtb6k0rLAUAACDArHdgAlUrLAQMA3j+vbwAAAwDx
PwkEAAAeAPg/AQAAABEAAABQYXR0ZXJzb24sIEphbWVzAAAAAAIB+T8BAAAASAAAAAAAAADcp0DI
wEIQGrS5CAArL+GCAQAAAAAAAAAvTz1MU1VNQy9PVT1TSC1FWENIL0NOPVJFQ0lQSUVOVFMvQ049
SlBBVFRFAB4A+j8BAAAAFQAAAFN5c3RlbSBBZG1pbmlzdHJhdG9yAAAAAAIB+z8BAAAAHgAAAAAA
AADcp0DIwEIQGrS5CAArL+GCAQAAAAAAAAAuAAAAAwD9P+QEAAADABlAAAAAAAMAGkAAAAAAAwAd
QAAAAAADAB5AAAAAAB4AMEABAAAABwAAAEpQQVRURQAAHgAxQAEAAAAHAAAASlBBVFRFAAAeADJA
AQAAAB0AAABsaW51eC1sdm0tYm91bmNlc0ByZWRoYXQuY29tAAAAAB4AM0ABAAAAHQAAAGxpbnV4
LWx2bS1yZXF1ZXN0QHJlZGhhdC5jb20AAAAAHgA4QAEAAAAHAAAASlBBVFRFAAAeADlAAQAAAAIA
AAAuAAAAAwB2QP////8LACkAAAAAAAsAIwAAAAAAAwAGEM3IEJoDAAcQWgUAAAMAEBABAAAAAwAR
EAAAAAAeAAgQAQAAAGUAAABTVFJJUElORyhMSUtFUkFJRDApQUNUVUFMTFlNQUtFU1lPVVJEQVRB
Kk1PUkUqVlVMTkVSQUJMRShCVVRGQVNURVIpU1RVQVJULElKVVNUTUVOVElPTkVEVEhBVElOUEFT
U0lOAAAAAAIBfwABAAAASAAAADwyRTkyNjMwNTBGOEVFMDQ2OTcyQkUwNTEwRTdBNzFEQTAzRDk5
RjNDQFNILUVYQ0hCRTIubWFzdGVyLmxzdWhzYy5lZHU+ADaw

------_=_NextPart_001_01CB4A95.00C2A80A--
