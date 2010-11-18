Received: from [10.11.10.197] (vpn-10-197.rdu.redhat.com [10.11.10.197])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAIEle9f008016
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2010 09:47:41 -0500
Message-ID: <4CE53C8C.7010109@redhat.com>
Date: Thu, 18 Nov 2010 09:47:40 -0500
From: Dave Sullivan <dsulliva@redhat.com>
MIME-Version: 1.0
References: <714075.64821.qm@web37902.mail.mud.yahoo.com>
In-Reply-To: <714075.64821.qm@web37902.mail.mud.yahoo.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] volume group does not activate after reboot
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Add that vchange -ay to /etc/rc.local

Are you mounting with _netdev option in /etc/fstab?

That sounds like the problem to me. Try the _netdev option first.  
Needed for IP mounted storage (i.e. ISCSI)

On 11/18/2010 09:08 AM, Rowland Agboro wrote:
> vgchange -ay

-- 

==============================================================
Dave Sullivan RHCE (Sr. Consultant)  Email: dsulliva@redhat.com
(Cell Phone):  +1 989 750 8385  (SIP Phone):  +1 312 660 3525
Red Hat Consulting      http://www.redhat.com/consulting
==============================================================
  Red Hat, Inc. | 1801 Varsity Dr | Raleigh, NC | 27606

---
Learn. Network. Experience open source.
Looking to carve out IT costs? http://www.redhat.com/carveoutcosts
