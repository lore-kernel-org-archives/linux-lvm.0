content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----_=_NextPart_001_01C163D3.02D1AEB0"
Subject: RE: [linux-lvm] snapshot questions
Message-ID: <D880FFC9CFDBA84FA13E9B166D06A123B647FB@daedalus.kenamea.com>
From: "Kenny Gorman" <kenny@kenamea.com>
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
Date: Fri Nov  2 13:16:02 2001
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------_=_NextPart_001_01C163D3.02D1AEB0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Kyle,

I have the opposite opinion as Jesus.  File system level backups are the
way to go.  Maybe not on Linux (because of the robustness of the
snapshot facility), but for sure using Veritas.  See, file system level
database backups are fast, scalable, and simple.  However, if you can
not count on the data consistency, then I would agree with Jesus.

My personal opinion (as a DBA), is that the simplest approach to backup
and recover is best.  If you cant do the restore at 3:00am with one eye
closed and make 0 mistakes, then it's not worth it (that why I dont use
Oracle RMAN).  I use snapshots (Veritas/Sun) for backups of my
production DB's.  It's really nice to not to ever worry about a backup
window, just backup whenever!

That said, I am _evaluating_ how good Linux/LVM backups are in this
regard.  So far, it's been fine.  Also, as always, make sure you are, or
have a good DBA around. 8-)

2.5 cents.

Kenny Gorman
DBA
Kenamea


-----Original Message-----
From:	Jesus Manuel NAVARRO LOPEZ
Sent:	Fri 11/2/2001 10:52 AM
To:	linux-lvm@sistina.com
Cc:=09
Subject:	Re: [linux-lvm] snapshot questions

Hi, Kyle:

Kyle Hayes wrote:
>=20
> We are considering using LVM to do database snapshots for backups.
>=20

It's so rare the case where this approach really works that it doesn't
even deserve to be taken into consideration, so: DON'T EVER BACKUP A
DATABASE THROUGH FILESYSTEM UTILITIES.  The database has for sure
methods to achieve this goal: use them.
--=20
SALUD,
Jes=FAs
***
jesus_navarro@promofinarsa.es
***

_______________________________________________
linux-lvm mailing list
linux-lvm@sistina.com
http://lists.sistina.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html




------_=_NextPart_001_01C163D3.02D1AEB0
Content-Type: application/ms-tnef;
	name="winmail.dat"
Content-Transfer-Encoding: base64

eJ8+Ih0TAQaQCAAEAAAAAAABAAEAAQeQBgAIAAAA5AQAAAAAAADoAAEIgAcAGAAAAElQTS5NaWNy
b3NvZnQgTWFpbC5Ob3RlADEIAQ2ABAACAAAAAgACAAEEgAEAIwAAAFJFOiBbbGludXgtbHZtXSBz
bmFwc2hvdCBxdWVzdGlvbnMA8AwBBYADAA4AAADRBwsAAgALABEAGwAFACEBASCAAwAOAAAA0QcL
AAIACwARABwABQAiAQEJgAEAIQAAADc1QjRBOEIxRDRCQThENEY4RDcwQkNGQjNDRjg0RDU3AIcH
AQOQBgCkDAAANgAAAAMANgAAAAAAQAA5ALCu0QLTY8EBHgA9AAEAAAAFAAAAUkU6IAAAAAACAUcA
AQAAADIAAABjPXVzO2E9IDtwPWtlbmFtZWE7bD1EQUVEQUxVUy0wMTExMDIxOTE3MjdaLTQ5NDA3
AAAAHgBJAAEAAAAjAAAAUmU6IFtsaW51eC1sdm1dIHNuYXBzaG90IHF1ZXN0aW9ucwAAQABOAABf
u4rPY8EBHgBaAAEAAAAbAAAASmVzdXMgTWFudWVsIE5BVkFSUk8gTE9QRVoAAAIBWwABAAAAVgAA
AAAAAACBKx+kvqMQGZ1uAN0BD1QCAAAAAEplc3VzIE1hbnVlbCBOQVZBUlJPIExPUEVaAFNNVFAA
amVzdXNfbmF2YXJyb0Bwcm9tb2ZpbmFyc2EuZXMAAAACAVwAAQAAACMAAABTTVRQOkpFU1VTX05B
VkFSUk9AUFJPTU9GSU5BUlNBLkVTAAAeAF0AAQAAABsAAABKZXN1cyBNYW51ZWwgTkFWQVJSTyBM
T1BFWgAAAgFeAAEAAABWAAAAAAAAAIErH6S+oxAZnW4A3QEPVAIAAAAASmVzdXMgTWFudWVsIE5B
VkFSUk8gTE9QRVoAU01UUABqZXN1c19uYXZhcnJvQHByb21vZmluYXJzYS5lcwAAAAIBXwABAAAA
IwAAAFNNVFA6SkVTVVNfTkFWQVJST0BQUk9NT0ZJTkFSU0EuRVMAAB4AZgABAAAABQAAAFNNVFAA
AAAAHgBnAAEAAAAeAAAAamVzdXNfbmF2YXJyb0Bwcm9tb2ZpbmFyc2EuZXMAAAAeAGgAAQAAAAUA
AABTTVRQAAAAAB4AaQABAAAAHgAAAGplc3VzX25hdmFycm9AcHJvbW9maW5hcnNhLmVzAAAAHgBw
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
ACAAcQB1AGUAcwB0AGkAbwBuAHMALgBFAE0ATAAAAAAACwD2EAAAAABAAAcwwKR6yNFjwQFAAAgw
cprdAtNjwQEDAN4/5AQAAAMA8T8JAAAAHgD4PwEAAAANAAAAS2VubnkgR29ybWFuAAAAAAIB+T8B
AAAAXAAAAAAAAADcp0DIwEIQGrS5CAArL+GCAQAAAAAAAAAvTz1LRU5BTUVBL09VPUZJUlNUIEFE
TUlOSVNUUkFUSVZFIEdST1VQL0NOPVJFQ0lQSUVOVFMvQ049S0VOTlkAHgD6PwEAAAAVAAAAU3lz
dGVtIEFkbWluaXN0cmF0b3IAAAAAAgH7PwEAAAAeAAAAAAAAANynQMjAQhAatLkIACsv4YIBAAAA
AAAAAC4AAAADAP0/5AQAAAMAGUAAAAAAAwAaQAAAAAADAB1AAAAAAAMAHkAAAAAAHgAwQAEAAAAG
AAAAS0VOTlkAAAAeADFAAQAAAAYAAABLRU5OWQAAAB4AMkABAAAAHgAAAGplc3VzX25hdmFycm9A
cHJvbW9maW5hcnNhLmVzAAAAHgAzQAEAAAAeAAAAamVzdXNfbmF2YXJyb0Bwcm9tb2ZpbmFyc2Eu
ZXMAAAAeADhAAQAAAAYAAABLRU5OWQAAAB4AOUABAAAAAgAAAC4AAAALACkAAAAAAAsAIwAAAAAA
AwAGEEEZrQUDAAcQRQUAAAMAEBAAAAAAAwAREAAAAAAeAAgQAQAAAGUAAABLWUxFLElIQVZFVEhF
T1BQT1NJVEVPUElOSU9OQVNKRVNVU0ZJTEVTWVNURU1MRVZFTEJBQ0tVUFNBUkVUSEVXQVlUT0dP
TUFZQkVOT1RPTkxJTlVYKEJFQ0FVU0VPRlRIRVJPAAAAAAIBfwABAAAAPgAAADxEODgwRkZDOUNG
REJBODRGQTEzRTlCMTY2RDA2QTEyM0I2NDdGQkBkYWVkYWx1cy5rZW5hbWVhLmNvbT4AAABxiA==

------_=_NextPart_001_01C163D3.02D1AEB0--
