Received: from pobox.stuttgart.redhat.com (pobox.stuttgart.redhat.com
	[172.16.2.10])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m7FLKhbJ027119
	for <linux-lvm@redhat.com>; Fri, 15 Aug 2008 17:20:43 -0400
Received: from [10.32.4.58] (vpn-4-58.str.redhat.com [10.32.4.58])
	by pobox.stuttgart.redhat.com (8.13.1/8.13.1) with ESMTP id
	m7FLKgr3002316
	for <linux-lvm@redhat.com>; Fri, 15 Aug 2008 17:20:42 -0400
Message-ID: <48A5F32A.3020203@redhat.com>
Date: Fri, 15 Aug 2008 23:20:42 +0200
From: Milan Broz <mbroz@redhat.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Mapping LV's back to PV's
References: <779919740808151414n31fa2a9cr426b9af3ed728ba7@mail.gmail.com>
In-Reply-To: <779919740808151414n31fa2a9cr426b9af3ed728ba7@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Jeremy Lyon wrote:
> I've been searching on this question, but can't find anything.  Is there
> a pv/lv/vg command that I can use to find out what PV(s) a LV resides on?

Something like this?

lvs -o +devices

Milan
