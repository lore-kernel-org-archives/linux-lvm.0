From: holger_zecha@hp.com
Date: Tue, 6 Jun 2000 17:44:21 +0200
Message-Id: <H0000aed07d348ed@MHS>
Subject: [linux-lvm] LVM 0.8 and reiser filesystem
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary=openmail-part-17f5e685-00000002
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@msede.com


--openmail-part-17f5e685-00000002
Content-Type: text/plain; charset=ISO-8859-1; name="BDY.RTF"
Content-Disposition: inline; filename="BDY.RTF"
Content-Transfer-Encoding: quoted-printable

Hello,

unfortunately, LVM 0.8final (in the following only called LVM) is not
usable in production environments.
We're thinking about using Linux in SAP mixed environments. Now we use
NT as plattform for applikationservers and HP-UX as database server. We
are doing some tests with Linux as Applikation Server in the near
future.
Are you going to implement mirroring in Linux LVM ? Why is it such a big=

problem to have the root filesystem on a LVM volume ?
There is no easy way to get mirrored disks with LVM, only without LVM,
but there it's not possible to resize partitions.
So we see these two points as big disadvantages:
a) root Filesystem not on LVM
b) no mirroring.

Are there any solutions in the near future ?

Best regards

Holger Zecha

--openmail-part-17f5e685-00000002
Content-Type: application/rtf; name="BDY.RTF"
Content-Disposition: attachment; filename="BDY.RTF"
Content-Transfer-Encoding: base64

e1xydGYxXGFuc2lcYW5zaWNwZzEyNTJcZGVmZjBcZGVmbGFuZzEwMzN7XGZvbnR0Ymx7XGYw
XGZtb2Rlcm5cZmNoYXJzZXQwIENvdXJpZXIgTmV3O319DQpcdmlld2tpbmQ0XHVjMVxwYXJk
XGYwXGZzMjAgSGVsbG8sXHBhcg0KXHBhcg0KdW5mb3J0dW5hdGVseSwgTFZNIDAuOGZpbmFs
IChpbiB0aGUgZm9sbG93aW5nIG9ubHkgY2FsbGVkIExWTSkgaXMgbm90IHVzYWJsZSBpbiBw
cm9kdWN0aW9uIGVudmlyb25tZW50cy5ccGFyDQpXZSdyZSB0aGlua2luZyBhYm91dCB1c2lu
ZyBMaW51eCBpbiBTQVAgbWl4ZWQgZW52aXJvbm1lbnRzLiBOb3cgd2UgdXNlIE5UIGFzIHBs
YXR0Zm9ybSBmb3IgYXBwbGlrYXRpb25zZXJ2ZXJzIGFuZCBIUC1VWCBhcyBkYXRhYmFzZSBz
ZXJ2ZXIuIFdlIGFyZSBkb2luZyBzb21lIHRlc3RzIHdpdGggTGludXggYXMgQXBwbGlrYXRp
b24gU2VydmVyIGluIHRoZSBuZWFyIGZ1dHVyZS5ccGFyDQpBcmUgeW91IGdvaW5nIHRvIGlt
cGxlbWVudCBtaXJyb3JpbmcgaW4gTGludXggTFZNID8gV2h5IGlzIGl0IHN1Y2ggYSBiaWcg
cHJvYmxlbSB0byBoYXZlIHRoZSByb290IGZpbGVzeXN0ZW0gb24gYSBMVk0gdm9sdW1lID9c
cGFyDQpUaGVyZSBpcyBubyBlYXN5IHdheSB0byBnZXQgbWlycm9yZWQgZGlza3Mgd2l0aCBM
Vk0sIG9ubHkgd2l0aG91dCBMVk0sIGJ1dCB0aGVyZSBpdCdzIG5vdCBwb3NzaWJsZSB0byBy
ZXNpemUgcGFydGl0aW9ucy5ccGFyDQpTbyB3ZSBzZWUgdGhlc2UgdHdvIHBvaW50cyBhcyBi
aWcgZGlzYWR2YW50YWdlczpccGFyDQphKSByb290IEZpbGVzeXN0ZW0gbm90IG9uIExWTVxw
YXINCmIpIG5vIG1pcnJvcmluZy5ccGFyDQpccGFyDQpBcmUgdGhlcmUgYW55IHNvbHV0aW9u
cyBpbiB0aGUgbmVhciBmdXR1cmUgP1xwYXINClxwYXINCkJlc3QgcmVnYXJkc1xwYXINClxw
YXINCkhvbGdlciBaZWNoYVxwYXINCn0NCgA=

--openmail-part-17f5e685-00000002--
