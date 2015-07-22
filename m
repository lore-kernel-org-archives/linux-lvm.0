Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t6MDdcVN009899
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 22 Jul 2015 09:39:38 -0400
Received: from mr.tuwien.ac.at (mr2.kom.tuwien.ac.at [128.130.2.110])
	by mx1.redhat.com (Postfix) with ESMTPS id 1B483B813D
	for <linux-lvm@redhat.com>; Wed, 22 Jul 2015 13:39:36 +0000 (UTC)
Received: from mail.tilab.tuwien.ac.at (misc.tilab.tuwien.ac.at
	[128.130.60.140])
	by mr.tuwien.ac.at (8.14.4/8.14.4/Debian-2ubuntu2.1) with ESMTP id
	t6MDdS1s032150
	for <linux-lvm@redhat.com>; Wed, 22 Jul 2015 15:39:28 +0200
Received: from mail.tilab.tuwien.ac.at (mail.tilab.tuwien.ac.at
	[128.130.60.133])
	by mail.tilab.tuwien.ac.at (Postfix) with ESMTP id 5A60CA0CC
	for <linux-lvm@redhat.com>; Wed, 22 Jul 2015 15:39:28 +0200 (CEST)
Date: Wed, 22 Jul 2015 15:39:28 +0200 (CEST)
From: Heinz Deinhart <heinz@tilab.tuwien.ac.at>
Message-ID: <alpine.LRH.2.10.1507221530430.8093@services.tilab.tuwien.ac.at>
MIME-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="-2105503684-1585872637-1437572368=:8093"
Subject: [linux-lvm] Typos in docu of LVM2.2.02.125
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

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---2105503684-1585872637-1437572368=:8093
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII

Hi,

i think we found some typos in the usage and man pages of the lvm 
tools. See the patch for details.

Futher more there seem to be some differences between manpages and the 
usage text in vgextend. --poolmetadatasize is not in the man page. Don't 
know which one is correct.

regards,
Heinz

-- 
Heinz Deinhart <heinz@tilab.tuwien.ac.at>           +43 1 58801-19521
Technische Universitaet Wien, E195                  Treitlstr. 3
www.tilab.tuwien.ac.at                              1040 Wien
---2105503684-1585872637-1437572368=:8093
Content-Type: TEXT/PLAIN; charset=US-ASCII;
	name=LVM2.2.02.125-docu-resize-typos.patch
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.LRH.2.10.1507221539280.8093@services.tilab.tuwien.ac.at>
Content-Description: 
Content-Disposition: attachment; filename=LVM2.2.02.125-docu-resize-typos.patch

ZGlmZiAtcnUgTFZNMi4yLjAyLjEyNS9tYW4vbHZyZXNpemUuOC5pbiBMVk0y
LjIuMDIuMTI1LWZpeGVkdHlwb3MvbWFuL2x2cmVzaXplLjguaW4NCi0tLSBM
Vk0yLjIuMDIuMTI1L21hbi9sdnJlc2l6ZS44LmluCTIwMTUtMDctMDcgMTQ6
NTc6NDMuMDAwMDAwMDAwICswMjAwDQorKysgTFZNMi4yLjAyLjEyNS1maXhl
ZHR5cG9zL21hbi9sdnJlc2l6ZS44LmluCTIwMTUtMDctMjIgMTU6MjU6MTgu
NTk1MjE5NjIxICswMjAwDQpAQCAtMTQsNyArMTQsNyBAQA0KIC5SQiBbIFwt
TCB8IFwtXC1zaXplDQogLlJJIFsgKyB8IFwtIF0gTG9naWNhbFZvbHVtZVNp
emUgWyBiQnNTa0ttTWdHdFRwUGVFIF19DQogLlJCIFsgXC1cLXBvb2xtZXRh
ZGF0YXNpemUNCi0uUkkgWyArIF0gTWV0YWRhdGFWb2x1bWVTaXplIFsgYkJz
U2tLbU1nRyBdDQorLlJJIFsgKyBdIE1ldGFkYXRhVm9sdW1lU2l6ZSBbIGJC
c1NrS21NZ0cgXV0NCiAuUkIgWyBcLWYgfCBcLVwtZm9yY2UgXQ0KIC5SQiBb
IFwtbiB8IFwtXC1ub2ZzY2sgXQ0KIC5SQiBbIFwtciB8IFwtXC1yZXNpemVm
cyBdDQpkaWZmIC1ydSBMVk0yLjIuMDIuMTI1L3Rvb2xzL2NvbW1hbmRzLmgg
TFZNMi4yLjAyLjEyNS1maXhlZHR5cG9zL3Rvb2xzL2NvbW1hbmRzLmgNCi0t
LSBMVk0yLjIuMDIuMTI1L3Rvb2xzL2NvbW1hbmRzLmgJMjAxNS0wNy0wNyAx
NDo1Nzo0My4wMDAwMDAwMDAgKzAyMDANCisrKyBMVk0yLjIuMDIuMTI1LWZp
eGVkdHlwb3MvdG9vbHMvY29tbWFuZHMuaAkyMDE1LTA3LTIyIDE1OjI0OjQw
LjU5NDIwOTQ5NCArMDIwMA0KQEAgLTQ1OCw3ICs0NTgsNyBAQA0KICAgICJc
dFstaXwtLXN0cmlwZXMgU3RyaXBlcyBbLUl8LS1zdHJpcGVzaXplIFN0cmlw
ZVNpemVdXVxuIg0KICAgICJcdHstbHwtLWV4dGVudHMgWytdTG9naWNhbEV4
dGVudHNOdW1iZXJbJXtWR3xMVnxQVlN8RlJFRXxPUklHSU59XSB8XG4iDQog
ICAgIlx0IC1MfC0tc2l6ZSBbK11Mb2dpY2FsVm9sdW1lU2l6ZVtiQnNTa0tt
TWdHdFRwUGVFXX1cbiINCi0gICAiXHQgLS1wb29sbWV0YWRhdGFzaXplIFsr
XU1ldGFkYXRhVm9sdW1lU2l6ZVtiQnNTa0ttTWdHXX1cbiINCisgICAiXHRb
LS1wb29sbWV0YWRhdGFzaXplIFsrXU1ldGFkYXRhVm9sdW1lU2l6ZVtiQnNT
a0ttTWdHXV1cbiINCiAgICAiXHRbLW18LS1taXJyb3JzIE1pcnJvcnNdXG4i
DQogICAgIlx0Wy0tbm9zeW5jXVxuIg0KICAgICJcdFstLXVzZS1wb2xpY2ll
c11cbiINCkBAIC02MjksNyArNjI5LDcgQEANCiAgICAiXHRbLWl8LS1zdHJp
cGVzIFN0cmlwZXMgWy1JfC0tc3RyaXBlc2l6ZSBTdHJpcGVTaXplXV1cbiIN
CiAgICAiXHR7LWx8LS1leHRlbnRzIFsrfC1dTG9naWNhbEV4dGVudHNOdW1i
ZXJbJXtWR3xMVnxQVlN8RlJFRXxPUklHSU59XSB8XG4iDQogICAgIlx0IC1M
fC0tc2l6ZSBbK3wtXUxvZ2ljYWxWb2x1bWVTaXplW2JCc1NrS21NZ0d0VHBQ
ZUVdfVxuIg0KLSAgICJcdCAtLXBvb2xtZXRhZGF0YXNpemUgWytdTWV0YWRh
dGFWb2x1bWVTaXplW2JCc1NrS21NZ0ddfVxuIg0KKyAgICJcdFstLXBvb2xt
ZXRhZGF0YXNpemUgWytdTWV0YWRhdGFWb2x1bWVTaXplW2JCc1NrS21NZ0dd
XVxuIg0KICAgICJcdFstbnwtLW5vZnNja11cbiINCiAgICAiXHRbLS1ub3Vk
ZXZzeW5jXVxuIg0KICAgICJcdFstcnwtLXJlc2l6ZWZzXVxuIg0K

---2105503684-1585872637-1437572368=:8093--
