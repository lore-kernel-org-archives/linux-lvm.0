Message-ID: <3C1085B0.9010908@military-inc.com>
From: Jesse Nelson <jnelson@military-inc.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvcreate segfalts 2.4.16 1.0.1-rc4
References: <3C10846D.1050104@military-inc.com>
Content-Transfer-Encoding: base64
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
Date: Fri Dec  7 02:43:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@sistina.com

VG8gY2xhcmlmeS4uIEkgY29tcGlsZWQgcmMyIHdpdGggdGhlIHBhdGNoIG1lbnRpb25lZC4N
Cg0KSmVzc2UgTmVsc29uIHdyb3RlOg0KDQo+IFN0b2NrIDIuNC4xNiAgYW5kIDEuMC4xLXJj
NCBMVk0gcnVuaW5nIG9uIFJlZEhhdCA3LjIgKCBlZ2NzIDIuOTYNCj4gDQo+IEkgcmVhZCB0
aGlzIHBvc3Q6DQo+IGh0dHA6Ly9saXN0cy5zaXN0aW5hLmNvbS9waXBlcm1haWwvbGludXgt
bHZtLzIwMDEtU2VwdGVtYmVyLzAwODk4MC5odG1sDQo+IA0KPiBBYm91dCByYzIgaGF2aW5n
IHNhbWUgaXNzdWUuDQo+IEkgY29tcGlsZWQgYW5kIHBhdGNoZWQgd2l0aCB0aGUgcGF0Y2gg
bWVudGlvbmVkIGluIHRoYXQgcG9zdCBhbmQgaXQNCj4gc2VlbXMgdG8gYmUgd29ya2luZy4N
Cj4gDQo+IA0KPiBoZXJlcyB0aGUgc3RhY2sgaW5mbyBmb3IgcmM0Og0KPiANCj4gW3Jvb3RA
dmFkZXIgMS4wLjEtcmMyXSMgZ2RiIGx2Y3JlYXRlDQo+ICAgICAgICAgPHNuaXA+DQo+IChn
ZGIpIHIgLUwgMTVHIC1uIGRhdGEgdmdEYXRhDQo+IFN0YXJ0aW5nIHByb2dyYW06IC9zYmlu
L2x2Y3JlYXRlIC1MIDE1RyAtbiBkYXRhIHZnRGF0YQ0KPiANCj4gUHJvZ3JhbSByZWNlaXZl
ZCBzaWduYWwgU0lHU0VHViwgU2VnbWVudGF0aW9uIGZhdWx0Lg0KPiBsdl9jcmVhdGUgKHZn
PTB4NiwgbHY9MHhiZmZmZmE0NCwNCj4gICAgICBsdl9uYW1lPTB4YmZmZmZhNjANCj4gIlwy
MDb7/79cMjM2+/+/rfv/v8L7/7/a+/+//Pv/v1xl/P+/J/z/vzH8/7/0/f+/XDAyM/7/vy3+
/79C/v+/Wf7/v2T+/793/v+/XDIwNP7/v1wyMTT+/79cMjM0/v+/qv7/v7j+/7/J/v+/1/7/
v/n+/79cMDIy//+/XDAzNf//vyf//79a//+/2v//vyIpIA0KPiANCj4gDQo+IGF0IGx2X2Ny
ZWF0ZV9yZW1vdmUuYzo0Mg0KPiA0MiAgICAgIGludCBsdl9jcmVhdGUgKCB2Z190ICp2Zywg
bHZfdCAqbHYsIGNoYXIgKmx2X25hbWUpIHsNCj4gKGdkYikgaW5mbyBzdGFjaw0KPiAjMCAg
bHZfY3JlYXRlICh2Zz0weDYsIGx2PTB4YmZmZmZhNDQsDQo+ICAgICAgbHZfbmFtZT0weGJm
ZmZmYTYwDQo+ICJcMjA2+/+/XDIzNvv/v637/7/C+/+/2vv/v/z7/79cZfz/vyf8/78x/P+/
9P3/v1wwMjP+/78t/v+/Qv7/v1n+/79k/v+/d/7/v1wyMDT+/79cMjE0/v+/XDIzNP7/v6r+
/7+4/v+/yf7/v9f+/7/5/v+/XDAyMv//v1wwMzX//78n//+/Wv//v9r//78iKSANCj4gDQo+
IA0KPiBhdCBsdl9jcmVhdGVfcmVtb3ZlLmM6NDINCj4gIzEgIDB4MDgwNGIwM2QgaW4gc3Ry
Y3B5ICgpDQo+ICMyICAweDQwMDdlNTA3IGluIF9fbGliY19zdGFydF9tYWluIChtYWluPTB4
ODA0OTM5MCA8c3RyY3B5KzM4ND4sIGFyZ2M9NiwNCj4gICAgICB1YnBfYXY9MHhiZmZmZmE0
NCwgaW5pdD0weDgwNDhlODggPF9pbml0PiwgZmluaT0weDgwNGI0ZDAgPF9maW5pPiwNCj4g
ICAgICBydGxkX2Zpbmk9MHg0MDAwZGMxNCA8X2RsX2Zpbmk+LCBzdGFja19lbmQ9MHhiZmZm
ZmEzYykNCj4gICAgICBhdCAuLi9zeXNkZXBzL2dlbmVyaWMvbGliYy1zdGFydC5jOjEyOQ0K
PiAoZ2RiKQ0KPiANCj4gDQo+IA0KPiBJIHdpbGwgY29tcGlsZSB3aXRoIGRlYnVnaW5nIGlm
IGl0IHdpbGwgaGVscC4NCj4gDQo+IA0KPiBUaGFua3MhDQo+IC0tIA0KPiBKZXNzZSBOZWxz
b24NCj4gDQo+IA0KPiAtKe7GW+YodG0pqKU/eCU/y2U/e7Et+aw/y2I/pyg/G22n/+U/y2yy
Ky0/dm9lom/mailmaj/lP8tiP/o/LSnuxlvmreY/thc/VMHOWTM/thttp//wwwsistinacom
/lvm/PYges/howtoP9mlDQo+IA0KDQoNCg0KLS0gDQpKZXNzZSBOZWxzb24NCg0KDQo=
