Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD0F12E7E
	for <linux-lvm@lists.linux.dev>; Sat, 11 Jan 2025 22:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736634095; cv=none; b=D7hwYrhT8L/5Kl9NkUTtFe2YtAoo2t1q6huUaGwOx1A/ldorLcD8xF5uo1EB49iTD8BK3Pr7PHxdwD84mEIPmkz8Gb3j/i86V+ZKvMoJo+/FBM2wGKmiPBA+Oki9vuF7nwTiAi97Atb0BfvJuGeR6hA4c3L4LbBUp8Lnx1rRkV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736634095; c=relaxed/simple;
	bh=e5knzfn69MCEVIQJBOaIJUzRnC6e/MoXnidDb8NGNwU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=m6Yxl2sewf340hBNbU5cTDxdWZnwheSD7jU3CN4TiZ2eCRGGPtbhHFYV21spx05uWF7vXveWnHdTee/8HpvU/BSxTH+s1cWrVebcC9FdyE4TAm4nzc8J+gk+K+z0DO5wYOg7Ku9eMYdVw+67Rhi8opqfBh34eGl1e3fpgmbUQq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I/52w+Xu; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/52w+Xu"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-5f6497fbccbso2160473eaf.0
        for <linux-lvm@lists.linux.dev>; Sat, 11 Jan 2025 14:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736634092; x=1737238892; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3L9XSO2ebHt8ADCKssjUKaBWxli/EM8fylC0OkH6bm4=;
        b=I/52w+Xupi21ItNEigRGlz6UMBdliWgTM9uI9x0WaZEcbai8logEloTfiP7xhb6tpT
         33OX2cydw29ftmo2q4VVdRG9ounm7o029q0p6slZJYrfEb0FaaXOkotVkmf1c/SXQsvX
         19gzONEcsFhIHZPkSvMk4WGTddy6hIa5U4egXlAGNPU5akf2B9lsf73P9hHN4nceXtnI
         F2YyLyv2ZKTuVxJ/lnSDlyl4vKp+rBZofmeQq65L601NEqigrOw4IsGAxDmI80NVkyFI
         /ULyyXLM30tPtJEM53wlI42ADhGpH3W/+aw31bjxJodQqsJOp2GdIfwI0YEVy3WucEH1
         rUXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736634092; x=1737238892;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3L9XSO2ebHt8ADCKssjUKaBWxli/EM8fylC0OkH6bm4=;
        b=S6aUGtYkrlJfT7IxKQnOWU6dXgMplnB1prMcC5zLADEvQJA7U0gF6i23NBaE2WvRkY
         chNZUHkIPkOZulz5QXaRJeCJ9clIIXaHxTX7APVGvsZFleiWi25arrdsJWPsymw1Okwr
         JObXHikgCdTnmRUGojVym/tcPjBAarn1QmT/hzvuLKdHR9h7hFjmdZv2VVBO+/HHlANl
         8VW2/ZBb9/eC19zSQc+CQxeLI1hNOilR16ybvoMud+LEWmpZ6IdNLH1+Bpt8iTo+Ienv
         MKnly2SS12wLhSF8kU/tcw7Dx0DBOc8shVvdJOmrl7ZnPvzJF31ozoqWvDwbaiK+e9Wj
         AXKw==
X-Gm-Message-State: AOJu0YzUCcKbjBpbzqev+umotIeONdFKZj5K4hwiys3XHo3CVXYHc1Fb
	t6Mv7xkfCy56kTz5T/TuopUBy6eyTX0ufPQnGsrYskUs1xqXGA2jfttqhwwm6CxeudzY3HvI/XL
	WxscPa9cPYcajIgh7oXGbTlrQChWmCTax6QM=
X-Gm-Gg: ASbGncv3Gu0v3eJgG1+uLbpJiYc6qP7t9kpQk0TULuKATQ3a24jCAy4mRvPgF046FoV
	qPqFNW1lbXPAJsPm9X+KWDrZ+ePFpJbSoDCPrir2j8EGpl57UWsS8CwI5xSEPqkHf148a
X-Google-Smtp-Source: AGHT+IHIjzC+Rf8tF+f5fzeuqDhBqCUXgQKLq7y56mDBtbpwfIUVHlJtdIF3/MXrQIrTMtGl9sjwKDGKrtnB95EXEc4=
X-Received: by 2002:a05:6870:b9c4:b0:29f:b645:ce86 with SMTP id
 586e51a60fabf-2aae5aa8daemr6989714fac.12.1736634092138; Sat, 11 Jan 2025
 14:21:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Tilman Vogel <tilman.vogel@gmail.com>
Date: Sat, 11 Jan 2025 23:21:15 +0100
X-Gm-Features: AbW1kvYflSo0WB5JEig4K939z1TGHd8cf92u_Gr1GQM1n9034AHNdu1T22G_aqw
Message-ID: <CAAbQbbCN-=DDSerkOoKHCHxwA9gu32HvsCezOHU4NhR0cByKpA@mail.gmail.com>
Subject: pvresize after pvcreate changes PV size: expected?
To: linux-lvm@lists.linux.dev
Content-Type: multipart/mixed; boundary="0000000000002b059a062b75a2ee"

--0000000000002b059a062b75a2ee
Content-Type: multipart/alternative; boundary="0000000000002b0599062b75a2ec"

--0000000000002b0599062b75a2ec
Content-Type: text/plain; charset="UTF-8"

Hi!

I just encountered the following and do not understand it. The confusing
part is that when I run pvresize without size parameter directly after
pvcreate, the size still seems to change even though pvcreate of course
also uses the underlying device size just as pvresize should.

I am attaching the test.sh for your reference.

What am I missing?

Tilman

# ./test.sh
+ set -o errexit
+ truncate -s 100M image
++ losetup --show -f image
+ LOOP=/dev/loop0
+ echo 'LOOP /dev/loop0'
LOOP /dev/loop0
+ pvcreate /dev/loop0
 Physical volume "/dev/loop0" successfully created.
 Not creating system devices file due to existing VGs.
+ vgcreate test /dev/loop0
 Not creating system devices file due to existing VGs.
 Volume group "test" successfully created
+ pvdisplay --units b /dev/loop0
 --- Physical volume ---
 PV Name               /dev/loop0
 VG Name               test
 PV Size               104857600 B  / not usable 4194304 B
 Allocatable           yes
 PE Size               4194304 B
 Total PE              24
 Free PE               24
 Allocated PE          0
 PV UUID               zNLgIe-S8Zq-1DF5-0BhR-oGGS-q9Vy-FzNnoT

+ pvs --units b -o pv_all /dev/loop0
 Fmt  PV UUID                                DevSize    PV         Maj Min
PMdaFree  PMdaSize  PExtVsn 1st PE   PSize      PFree      Used Attr
Allocatable Exported   Missing    PE  Alloc PV Tags #PMda #PMdaUse BA Start
BA Size PInUse Duplicate DeviceID DeviceIDType
 lvm2 zNLgIe-S8Zq-1DF5-0BhR-oGGS-q9Vy-FzNnoT 104857600B /dev/loop0   7   0
  520704B  1044480B       2 1048576B 100663296B 100663296B   0B a--
 allocatable                        24     0             1        1
      0B      0B   used
+ echo RESIZE
RESIZE
+ pvresize /dev/loop0
 Physical volume "/dev/loop0" changed
 1 physical volume(s) resized or updated / 0 physical volume(s) not resized
+ pvdisplay --units b /dev/loop0
 --- Physical volume ---
 PV Name               /dev/loop0
 VG Name               test
 PV Size               103809024 B  / not usable 3145728 B
 Allocatable           yes
 PE Size               4194304 B
 Total PE              24
 Free PE               24
 Allocated PE          0
 PV UUID               zNLgIe-S8Zq-1DF5-0BhR-oGGS-q9Vy-FzNnoT

+ pvs --units b -o pv_all /dev/loop0
 Fmt  PV UUID                                DevSize    PV         Maj Min
PMdaFree  PMdaSize  PExtVsn 1st PE   PSize      PFree      Used Attr
Allocatable Exported   Missing    PE  Alloc PV Tags #PMda #PMdaUse BA Start
BA Size PInUse Duplicate DeviceID DeviceIDType
 lvm2 zNLgIe-S8Zq-1DF5-0BhR-oGGS-q9Vy-FzNnoT 104857600B /dev/loop0   7   0
  520704B  1044480B       2 1048576B 100663296B 100663296B   0B a--
 allocatable                        24     0             1        1
      0B      0B   used
+ echo CLEANUP
CLEANUP
+ vgremove test
 Volume group "test" successfully removed
+ pvremove /dev/loop0
 Labels on physical volume "/dev/loop0" successfully wiped.
+ losetup -d /dev/loop0

--0000000000002b0599062b75a2ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdj5IaSE8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkkganVzdCBl
bmNvdW50ZXJlZCB0aGUgZm9sbG93aW5nIGFuZCBkbyBub3QgdW5kZXJzdGFuZCBpdC4gVGhlIGNv
bmZ1c2luZyBwYXJ0IGlzIHRoYXQgd2hlbiBJIHJ1biBwdnJlc2l6ZSB3aXRob3V0IHNpemUgcGFy
YW1ldGVyIGRpcmVjdGx5IGFmdGVyIHB2Y3JlYXRlLCB0aGUgc2l6ZSBzdGlsbCBzZWVtcyB0byBj
aGFuZ2UgZXZlbiB0aG91Z2ggcHZjcmVhdGUgb2YgY291cnNlIGFsc28gdXNlcyB0aGUgdW5kZXJs
eWluZyBkZXZpY2Ugc2l6ZSBqdXN0IGFzIHB2cmVzaXplIHNob3VsZC48L2Rpdj48ZGl2Pjxicj48
L2Rpdj48ZGl2PkkgYW0gYXR0YWNoaW5nIHRoZSB0ZXN0LnNoIGZvciB5b3VyIHJlZmVyZW5jZS48
L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PldoYXQgYW0gSSBtaXNzaW5nPzwvZGl2PjxkaXY+PGJy
PjwvZGl2PjxkaXY+VGlsbWFuPGJyPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PHNwYW4gc3R5
bGU9ImZvbnQtZmFtaWx5Om1vbm9zcGFjZSI+PHNwYW4gc3R5bGU9ImZvbnQtd2VpZ2h0OmJvbGQ7
Y29sb3I6cmdiKDI1NSw4NCw4NCk7YmFja2dyb3VuZC1jb2xvcjpyZ2IoMjU1LDI1NSwyNTUpIj4j
PC9zcGFuPjxzcGFuIHN0eWxlPSJjb2xvcjpyZ2IoMCwwLDApO2JhY2tncm91bmQtY29sb3I6cmdi
KDI1NSwyNTUsMjU1KSI+IC4vdGVzdC5zaCDCoDwvc3Bhbj48YnI+KyBzZXQgLW8gZXJyZXhpdA0K
PGJyPisgdHJ1bmNhdGUgLXMgMTAwTSBpbWFnZQ0KPGJyPisrIGxvc2V0dXAgLS1zaG93IC1mIGlt
YWdlDQo8YnI+KyBMT09QPS9kZXYvbG9vcDANCjxicj4rIGVjaG8gJiMzOTtMT09QIC9kZXYvbG9v
cDAmIzM5Ow0KPGJyPkxPT1AgL2Rldi9sb29wMA0KPGJyPisgcHZjcmVhdGUgL2Rldi9sb29wMA0K
PGJyPiDCoFBoeXNpY2FsIHZvbHVtZSAmcXVvdDsvZGV2L2xvb3AwJnF1b3Q7IHN1Y2Nlc3NmdWxs
eSBjcmVhdGVkLg0KPGJyPiDCoE5vdCBjcmVhdGluZyBzeXN0ZW0gZGV2aWNlcyBmaWxlIGR1ZSB0
byBleGlzdGluZyBWR3MuDQo8YnI+KyB2Z2NyZWF0ZSB0ZXN0IC9kZXYvbG9vcDANCjxicj4gwqBO
b3QgY3JlYXRpbmcgc3lzdGVtIGRldmljZXMgZmlsZSBkdWUgdG8gZXhpc3RpbmcgVkdzLg0KPGJy
PiDCoFZvbHVtZSBncm91cCAmcXVvdDt0ZXN0JnF1b3Q7IHN1Y2Nlc3NmdWxseSBjcmVhdGVkDQo8
YnI+KyBwdmRpc3BsYXkgLS11bml0cyBiIC9kZXYvbG9vcDANCjxicj4gwqAtLS0gUGh5c2ljYWwg
dm9sdW1lIC0tLQ0KPGJyPiDCoFBWIE5hbWUgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC9k
ZXYvbG9vcDANCjxicj4gwqBWRyBOYW1lIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB0ZXN0
DQo8YnI+IMKgUFYgU2l6ZSDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgMTA0ODU3NjAwIEIg
wqAvIG5vdCB1c2FibGUgNDE5NDMwNCBCIMKgPGJyPiDCoEFsbG9jYXRhYmxlIMKgwqDCoMKgwqDC
oMKgwqDCoMKgeWVzIMKgPGJyPiDCoFBFIFNpemUgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oDQxOTQzMDQgQiDCoDxicj4gwqBUb3RhbCBQRSDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDI0
DQo8YnI+IMKgRnJlZSBQRSDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgMjQNCjxicj4gwqBB
bGxvY2F0ZWQgUEUgwqDCoMKgwqDCoMKgwqDCoMKgMA0KPGJyPiDCoFBWIFVVSUQgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHpOTGdJZS1TOFpxLTFERjUtMEJoUi1vR0dTLXE5VnktRnpObm9U
DQo8YnI+IMKgwqDCoDxicj4rIHB2cyAtLXVuaXRzIGIgLW8gcHZfYWxsIC9kZXYvbG9vcDANCjxi
cj4gwqBGbXQgwqBQViBVVUlEIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgRGV2U2l6ZSDCoMKgwqBQViDCoMKgwqDCoMKgwqDCoMKg
TWFqIE1pbiBQTWRhRnJlZSDCoFBNZGFTaXplIMKgUEV4dFZzbiAxc3QgUEUgwqDCoFBTaXplIMKg
wqDCoMKgwqBQRnJlZSDCoMKgwqDCoMKgVXNlZCBBdHRyIEFsbG9jYXRhYmxlIEV4cG9ydGVkIMKg
wqBNaXNzaW5nIMKgwqDCoFBFIMKgQWxsb2MgUFYgVGFncyAjUE1kYSAjUE1kYVVzZSBCQSBTdGFy
dCBCQSBTaXplIFBJblVzZSBEdXBsaWNhdGUgRGV2aWNlSUQgRGV2aWNlSURUeXBlDQo8YnI+IMKg
bHZtMiB6TkxnSWUtUzhacS0xREY1LTBCaFItb0dHUy1xOVZ5LUZ6Tm5vVCAxMDQ4NTc2MDBCIC9k
ZXYvbG9vcDAgwqDCoDcgwqDCoDAgwqDCoDUyMDcwNEIgwqAxMDQ0NDgwQiDCoMKgwqDCoMKgwqAy
IDEwNDg1NzZCIDEwMDY2MzI5NkIgMTAwNjYzMjk2QiDCoMKgMEIgYS0tIMKgYWxsb2NhdGFibGUg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDI0IMKgwqDCoMKg
MCDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAxIMKgwqDCoMKgwqDCoMKgMSDCoMKgwqDCoMKgwqAw
QiDCoMKgwqDCoMKgMEIgwqDCoHVzZWQgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDxicj4rIGVjaG8gUkVTSVpFDQo8YnI+UkVT
SVpFDQo8YnI+KyBwdnJlc2l6ZSAvZGV2L2xvb3AwDQo8YnI+IMKgUGh5c2ljYWwgdm9sdW1lICZx
dW90Oy9kZXYvbG9vcDAmcXVvdDsgY2hhbmdlZA0KPGJyPiDCoDEgcGh5c2ljYWwgdm9sdW1lKHMp
IHJlc2l6ZWQgb3IgdXBkYXRlZCAvIDAgcGh5c2ljYWwgdm9sdW1lKHMpIG5vdCByZXNpemVkDQo8
YnI+KyBwdmRpc3BsYXkgLS11bml0cyBiIC9kZXYvbG9vcDANCjxicj4gwqAtLS0gUGh5c2ljYWwg
dm9sdW1lIC0tLQ0KPGJyPiDCoFBWIE5hbWUgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoC9k
ZXYvbG9vcDANCjxicj4gwqBWRyBOYW1lIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB0ZXN0
DQo8YnI+IMKgUFYgU2l6ZSDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgMTAzODA5MDI0IEIg
wqAvIG5vdCB1c2FibGUgMzE0NTcyOCBCIMKgPGJyPiDCoEFsbG9jYXRhYmxlIMKgwqDCoMKgwqDC
oMKgwqDCoMKgeWVzIMKgPGJyPiDCoFBFIFNpemUgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oDQxOTQzMDQgQiDCoDxicj4gwqBUb3RhbCBQRSDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDI0
DQo8YnI+IMKgRnJlZSBQRSDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgMjQNCjxicj4gwqBB
bGxvY2F0ZWQgUEUgwqDCoMKgwqDCoMKgwqDCoMKgMA0KPGJyPiDCoFBWIFVVSUQgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHpOTGdJZS1TOFpxLTFERjUtMEJoUi1vR0dTLXE5VnktRnpObm9U
DQo8YnI+IMKgwqDCoDxicj4rIHB2cyAtLXVuaXRzIGIgLW8gcHZfYWxsIC9kZXYvbG9vcDANCjxi
cj4gwqBGbXQgwqBQViBVVUlEIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgRGV2U2l6ZSDCoMKgwqBQViDCoMKgwqDCoMKgwqDCoMKg
TWFqIE1pbiBQTWRhRnJlZSDCoFBNZGFTaXplIMKgUEV4dFZzbiAxc3QgUEUgwqDCoFBTaXplIMKg
wqDCoMKgwqBQRnJlZSDCoMKgwqDCoMKgVXNlZCBBdHRyIEFsbG9jYXRhYmxlIEV4cG9ydGVkIMKg
wqBNaXNzaW5nIMKgwqDCoFBFIMKgQWxsb2MgUFYgVGFncyAjUE1kYSAjUE1kYVVzZSBCQSBTdGFy
dCBCQSBTaXplIFBJblVzZSBEdXBsaWNhdGUgRGV2aWNlSUQgRGV2aWNlSURUeXBlDQo8YnI+IMKg
bHZtMiB6TkxnSWUtUzhacS0xREY1LTBCaFItb0dHUy1xOVZ5LUZ6Tm5vVCAxMDQ4NTc2MDBCIC9k
ZXYvbG9vcDAgwqDCoDcgwqDCoDAgwqDCoDUyMDcwNEIgwqAxMDQ0NDgwQiDCoMKgwqDCoMKgwqAy
IDEwNDg1NzZCIDEwMDY2MzI5NkIgMTAwNjYzMjk2QiDCoMKgMEIgYS0tIMKgYWxsb2NhdGFibGUg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDI0IMKgwqDCoMKg
MCDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAxIMKgwqDCoMKgwqDCoMKgMSDCoMKgwqDCoMKgwqAw
QiDCoMKgwqDCoMKgMEIgwqDCoHVzZWQgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoDxicj4rIGVjaG8gQ0xFQU5VUA0KPGJyPkNM
RUFOVVANCjxicj4rIHZncmVtb3ZlIHRlc3QNCjxicj4gwqBWb2x1bWUgZ3JvdXAgJnF1b3Q7dGVz
dCZxdW90OyBzdWNjZXNzZnVsbHkgcmVtb3ZlZA0KPGJyPisgcHZyZW1vdmUgL2Rldi9sb29wMA0K
PGJyPiDCoExhYmVscyBvbiBwaHlzaWNhbCB2b2x1bWUgJnF1b3Q7L2Rldi9sb29wMCZxdW90OyBz
dWNjZXNzZnVsbHkgd2lwZWQuDQo8YnI+KyBsb3NldHVwIC1kIC9kZXYvbG9vcDA8YnI+DQo8L3Nw
YW4+PC9kaXY+PGRpdj48c3BhbiBzdHlsZT0iZm9udC1mYW1pbHk6bW9ub3NwYWNlIj48YnI+PC9z
cGFuPjwvZGl2PjwvZGl2Pg0K
--0000000000002b0599062b75a2ec--
--0000000000002b059a062b75a2ee
Content-Type: application/x-shellscript; name="test.sh"
Content-Disposition: attachment; filename="test.sh"
Content-Transfer-Encoding: base64
Content-ID: <f_m5sqzt6l0>
X-Attachment-Id: f_m5sqzt6l0

IyEvYmluL2Jhc2gKc2V0IC1vIHh0cmFjZQpzZXQgLW8gZXJyZXhpdAoKdHJ1bmNhdGUgLXMgMTAw
TSBpbWFnZQpMT09QPSQobG9zZXR1cCAtLXNob3cgLWYgaW1hZ2UpCmVjaG8gIkxPT1AgJExPT1Ai
CnB2Y3JlYXRlICRMT09QCnZnY3JlYXRlIHRlc3QgJExPT1AKcHZkaXNwbGF5IC0tdW5pdHMgYiAk
TE9PUApwdnMgLS11bml0cyBiIC1vIHB2X2FsbCAkTE9PUAplY2hvICJSRVNJWkUiCnB2cmVzaXpl
ICRMT09QCnB2ZGlzcGxheSAtLXVuaXRzIGIgJExPT1AKcHZzIC0tdW5pdHMgYiAtbyBwdl9hbGwg
JExPT1AKZWNobyAiQ0xFQU5VUCIKdmdyZW1vdmUgdGVzdApwdnJlbW92ZSAkTE9PUApsb3NldHVw
IC1kICRMT09QCg==
--0000000000002b059a062b75a2ee--
