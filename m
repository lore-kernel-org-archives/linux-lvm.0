Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k1232J111708
	for <linux-lvm@redhat.com>; Wed, 1 Feb 2006 22:02:19 -0500
Received: from mail7.amherst.edu (mail7.amherst.edu [148.85.136.41])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k1232I4g005662
	for <linux-lvm@redhat.com>; Wed, 1 Feb 2006 22:02:18 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C627A5.13A97B94"
Subject: RE: [linux-lvm] 'snapshot' target still experimental :-(
Date: Wed, 1 Feb 2006 22:02:17 -0500
Message-ID: <0456A130F613AD459887FF012652963F073ABC@mail7.amherst.edu>
From: "Steffen Plotner" <swplotner@amherst.edu>
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
To: mingz@ele.uri.edu, LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C627A5.13A97B94
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,
=20
On an experimental system I changed the device mapper from 1.01.02 to =
1.02.02 and lvm from 2.01.08 to 2.02.01 and upgraded on FC4 from 2.6.13 =
to 2.6.14-1.1653_FC4. Create a LV, create a snapshot, dd if=3D/dev/zero =
of=3Dtest bs=3D1M count=3D10000 on the LV (not the snapshot), then try =
to remove the snapshot and the kernel faults.=20
=20
I suspect that the outstanding block I/Os are probably the issue. You =
ask about the 5 second outage of ietd? the iscsi initiators see the =
event and reconnect - as long as the outage is not more than 1 minute =
(windows does not like it, linux is very resilient about it).
=20
Steffen
=20
________________________________=20
Steffen Plotner=20
Systems Administrator/Programmer=20
Systems & Networking=20
Amherst College=20
PO BOX 5000=20
Amherst, MA 01002-5000=20
Tel (413) 542-2348=20
Fax (413) 542-2626=20
Email: swplotner@amherst.edu=20
________________________________=20

________________________________

From: linux-lvm-bounces@redhat.com on behalf of Ming Zhang
Sent: Wed 2/1/2006 3:54 PM
To: LVM general discussion and development
Subject: RE: [linux-lvm] 'snapshot' target still experimental :-(



i can confirm this. iet runs well with heavy io until you create many
snapshots. lvresize will be slow as well, though not hang. i think that
is because the outstanding bio? not quite since i faced that several
months ago.

ps, not lvm related, but if u stop iet for 5 seconds. i guess iscsi ini
will be unhappy? :P we can discuss in iet list.

ming


On Wed, 2006-02-01 at 13:39 -0500, Steffen Plotner wrote:
> Hi,
>
> I apologize for looking up your machine. I have reported this problem
> sometime ago in November of last year.=20
>
> https://www.redhat.com/archives/linux-lvm/2005-November/msg00044.html
>
> We currently deployed an iscsi-target (from sourceforge) server on FC4
> which functions well, until we utilize snapshots. The way I currently
> remove snapshots is to stop the iscsi-target daemon for 5 seconds, to
> let everything settle, then remove the snap, the restart the
> iscsi-target and all is ok (of course this is not how I would like to =
do
> things.. :).
>
> I have tried several patches dm and lvm in late December and they did
> not help. I have specifics at my house. I will email those later on.
> Thank you for responding to this issue.
>
> Steffen
>
> -----Original Message-----
> From: linux-lvm-bounces@redhat.com =
[mailto:linux-lvm-bounces@redhat.com]
> On Behalf Of Alasdair G Kergon
> Sent: Wednesday, February 01, 2006 1:31 PM
> To: LVM general discussion and development
> Subject: Re: [linux-lvm] 'snapshot' target still experimental :-(
>
> On Wed, Feb 01, 2006 at 01:07:20PM -0500, Steffen Plotner wrote:
> > cd to a directory on an lv that has an active snapshot dd =
if=3D/dev/zero
>
> > of=3Dtest bs=3D1M count=3D10000
>=20
> > And see how hard it is to remove a live active snapshot.
>
> Strange - I don't recall anyone reporting that problem before.
>
> I've just tried it here and the machine locked up:-(
>
> Alasdair
> --
> agk@redhat.com
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/



------_=_NextPart_001_01C627A5.13A97B94
Content-Type: application/ms-tnef;
	name="winmail.dat"
Content-Transfer-Encoding: base64

eJ8+IhMDAQaQCAAEAAAAAAABAAEAAQeQBgAIAAAA5AQAAAAAAADoAAEIgAcAGAAAAElQTS5NaWNy
b3NvZnQgTWFpbC5Ob3RlADEIAQ2ABAACAAAAAgACAAEEgAEAOQAAAFJFOiBbbGludXgtbHZtXSAn
c25hcHNob3QnIHRhcmdldCBzdGlsbCBleHBlcmltZW50YWwgOi0oAP8TAQWAAwAOAAAA1gcCAAEA
FgACABEAAwAMAQEggAMADgAAANYHAgABABYAAgARAAMADAEBCYABACEAAABFMjM1NjNERkExMDI2
QzRCODlFQTA4Qjc3OTEzRUZBQQBOBwEDkAYABBwAADcAAAADADYAAAAAAEAAOQCUe6kTpSfGAR4A
PQABAAAABQAAAFJFOiAAAAAAAgFHAAEAAAA2AAAAYz1VUzthPSA7cD1BbWhlcnN0IENvbGxlZ2U7
bD1NQUlMNy0wNjAyMDIwMzAyMTdaLTcxOTcAAAAeAEkAAQAAADkAAABSRTogW2xpbnV4LWx2bV0g
J3NuYXBzaG90JyB0YXJnZXQgc3RpbGwgZXhwZXJpbWVudGFsIDotKAAAAABAAE4AAI61tXEnxgEe
AFoAAQAAAB0AAABsaW51eC1sdm0tYm91bmNlc0ByZWRoYXQuY29tAAAAAAIBWwABAAAAVwAAAAAA
AACBKx+kvqMQGZ1uAN0BD1QCAAAAAGxpbnV4LWx2bS1ib3VuY2VzQHJlZGhhdC5jb20AU01UUABs
aW51eC1sdm0tYm91bmNlc0ByZWRoYXQuY29tAAACAVwAAQAAACIAAABTTVRQOkxJTlVYLUxWTS1C
T1VOQ0VTQFJFREhBVC5DT00AAAAeAF0AAQAAAAsAAABNaW5nIFpoYW5nAAACAV4AAQAAADoAAAAA
AAAAgSsfpL6jEBmdbgDdAQ9UAgAAAABNaW5nIFpoYW5nAFNNVFAAbWluZ3pAZWxlLnVyaS5lZHUA
AAACAV8AAQAAABcAAABTTVRQOk1JTkdaQEVMRS5VUkkuRURVAAAeAGYAAQAAAAUAAABTTVRQAAAA
AB4AZwABAAAAHQAAAGxpbnV4LWx2bS1ib3VuY2VzQHJlZGhhdC5jb20AAAAAHgBoAAEAAAAFAAAA
U01UUAAAAAAeAGkAAQAAABIAAABtaW5nekBlbGUudXJpLmVkdQAAAB4AcAABAAAANQAAAFtsaW51
eC1sdm1dICdzbmFwc2hvdCcgdGFyZ2V0IHN0aWxsIGV4cGVyaW1lbnRhbCA6LSgAAAAAAgFxAAEA
AAAbAAAAAcYncdD+OQRM7Bd6Q5Cdpy8apASrZAAMmgWZAB4AdAABAAAAJwAAAExWTSBnZW5lcmFs
IGRpc2N1c3Npb24gYW5kIGRldmVsb3BtZW50AAAeABoMAQAAABAAAABTdGVmZmVuIFBsb3RuZXIA
HgAdDgEAAAA1AAAAW2xpbnV4LWx2bV0gJ3NuYXBzaG90JyB0YXJnZXQgc3RpbGwgZXhwZXJpbWVu
dGFsIDotKAAAAAACAQkQAQAAAL4UAAC6FAAAllEAAExaRnXI8+GFAwAKAHJjcGcxMjWCMgNDaHRt
bDEDMD8BAwH3CoACpAPjAgBjaMEKwHNldDAgBxMCgP8QAwBQBFYIVQeyEdUOUQMB3RDXMgYABsMR
1TMERhDZWRLvZjQDxhGKNQPGVlUEkGQAcGER1TYDxlR8YWgDcQKAEeMI7wn3O/sc7w4wNR4PHe8e
9RHhDGDOYwBQCwkBZDM2EWALpWQ0IBACKlwOsgGQZy8U8AqjEeMkiDQU8DwhAERPQ1RZUEUgAEhU
TUwgUFVCAExJQyAiLS8viFczQyggRFREJzQIMy4yKCBFTiI+5yWNJS8qYTE4JpAnQimvGyq/LTAz
JCAsEEVBRF8sbQ7xLY8wDyuUNg7wPFBNRVRBB7BBMwA9TCJHCfAEkGF0BbAi0RcQT05UKXBUM5AF
4URFeBDxbmdlBlJ2DxMxNeEAkAIgIDYuNeouAcAyNqAwKZ4xbyujBDc3JpBUSVRMRQUsbjQO8FJF
OiBbAmwLgHV4LWx2bZBdICdzGnBwcxuwaHQnIAGQcjWABUBzxnQDEAMgZXhwBnEHgEMCMAdAIDot
KCsONf0mkC857zgfLOU7MUAALu8LLT9D1DURYDxCT0SOWUNNI5FEb2c5NiaQgERJViBpZD1IwCBP
V0FSZQtQeVQBPeB0OTM4MTkg0GRpcj1D8HJDQEOzfQAhIAAASnEKsUtiEPBc/nEDIUrVEWBGL0c/
SEZKP+dLT0xaQ4k2NFA6TI8rlEo0K/FGNHEgZgDQZYo9BxMgHGM9IzBXQ+k9cGl6VlAyUCsYMAMw
nmMT8AOyAdBMaUhlPbDUbywrHDVIUS9V0lAp/1A3UnsBwFA3CqJc6AqAKxz+MC6xKIBIkFw/VG9N
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
T9YeNRNRL0ZPTv5UBikPLxQgjyIQaBSojxOrFK+99jcR8lASTjADEbAvRElWFt8a/2cPsSePMx9f
IG81OBIBQk+8RFkSTRHwIZ8kITcSAVBIVE1MBiB9JlAAAB4ANRABAAAAOwAAADwwNDU2QTEzMEY2
MTNBRDQ1OTg4N0ZGMDEyNjUyOTYzRjA3M0FCQ0BtYWlsNy5hbWhlcnN0LmVkdT4AAB4ARxABAAAA
DwAAAG1lc3NhZ2UvcmZjODIyAAALAPIQAQAAAB8A8xABAAAAggAAAFIARQAlADMAQQAgAFsAbABp
AG4AdQB4AC0AbAB2AG0AXQAgACcAcwBuAGEAcABzAGgAbwB0ACcAIAB0AGEAcgBnAGUAdAAgAHMA
dABpAGwAbAAgAGUAeABwAGUAcgBpAG0AZQBuAHQAYQBsACAAJQAzAEEALQAoAC4ARQBNAEwAAAAA
AAsA9hAAAAAAQAAHMBYAFTmkJ8YBQAAIMEZArhOlJ8YBAwDeP69vAAADAPE/CQQAAB4A+D8BAAAA
EAAAAFN0ZWZmZW4gUGxvdG5lcgACAfk/AQAAAFUAAAAAAAAA3KdAyMBCEBq0uQgAKy/hggEAAAAA
AAAAL089QU1IRVJTVCBDT0xMRUdFL09VPUFNSEVSU1QvQ049UkVDSVBJRU5UUy9DTj1TV1BMT1RO
RVIAAAAAHgD6PwEAAAAVAAAAU3lzdGVtIEFkbWluaXN0cmF0b3IAAAAAAgH7PwEAAAAeAAAAAAAA
ANynQMjAQhAatLkIACsv4YIBAAAAAAAAAC4AAAADAP0/5AQAAAMAGUAAAAAAAwAaQAAAAAADAB1A
AAAAAAMAHkAAAAAAHgAwQAEAAAAKAAAAU1dQTE9UTkVSAAAAHgAxQAEAAAAKAAAAU1dQTE9UTkVS
AAAAHgAyQAEAAAAdAAAAbGludXgtbHZtLWJvdW5jZXNAcmVkaGF0LmNvbQAAAAAeADNAAQAAABIA
AABtaW5nekBlbGUudXJpLmVkdQAAAB4AOEABAAAACgAAAFNXUExPVE5FUgAAAB4AOUABAAAAAgAA
AC4AAAADAHZA/////wsAKQAAAAAACwAjAAAAAAADAAYQc/eQVwMABxBxCgAAAwAQEAAAAAADABEQ
AAAAAB4ACBABAAAAZQAAAEhFTExPLE9OQU5FWFBFUklNRU5UQUxTWVNURU1JQ0hBTkdFRFRIRURF
VklDRU1BUFBFUkZST00xMDEwMlRPMTAyMDJBTkRMVk1GUk9NMjAxMDhUTzIwMjAxQU5EVVBHUkFE
RUQAAAAAAgF/AAEAAAA7AAAAPDA0NTZBMTMwRjYxM0FENDU5ODg3RkYwMTI2NTI5NjNGMDczQUJD
QG1haWw3LmFtaGVyc3QuZWR1PgAAvx8=

------_=_NextPart_001_01C627A5.13A97B94--
