Message-ID: <389704AA.5696F9C4@ep-ag.com>
Date: Tue, 01 Feb 2000 17:07:06 +0100
From: Klaus Strebel <stb@ep-ag.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Reduced dependecies for /root on lvm
References: <389581F1.FC558D26@ep-ag.com> <20000131153248.A9022@gruyere.muc.suse.de>
Content-Type: multipart/mixed;
 boundary="------------801E38E5D5707CDDAC798EFC"
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: Andi Kleen <ak@suse.de>
Cc: linux-lvm@msede.com

This is a multi-part message in MIME format.
--------------801E38E5D5707CDDAC798EFC
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Andi Kleen wrote:
> 
> On Mon, Jan 31, 2000 at 01:37:05PM +0100, Klaus Strebel wrote:
> > Comments and bugreports are welcome.
> 
> I don't think it will work with sub directories. dp->d_type
> is normally DT_UNKNOWN on all Linux systems, libc5 dirent
> does not even have that field. Please use a fstat.
Well, i think your're right. Made i tiny small test proggy. But the new
lvm_rm_rf.c does it (now tested with several dirs including subdirs and
files and s.o.).

Ciao
Klaus
-- 
Klaus Strebel
stb@ep-ag.com
EIGNER + PARTNER AG   - The Engineering Warehouse Company -
<http://www.ep-ag.com>
-----------------------------------------------------------------------
--------------801E38E5D5707CDDAC798EFC
Content-Type: application/octet-stream;
 name="lvm_rm_rf.c"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="lvm_rm_rf.c"

LyoKICogdG9vbHMvbGliL2x2bV9ybV9yZi5jCiAqCiAqIENvcHlyaWdodCAoQykgIDIwMDAg
IEtsYXVzIFN0cmViZWwsIEdlcm1hbnkKICoKICogSmFudXJ5IDIwMDAKICoKICoKICogVGhp
cyBMVk0gbGlicmFyeSBpcyBmcmVlIHNvZnR3YXJlOyB5b3UgY2FuIHJlZGlzdHJpYnV0ZSBp
dCBhbmQvb3IKICogbW9kaWZ5IGl0IHVuZGVyIHRoZSB0ZXJtcyBvZiB0aGUgR05VIExpYnJh
cnkgR2VuZXJhbCBQdWJsaWMKICogTGljZW5zZSBhcyBwdWJsaXNoZWQgYnkgdGhlIEZyZWUg
U29mdHdhcmUgRm91bmRhdGlvbjsgZWl0aGVyCiAqIHZlcnNpb24gMiBvZiB0aGUgTGljZW5z
ZSwgb3IgKGF0IHlvdXIgb3B0aW9uKSBhbnkgbGF0ZXIgdmVyc2lvbi4KICoKICogVGhpcyBM
Vk0gbGlicmFyeSBpcyBkaXN0cmlidXRlZCBpbiB0aGUgaG9wZSB0aGF0IGl0IHdpbGwgYmUg
dXNlZnVsLAogKiBidXQgV0lUSE9VVCBBTlkgV0FSUkFOVFk7IHdpdGhvdXQgZXZlbiB0aGUg
aW1wbGllZCB3YXJyYW50eSBvZgogKiBNRVJDSEFOVEFCSUxJVFkgb3IgRklUTkVTUyBGT1Ig
QSBQQVJUSUNVTEFSIFBVUlBPU0UuICBTZWUgdGhlIEdOVQogKiBMaWJyYXJ5IEdlbmVyYWwg
UHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KICoKICogWW91IHNob3VsZCBoYXZl
IHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIExpYnJhcnkgR2VuZXJhbCBQdWJsaWMKICog
TGljZW5zZSBhbG9uZyB3aXRoIHRoaXMgTFZNIGxpYnJhcnk7IGlmIG5vdCwgd3JpdGUgdG8g
dGhlIEZyZWUKICogU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLiwgNTkgVGVtcGxlIFBsYWNl
IC0gU3VpdGUgMzMwLCBCb3N0b24sCiAqIE1BIDAyMTExLTEzMDcsIFVTQQogKgogKi8KCiNp
bmNsdWRlIDxsaWJsdm0uaD4KCiNpbmNsdWRlIDxkaXJlbnQuaD4KCmludCBsdm1fcm1fcmYg
KGNoYXIgKmRpcm5hbWUpCnsKCURJUiAqZGlyX3BvaW50ZXI7CglzdHJ1Y3QgZGlyZW50ICpk
cDsKCWludCBteV9lcnI9MDsKICAgICAgICBjaGFyICppbmRpcm5hbWVfYnVmZmVyOyAvKiBX
aXRob3V0IGJ1ZmZlcmluZyBvZiBwYXJtLCB0aGUgcmVjdXJzaW9uIHNlZ2ZhdWx0cyBhdCB0
aGUgMy4gbGV2ZWwhICovCiAgICAgICAgY2hhciAqZGlybmFtZV9idWZmZXI7CgoJaWYgKGRp
cm5hbWUgIT0gTlVMTCAmJiBzdHJsZW4oZGlybmFtZSkgPiAwKQoJewkKCQlpbmRpcm5hbWVf
YnVmZmVyID0gbWFsbG9jKHN0cmxlbihkaXJuYW1lKSsyKTsKCQlzcHJpbnRmKGluZGlybmFt
ZV9idWZmZXIsICIlcyVjIiwgZGlybmFtZSwgMCk7CgkJaWYgKHVubGluayhpbmRpcm5hbWVf
YnVmZmVyKSA9PSAwKSB7CgkJCWZyZWUoaW5kaXJuYW1lX2J1ZmZlcik7CgkJCXJldHVybiAw
OwoJCX0KCQlpZiAoZXJybm8gIT0gRUlTRElSKSB7CgkJCW15X2VyciA9IGVycm5vOwoJCQlm
cHJpbnRmKHN0ZGVyciwgImx2bV9ybV9yZjogRVJST1IgdW5saW5raW5nIDwlcz46JWxkXG4i
LCBpbmRpcm5hbWVfYnVmZmVyLG15X2Vycik7CgkJCWZyZWUoaW5kaXJuYW1lX2J1ZmZlcik7
CgkJCXJldHVybiBteV9lcnI7CgkJfQoJCWRpcl9wb2ludGVyID0gb3BlbmRpcihpbmRpcm5h
bWVfYnVmZmVyKTsKCQlmb3IgKGRwID0gcmVhZGRpcihkaXJfcG9pbnRlcik7IGRwICE9IE5V
TEw7IAoJCSAgICAgZHAgPSByZWFkZGlyKGRpcl9wb2ludGVyKSkgewoJCQlkaXJuYW1lX2J1
ZmZlciA9IG1hbGxvYyhzdHJsZW4oaW5kaXJuYW1lX2J1ZmZlcikrc3RybGVuKGRwLT5kX25h
bWUpKzIpOwoJCQlzcHJpbnRmKGRpcm5hbWVfYnVmZmVyLCAiJXMvJXMlYyIsIGluZGlybmFt
ZV9idWZmZXIsIGRwLT5kX25hbWUsIDApOwoKCQkJaWYgKChzdHJjbXAoZHAtPmRfbmFtZSwg
Ii4iKSAhPSAwKSAmJiAoc3RyY21wKGRwLT5kX25hbWUsICIuLiIpICE9IDApKSB7CgkJCQlp
ZiAodW5saW5rKGRpcm5hbWVfYnVmZmVyKSAhPSAwKSB7CgoJCQkJCWlmIChlcnJubyA9PSBF
SVNESVIpIHsKCQkJCQkJbXlfZXJyPWx2bV9ybV9yZiAoZGlybmFtZV9idWZmZXIpOwoJCQkJ
CX0KCQkJCQllbHNlIHsKCQkJCQkJbXlfZXJyPWVycm5vOwoJCQkJCQlmcHJpbnRmKHN0ZGVy
ciwgImx2bV9ybV9yZjogRVJST1IgdW5saW5raW5nIDwlcz46JWxkXG4iLCBkaXJuYW1lX2J1
ZmZlcixteV9lcnIpOwoJCQkJCX0KCQkJCX0KCQkJfQoJCQlmcmVlKGRpcm5hbWVfYnVmZmVy
KTsKCQl9CQoJCWNsb3NlZGlyKGRpcl9wb2ludGVyKTsKICAgICAgICAgICAgICAgIGlmICht
eV9lcnIgPT0gMCkgCgkJCW15X2VyciA9IHJtZGlyKGluZGlybmFtZV9idWZmZXIpOwoJCWZy
ZWUoaW5kaXJuYW1lX2J1ZmZlcik7CgkJcmV0dXJuIG15X2VycjsKCX0JCiAgICAgICAgcmV0
dXJuIDA7Cn0JCg==
--------------801E38E5D5707CDDAC798EFC--
