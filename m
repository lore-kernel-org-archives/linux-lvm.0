Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8N8m6r05068
	for <linux-lvm@redhat.com>; Thu, 23 Sep 2004 04:48:06 -0400
Received: from visp.engelschall.com (visp.engelschall.com [195.27.176.148])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i8N8m0r1005312
	for <linux-lvm@redhat.com>; Thu, 23 Sep 2004 04:48:00 -0400
Date: Thu, 23 Sep 2004 10:47:41 +0200
From: "Ralf S. Engelschall" <rse@engelschall.com>
Message-ID: <20040923084741.GA5658@engelschall.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM UUIDs are not UUIDs!?
Reply-To: rse@engelschall.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

While setting up an LVM2 based 3TB storage the last days I've stumbled
over LVM2's "UUID" strings as displayed by its pvdisplay, vgdisplay, and
lvdisplay commands. It is clear that LVM2 requires those ids, but *WHY*
are they called "UUID"?

They do NOT conform in any way to the standardized ISO/IEC 11578:1996
compliant Universally Unique Identifier (UUID) strings. Neither by the
way they are created (LVM2 UUIDs are just random numbers while ISO v4
random UUIDs are fixed bit-fields plus random remaining bits) nor the
way they are formatted. Examples:

LVM2               UUID: H9C8iE-braW-70bk-Fx9x-lMIX-Rmmy-5XgkM9
ISO/IEC 11578:1996 UUID: 4a8287f4-0d33-11d9-8068-0002b31abd79

So, wouldn't it be reasonable that either LVM2 uses a real open-source
UUID library for dealing with standardized UUIDs (ext2fs's libuuid, OSSP
uuid, etc) or at least names its ids own id strings just "ID" or even
"LVMID"?

Perhaps at least in the visible output strings in order to reduce
confusion with standardized UUIDs...

                                       Ralf S. Engelschall
                                       rse@engelschall.com
                                       www.engelschall.com
