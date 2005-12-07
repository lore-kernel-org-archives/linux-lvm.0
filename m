Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jB726RV07381
	for <linux-lvm@redhat.com>; Tue, 6 Dec 2005 21:06:27 -0500
Received: from mta09-winn.ispmail.ntl.com (mta09-winn.ispmail.ntl.com
	[81.103.221.49])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jB726Pjl021746
	for <linux-lvm@redhat.com>; Tue, 6 Dec 2005 21:06:25 -0500
Message-ID: <4396439A.7080500@ntlworld.com>
Date: Wed, 07 Dec 2005 02:06:18 +0000
From: Kelly Harding <kelly.harding@ntlworld.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM problems
References: <43963F45.5060104@ntlworld.com>
In-Reply-To: <43963F45.5060104@ntlworld.com>
Content-Type: multipart/mixed; boundary="------------070403000902050209040908"
Reply-To: kelly.harding@ntlworld.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: kelly.harding@ntlworld.com, LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.
--------------070403000902050209040908
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi again,

Forgot to add details:

PC: dual PII/350mhz (p/pro overdrive), 512mb ram, SCSI LVD 80mb/s.

The VG is across 3 36gb scsi drives attached to an adaptect 2940U2W card.

I'm running kernel version 2.4.27 (2.6 doesn't seem to like this system).

I noticed from the dmesg output the following:

device-mapper: one of name or uuid must be supplied, cmd(11)

This appears when the previously mentioned command is run.

I've no idea what this means or if it isa case of a re-install of the 
base system might fix this? maybe something with the
base system has gone a bit fubar?

any help or advice on this would be greatly appreciated.

If it comes ot it that I lose the data and have to format and star the 
LVM VG over again it won't be ideal but it won't
be losing anything vital either (just video files, etc).

Kelly

--------------070403000902050209040908
Content-Type: text/x-vcard; charset=utf-8;
 name="kelly.harding.vcf"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="kelly.harding.vcf"

begin:vcard
fn:Miss Kelly Harding
n:Harding;Kelly
adr:;;;;;;UK
email;internet:kelly.harding@ntlworld.com
x-mozilla-html:FALSE
version:2.1
end:vcard


--------------070403000902050209040908--
