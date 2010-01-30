Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o0U0LhNl014171
	for <linux-lvm@redhat.com>; Fri, 29 Jan 2010 19:21:44 -0500
Received: from chi-exsf01.nighthawkrad.net (mail.nighthawkrad.net
	[204.16.165.99])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o0U0LWNi026035
	for <linux-lvm@redhat.com>; Fri, 29 Jan 2010 19:21:33 -0500
Received: from EXCAS1-02.nighthawkrad.net (excas1-02.nighthawkrad.net
	[10.181.3.82]) by chi-exsf01.nighthawkrad.net with ESMTP id
	Xn96RWpFrTUrLDmd (version=TLSv1 cipher=AES128-SHA bits=128
	verify=NO) for <linux-lvm@redhat.com>; Fri, 29 Jan 2010 18:21:05 -
From: Christopher Smith <csmith@nighthawkrad.net>
Date: Fri, 29 Jan 2010 16:22:58 -0800
Message-ID: <1ECCF3E7A2E498438B962AE1575283398C54AE14@EXMB1.nighthawkrad.net>
Content-Language: en-US
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Metadata too large for circular buffer
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
Content-Type: text/plain; charset="utf-8"
To: "linux-lvm@redhat.com" <linux-lvm@redhat.com>

I am having this problem on a large VG (75TB) with about 320 LVs.

I found an earlier thread discussing this problem here, but I'm not confident my understanding is good enough to work off what's there:
http://markmail.org/message/rdqkj7tt7tomi7z3?q=VG+metadata+too+large+for+circular+buffer&page=1&refer=cq5ttaerfed5ulon


As this data is somewhat important, I'd appreciate some help in working out exactly what to do.  The VG is clustered, and I do have the ability to add a new PV (with a larger metadata area), then pvmove everything off another PV, remove/recreate that PV, etc, etc, to get larger metadata areas on all my PVs.  I could also shut down the other node and revert the clustered VG to unclustered if that would make things easier (it's only there for redundancy, not capacity).  However, at the moment I can't do anything - even lvrename or lvremove returns this error.  Can I get some step-by-step instructions in making LVM use some file for its metadata so I can shuffle things around ?

Cheers,
-- 
Christopher Smith

UNIX Team Leader
NightHawk Radiology Services
Suite 600, 4900 N Scottsdale Road
Scottsdale, 85251, USA
http://www.nighthawkrad.net
USA Toll free:��� 866 241 6635

Email:��������� csmith@nighthawkrad.net
IP Extension:�� 4483
Sydney Mobile:� +61 4 0739 7563
Sydney Phone:�� +61 2 8211 2363
US Mobile/Cell: +1 480 717 9562
US Phone:������ +1 480 822 4483
US Fax:�������� +1 208 763 3643

All phones forwarded to my current location, however, please consider the local time in Arizona before calling from abroad.


CONFIDENTIALITY NOTICE:�� This email, including any attachments, contains information from NightHawk Radiology Services, which may be confidential or privileged. The information is intended to be for the use of the individual or entity named above. If you are not the intended recipient, be aware that any disclosure, copying, distribution or use of the contents of this information is prohibited. If you have received this email in error, please notify NightHawk Radiology Services immediately by forwarding message to postmaster@nighthawkrad.net and destroy all electronic and hard copies of the communication, including attachments.
