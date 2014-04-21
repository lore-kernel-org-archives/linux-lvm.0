Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s3L9x6G6006920
	for <linux-lvm@redhat.com>; Mon, 21 Apr 2014 05:59:06 -0400
Received: from mail-ob0-f172.google.com (mail-ob0-f172.google.com
	[209.85.214.172])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s3L9x5Qi028616
	for <linux-lvm@redhat.com>; Mon, 21 Apr 2014 05:59:05 -0400
Received: by mail-ob0-f172.google.com with SMTP id wo20so4086113obc.31
	for <linux-lvm@redhat.com>; Mon, 21 Apr 2014 02:59:05 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 21 Apr 2014 11:59:05 +0200
Message-ID: <CACrcyfLmRgPhWKiGq-vhfR93byActmHeTMx9pNK5KeCP_m7tCA@mail.gmail.com>
From: =?UTF-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Content-Type: multipart/alternative; boundary=089e0158a836b82bbc04f78a8c0b
Subject: [linux-lvm] HOWTO: create a thick logical snapshot from C
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

--089e0158a836b82bbc04f78a8c0b
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I want to create the snapshot like this command, but from C.

lvcreate -s -c 512k -n snap -L 1G testvg/lvol1

Just to try; I compiled this program, but it can't resolve the references
-------
#include "lvm2app.h"

int snaplv(char *vgname, char *lvname)
{
        int rc;
        lvm_t handle;
        vg_t vg;
        lv_t lv;
        lv_t lvsnap;
        char msg[200];
        char *snap_name=3D"snap";
        struct lvm_lv_create_params *lvcp =3D NULL;
        uint64_t max_snap_size =3D 1*1024*1024*1024;

        handle =3D lvm_init(NULL);

        if(!handle)
                return -1;

        vg =3D lvm_vg_open(handle, vgname, "r", 0);
        if(!vg && lvm_errno(handle))
        {
                lvm_quit(handle);
                return -1;
        }

        lv =3D lvm_lv_from_name(vg, lvname);
        if(!lv)
        {
                lvm_vg_close(vg);
                lvm_quit(handle);

                return -1;
        }

        lvsnap =3D lvm_lv_snapshot(lv, strdup(snap_name), max_snap_size);
        lvm_vg_close(vg);
        lvm_quit(handle);

        return 0;
}

void main(void)
{
        snaplv("testvg","test");
}
--------------------------------
Compiling gives error

[root@centos64 ~]# gcc -llvm2app snaplv.c
snaplv.c: In function =E2=80=98snaplv=E2=80=99:
snaplv.c:36: warning: assignment makes pointer from integer without a cast
/tmp/ccvgg1K0.o: In function `snaplv':
snaplv.c:(.text+0x105): undefined reference to `lvm_lv_snapshot'
collect2: ld returned 1 exit status
[root@centos64 ~]#

-----------------------------

Can anyone share an idea how to do this from C; without using system()

Regards Tomas

--089e0158a836b82bbc04f78a8c0b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdj48ZGl2PjxkaXY+PGRpdj48ZGl2PkhpLDxicj48YnI+PC9kaXY+
SSB3YW50IHRvIGNyZWF0ZSB0aGUgc25hcHNob3QgbGlrZSB0aGlzIGNvbW1hbmQsIGJ1dCBmcm9t
IEMuPGJyPjxicj48L2Rpdj5sdmNyZWF0ZSAtcyAtYyA1MTJrIC1uIHNuYXAgLUwgMUcgdGVzdHZn
L2x2b2wxPGJyPjxicj48L2Rpdj5KdXN0IHRvIHRyeTsgSSBjb21waWxlZCB0aGlzIHByb2dyYW0s
IGJ1dCBpdCBjYW4mIzM5O3QgcmVzb2x2ZSB0aGUgcmVmZXJlbmNlczxicj4NCi0tLS0tLS08YnI+
I2luY2x1ZGUgJnF1b3Q7bHZtMmFwcC5oJnF1b3Q7PGJyPjxicj5pbnQgc25hcGx2KGNoYXIgKnZn
bmFtZSwgY2hhciAqbHZuYW1lKTxicj57PGJyPsKgwqDCoMKgwqDCoMKgIGludCByYzs8YnI+wqDC
oMKgwqDCoMKgwqAgbHZtX3QgaGFuZGxlOzxicj7CoMKgwqDCoMKgwqDCoCB2Z190IHZnOzxicj7C
oMKgwqDCoMKgwqDCoCBsdl90IGx2Ozxicj7CoMKgwqDCoMKgwqDCoCBsdl90IGx2c25hcDs8YnI+
wqDCoMKgwqDCoMKgwqAgY2hhciBtc2dbMjAwXTs8YnI+DQrCoMKgwqDCoMKgwqDCoCBjaGFyICpz
bmFwX25hbWU9JnF1b3Q7c25hcCZxdW90Ozs8YnI+wqDCoMKgwqDCoMKgwqAgc3RydWN0IGx2bV9s
dl9jcmVhdGVfcGFyYW1zICpsdmNwID0gTlVMTDs8YnI+wqDCoMKgwqDCoMKgwqAgdWludDY0X3Qg
bWF4X3NuYXBfc2l6ZSA9IDEqMTAyNCoxMDI0KjEwMjQ7PGJyPjxicj7CoMKgwqDCoMKgwqDCoCBo
YW5kbGUgPSBsdm1faW5pdChOVUxMKTs8YnI+PGJyPsKgwqDCoMKgwqDCoMKgIGlmKCFoYW5kbGUp
PGJyPsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLTE7PGJyPg0KPGJyPsKg
wqDCoMKgwqDCoMKgIHZnID0gbHZtX3ZnX29wZW4oaGFuZGxlLCB2Z25hbWUsICZxdW90O3ImcXVv
dDssIDApOzxicj7CoMKgwqDCoMKgwqDCoCBpZighdmcgJmFtcDsmYW1wOyBsdm1fZXJybm8oaGFu
ZGxlKSk8YnI+wqDCoMKgwqDCoMKgwqAgezxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgbHZtX3F1aXQoaGFuZGxlKTs8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJl
dHVybiAtMTs8YnI+wqDCoMKgwqDCoMKgwqAgfTxicj48YnI+wqDCoMKgwqDCoMKgwqAgbHYgPSBs
dm1fbHZfZnJvbV9uYW1lKHZnLCBsdm5hbWUpOzxicj4NCsKgwqDCoMKgwqDCoMKgIGlmKCFsdik8
YnI+wqDCoMKgwqDCoMKgwqAgezxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbHZt
X3ZnX2Nsb3NlKHZnKTs8YnI+wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGx2bV9xdWl0
KGhhbmRsZSk7PGJyPjxicj7CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC0x
Ozxicj7CoMKgwqDCoMKgwqDCoCB9PGJyPjxicj7CoMKgwqDCoMKgwqDCoCBsdnNuYXAgPSBsdm1f
bHZfc25hcHNob3QobHYsIHN0cmR1cChzbmFwX25hbWUpLCBtYXhfc25hcF9zaXplKTs8YnI+DQrC
oMKgwqDCoMKgwqDCoCBsdm1fdmdfY2xvc2UodmcpOzxicj7CoMKgwqDCoMKgwqDCoCBsdm1fcXVp
dChoYW5kbGUpOzxicj48YnI+wqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7PGJyPn08YnI+PGJyPnZv
aWQgbWFpbih2b2lkKTxicj57PGJyPsKgwqDCoMKgwqDCoMKgIHNuYXBsdigmcXVvdDt0ZXN0dmcm
cXVvdDssJnF1b3Q7dGVzdCZxdW90Oyk7PGJyPn08YnI+LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS08YnI+Q29tcGlsaW5nIGdpdmVzIGVycm9yPGJyPg0KPGJyPltyb290QGNlbnRvczY0
IH5dIyBnY2MgLWxsdm0yYXBwIHNuYXBsdi5jPGJyPnNuYXBsdi5jOiBJbiBmdW5jdGlvbiDigJhz
bmFwbHbigJk6PGJyPnNuYXBsdi5jOjM2OiB3YXJuaW5nOiBhc3NpZ25tZW50IG1ha2VzIHBvaW50
ZXIgZnJvbSBpbnRlZ2VyIHdpdGhvdXQgYSBjYXN0PGJyPi90bXAvY2N2Z2cxSzAubzogSW4gZnVu
Y3Rpb24gYHNuYXBsdiYjMzk7Ojxicj48c3BhbiBzdHlsZT0iY29sb3I6cmdiKDI1NSwwLDApIj5z
bmFwbHYuYzooLnRleHQrMHgxMDUpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBsdm1fbHZfc25h
cHNob3QmIzM5Ozwvc3Bhbj48YnI+DQpjb2xsZWN0MjogbGQgcmV0dXJuZWQgMSBleGl0IHN0YXR1
czxicj5bcm9vdEBjZW50b3M2NCB+XSM8YnI+PGJyPi0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tPGJyPjxicj48L2Rpdj5DYW4gYW55b25lIHNoYXJlIGFuIGlkZWEgaG93IHRvIGRvIHRoaXMg
ZnJvbSBDOyB3aXRob3V0IHVzaW5nIHN5c3RlbSgpPGJyPjxicj48L2Rpdj5SZWdhcmRzIFRvbWFz
PGJyPjwvZGl2Pg0K
--089e0158a836b82bbc04f78a8c0b--
