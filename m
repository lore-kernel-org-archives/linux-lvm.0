Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s8UDQnib021360
	for <linux-lvm@redhat.com>; Tue, 30 Sep 2014 09:26:49 -0400
Received: from mail-we0-f182.google.com (mail-we0-f182.google.com
	[74.125.82.182])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s8UDQhhR011265
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Tue, 30 Sep 2014 09:26:46 -0400
Received: by mail-we0-f182.google.com with SMTP id x48so3855246wes.27
	for <linux-lvm@redhat.com>; Tue, 30 Sep 2014 06:26:43 -0700 (PDT)
MIME-Version: 1.0
Sender: vase@selfip.ru
From: Vasiliy Tolstov <v.tolstov@selfip.ru>
Date: Tue, 30 Sep 2014 17:26:28 +0400
Message-ID: <CACaajQu+i6wu1z86wzWa-x=HN_wWy6ByZBnLHzPy7E5Etpj6jw@mail.gmail.com>
Subject: [linux-lvm] thin pool and discards
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM <linux-lvm@redhat.com>

Hello. I'm try to check that discard are working. I have thin volume
1031 (used by virtual machine)
I'm fill the disc and delete data, (fs ext4 with discard option) after
that i manually run fstrim -v /
but data on thin volume not reclaimed.

  LV      VG   Attr       LSize   Pool Origin Data%  Move Log Cpy%Sync Convert
  tp0     vg0  twi-a-tz-- 445.00g               0.00
  373_153 vg1  Vwi---tz-k  20.00g tp1
  375_151 vg1  Vwi---tz-k  40.00g tp1
  529_217 vg1  Vwi---tz-k  40.00g tp1
  531_221 vg1  Vwi---tz-k  20.00g tp1
  533_219 vg1  Vwi---tz-k  40.00g tp1
  577_305 vg1  Vwi---tz-k  40.00g tp1
  581_309 vg1  Vwi---tz-k  40.00g tp1
  583_307 vg1  Vwi---tz-k  20.00g tp1
  tp1     vg1  twi-a-tz-- 445.00g               0.50
  377_159 vg2  Vwi---tz-k  20.00g tp2
  445_197 vg2  Vwi---tz-k  20.00g tp2
  tp2     vg2  twi-a-tz-- 445.00g               0.25
  1031    vg3  Vwi-aotz--  20.00g tp3          56.23
  tp3     vg3  twi-a-tz-- 445.00g               2.53
  tp4     vg4  twi-a-tz-- 445.00g               0.00
  111     vg5  Vwi-aotz--  20.00g tp5           5.63
  111_23  vg5  Vwi---tz-k  20.00g tp5  111
  111_71  vg5  Vwi---tz-k  20.00g tp5  111
  13      vg5  Vwi-aotz--  30.00g tp5           4.70
  17      vg5  Vwi-aotz--  20.00g tp5          25.58
  29      vg5  Vwi-a-tz--  20.00g tp5           0.00
  31      vg5  Vwi-a-tz--  20.00g tp5           0.00
  33      vg5  Vwi-a-tz--  20.00g tp5           0.00
  35      vg5  Vwi-a-tz--  20.00g tp5           0.00
  75      vg5  Vwi-aotz--  20.00g tp5          25.58
  tp5     vg5  twi-a-tz-- 445.00g               2.92

lvm - 2.02.106
kernel 3.10

-- 
Vasiliy Tolstov,
e-mail: v.tolstov@selfip.ru
jabber: vase@selfip.ru
