Message-ID: <3C10846D.1050104@military-inc.com>
From: Jesse Nelson <jnelson@military-inc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Subject: [linux-lvm] lvcreate segfalts 2.4.16 1.0.1-rc4
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
Date: Fri Dec  7 02:38:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@sistina.com

U3RvY2sgMi40LjE2ICBhbmQgMS4wLjEtcmM0IExWTSBydW5pbmcgb24gUmVkSGF0IDcuMiAo
IGVnY3MgMi45Ng0KDQpJIHJlYWQgdGhpcyBwb3N0Og0KaHR0cDovL2xpc3RzLnNpc3RpbmEu
Y29tL3BpcGVybWFpbC9saW51eC1sdm0vMjAwMS1TZXB0ZW1iZXIvMDA4OTgwLmh0bWwNCg0K
QWJvdXQgcmMyIGhhdmluZyBzYW1lIGlzc3VlLg0KSSBjb21waWxlZCBhbmQgcGF0Y2hlZCB3
aXRoIHRoZSBwYXRjaCBtZW50aW9uZWQgaW4gdGhhdCBwb3N0IGFuZCBpdCANCnNlZW1zIHRv
IGJlIHdvcmtpbmcuDQoNCg0KaGVyZXMgdGhlIHN0YWNrIGluZm8gZm9yIHJjNDoNCg0KW3Jv
b3RAdmFkZXIgMS4wLjEtcmMyXSMgZ2RiIGx2Y3JlYXRlDQoJPHNuaXA+DQooZ2RiKSByIC1M
IDE1RyAtbiBkYXRhIHZnRGF0YQ0KU3RhcnRpbmcgcHJvZ3JhbTogL3NiaW4vbHZjcmVhdGUg
LUwgMTVHIC1uIGRhdGEgdmdEYXRhDQoNClByb2dyYW0gcmVjZWl2ZWQgc2lnbmFsIFNJR1NF
R1YsIFNlZ21lbnRhdGlvbiBmYXVsdC4NCmx2X2NyZWF0ZSAodmc9MHg2LCBsdj0weGJmZmZm
YTQ0LA0KICAgICBsdl9uYW1lPTB4YmZmZmZhNjAgDQoiXDIwNvv/v1wyMzb7/7+t+/+/wvv/
v9r7/7/8+/+/XGX8/78n/P+/Mfz/v/T9/79cMDIz/v+/Lf7/v0L+/79Z/v+/ZP7/v3f+/79c
MjA0/v+/XDIxNP7/v1wyMzT+/7+q/v+/uP7/v8n+/7/X/v+/+f7/v1wwMjL//79cMDM1//+/
J///v1r//7/a//+/IikgDQphdCBsdl9jcmVhdGVfcmVtb3ZlLmM6NDINCjQyICAgICAgaW50
IGx2X2NyZWF0ZSAoIHZnX3QgKnZnLCBsdl90ICpsdiwgY2hhciAqbHZfbmFtZSkgew0KKGdk
YikgaW5mbyBzdGFjaw0KIzAgIGx2X2NyZWF0ZSAodmc9MHg2LCBsdj0weGJmZmZmYTQ0LA0K
ICAgICBsdl9uYW1lPTB4YmZmZmZhNjAgDQoiXDIwNvv/v1wyMzb7/7+t+/+/wvv/v9r7/7/8
+/+/XGX8/78n/P+/Mfz/v/T9/79cMDIz/v+/Lf7/v0L+/79Z/v+/ZP7/v3f+/79cMjA0/v+/
XDIxNP7/v1wyMzT+/7+q/v+/uP7/v8n+/7/X/v+/+f7/v1wwMjL//79cMDM1//+/J///v1r/
/7/a//+/IikgDQphdCBsdl9jcmVhdGVfcmVtb3ZlLmM6NDINCiMxICAweDA4MDRiMDNkIGlu
IHN0cmNweSAoKQ0KIzIgIDB4NDAwN2U1MDcgaW4gX19saWJjX3N0YXJ0X21haW4gKG1haW49
MHg4MDQ5MzkwIDxzdHJjcHkrMzg0PiwgYXJnYz02LA0KICAgICB1YnBfYXY9MHhiZmZmZmE0
NCwgaW5pdD0weDgwNDhlODggPF9pbml0PiwgZmluaT0weDgwNGI0ZDAgPF9maW5pPiwNCiAg
ICAgcnRsZF9maW5pPTB4NDAwMGRjMTQgPF9kbF9maW5pPiwgc3RhY2tfZW5kPTB4YmZmZmZh
M2MpDQogICAgIGF0IC4uL3N5c2RlcHMvZ2VuZXJpYy9saWJjLXN0YXJ0LmM6MTI5DQooZ2Ri
KQ0KDQoNCg0KSSB3aWxsIGNvbXBpbGUgd2l0aCBkZWJ1Z2luZyBpZiBpdCB3aWxsIGhlbHAu
DQoNCg0KVGhhbmtzIQ0KLS0gDQpKZXNzZSBOZWxzb24NCg0KDQo=
