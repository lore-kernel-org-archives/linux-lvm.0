From: holger_zecha@hp.com
Date: Wed, 7 Jun 2000 08:39:58 +0200
Message-Id: <H0000aed07d40671@MHS>
Subject: RE: Re: [linux-lvm] LVM 0.8 and reiser filesystem
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary=openmail-part-17f77c37-00000002
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: hopper@omnifarious.mn.org, holger_zecha@hp.com
Cc: linux-lvm@msede.com


--openmail-part-17f77c37-00000002
Content-Type: text/plain; charset=ISO-8859-1; name="BDY.RTF"
Content-Disposition: inline; filename="BDY.RTF"
Content-Transfer-Encoding: quoted-printable

Hello,

the idea is the same as in HP-UX.
When we are using Linux, it would be good, to get as close to HP-UX as
possible.
We're now using LVM in HP-UX to mirror the Volume groupe vg00

/dev/vg00/lvol4     307200   73329  219390   25% /
=2D-- Logical volumes ---
LV Name                     /dev/vg00/lvol4
VG Name                     /dev/vg00
LV Permission               read/write
LV Status                   available/syncd
Mirror copies               1
Consistency Recovery        MWC
Schedule                    parallel
LV Size (Mbytes)            300
Current LE                  75
Allocated PE                150
Stripes                     0
Stripe Size (Kbytes)        0
Bad block                   off
Allocation                  strict/contiguous
IO Timeout (Seconds)        default

We know, that it is possible to implement RAID 1 in other ways, but it's=

difficult to support.

 -----Original Message-----
From:       hopper@omnifarious.mn.org [mailto:hopper@omnifarious.mn.org]=

            =20
Sent:       Dienstag, 6. Juni 2000 19:34
To:         HOLGER ZECHA /HP-Germany,om17
Cc:         hopper@omnifarious.mn.org; linux-lvm@msede.com
Subject:    Re: [linux-lvm] LVM 0.8 and reiser filesystem

 << File: Re_ [linux-lvm] LVM 0.TXT >>  << File: Re_ [linux-lvm] LVM
0.TXT >>  << File: Untitled1 >> =20

--openmail-part-17f77c37-00000002
Content-Type: application/rtf; name="BDY.RTF"
Content-Disposition: attachment; filename="BDY.RTF"
Content-Transfer-Encoding: base64

e1xydGYxXGFuc2lcYW5zaWNwZzEyNTJcZGVmZjBcZGVmbGFuZzEwMzN7XGZvbnR0Ymx7XGYw
XGZtb2Rlcm5cZmNoYXJzZXQwIENvdXJpZXIgTmV3O317XGYxXGZzd2lzc1xmcHJxMlxmY2hh
cnNldDAgVGFob21hO319DQp7XGNvbG9ydGJsIDtccmVkMFxncmVlbjBcYmx1ZTI1NTt9DQpc
dmlld2tpbmQ0XHVjMVxwYXJkXGNmMVxmMFxmczIwIEhlbGxvLFxwYXINClxwYXINCnRoZSBp
ZGVhIGlzIHRoZSBzYW1lIGFzIGluIEhQLVVYLlxwYXINCldoZW4gd2UgYXJlIHVzaW5nIExp
bnV4LCBpdCB3b3VsZCBiZSBnb29kLCB0byBnZXQgYXMgY2xvc2UgdG8gSFAtVVggYXMgcG9z
c2libGUuXHBhcg0KV2UncmUgbm93IHVzaW5nIExWTSBpbiBIUC1VWCB0byBtaXJyb3IgdGhl
IFZvbHVtZSBncm91cGUgdmcwMFxwYXINClxwYXINCi9kZXYvdmcwMC9sdm9sNCAgICAgMzA3
MjAwICAgNzMzMjkgIDIxOTM5MCAgIDI1JSAvXHBhcg0KLS0tIExvZ2ljYWwgdm9sdW1lcyAt
LS1ccGFyDQpMViBOYW1lICAgICAgICAgICAgICAgICAgICAgL2Rldi92ZzAwL2x2b2w0XHBh
cg0KVkcgTmFtZSAgICAgICAgICAgICAgICAgICAgIC9kZXYvdmcwMFxwYXINCkxWIFBlcm1p
c3Npb24gICAgICAgICAgICAgICByZWFkL3dyaXRlXHBhcg0KTFYgU3RhdHVzICAgICAgICAg
ICAgICAgICAgIGF2YWlsYWJsZS9zeW5jZFxwYXINClxiXGZzMjQgTWlycm9yIGNvcGllcyAg
ICAgICAgICAgICAgIDFccGFyDQpcYjBcZnMyMCBDb25zaXN0ZW5jeSBSZWNvdmVyeSAgICAg
ICAgTVdDXHBhcg0KU2NoZWR1bGUgICAgICAgICAgICAgICAgICAgIHBhcmFsbGVsXHBhcg0K
TFYgU2l6ZSAoTWJ5dGVzKSAgICAgICAgICAgIDMwMFxwYXINCkN1cnJlbnQgTEUgICAgICAg
ICAgICAgICAgICA3NVxwYXINCkFsbG9jYXRlZCBQRSAgICAgICAgICAgICAgICAxNTBccGFy
DQpTdHJpcGVzICAgICAgICAgICAgICAgICAgICAgMFxwYXINClN0cmlwZSBTaXplIChLYnl0
ZXMpICAgICAgICAwXHBhcg0KQmFkIGJsb2NrICAgICAgICAgICAgICAgICAgIG9mZlxwYXIN
CkFsbG9jYXRpb24gICAgICAgICAgICAgICAgICBzdHJpY3QvY29udGlndW91c1xwYXINCklP
IFRpbWVvdXQgKFNlY29uZHMpICAgICAgICBkZWZhdWx0XHBhcg0KXHBhcg0KV2Uga25vdywg
dGhhdCBpdCBpcyBwb3NzaWJsZSB0byBpbXBsZW1lbnQgUkFJRCAxIGluIG90aGVyIHdheXMs
IGJ1dCBpdCdzIGRpZmZpY3VsdCB0byBzdXBwb3J0LlxwYXINClxwYXINClxjZjBccHJvdGVj
dFxmczI0ICBcbGFuZzEwMjRcZjFcZnMxNiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLVxw
YXINClxwcm90ZWN0MFxwYXJkXHByb3RlY3RcZmktMTQ0MFxsaTE0NDBcdHgxNDQwXGIgRnJv
bTogXHRhYlxiMCBob3BwZXJAb21uaWZhcmlvdXMubW4ub3JnIFttYWlsdG86aG9wcGVyQG9t
bmlmYXJpb3VzLm1uLm9yZ10gXHBhcg0KXGIgU2VudDpcdGFiXGIwIERpZW5zdGFnLCA2LiBK
dW5pIDIwMDAgMTk6MzRccGFyDQpcYiBUbzpcdGFiXGIwIEhPTEdFUiBaRUNIQSAvSFAtR2Vy
bWFueSxvbTE3XHBhcg0KXGIgQ2M6XHRhYlxiMCBob3BwZXJAb21uaWZhcmlvdXMubW4ub3Jn
OyBsaW51eC1sdm1AbXNlZGUuY29tXHBhcg0KXGIgU3ViamVjdDpcdGFiXGIwIFJlOiBbbGlu
dXgtbHZtXSBMVk0gMC44IGFuZCByZWlzZXIgZmlsZXN5c3RlbVxwYXINClxwYXINClxwcm90
ZWN0MFxwYXJkXHByb3RlY3RcbGFuZzEwMzNcZjBcZnMyMCAgPDwgRmlsZTogUmVfIFtsaW51
eC1sdm1dIExWTSAwLlRYVCA+PiAgPDwgRmlsZTogUmVfIFtsaW51eC1sdm1dIExWTSAwLlRY
VCA+PiAgPDwgRmlsZTogVW50aXRsZWQxID4+IFxwYXINCn0NCgA=

--openmail-part-17f77c37-00000002--
