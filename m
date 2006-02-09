Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k190ph126450
	for <linux-lvm@redhat.com>; Wed, 8 Feb 2006 19:51:43 -0500
Received: from host24.host24-server.com (host24.host24-server.com
	[67.55.33.97] (may be forged))
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k190pfdN017347
	for <linux-lvm@redhat.com>; Wed, 8 Feb 2006 19:51:41 -0500
Received: from [10.1.2.64] (63-197-247-13.turinnetworks.com [63.197.247.13])
	(authenticated bits=0)
	by host24.host24-server.com (8.12.11/8.12.11) with ESMTP id
	k190pTBS017889
	for <linux-lvm@redhat.com>; Wed, 8 Feb 2006 19:51:30 -0500
Message-ID: <43EA91F9.4040700@struzak.com>
Date: Wed, 08 Feb 2006 16:51:05 -0800
From: Marcin Struzak <marcin-list@struzak.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] can't create a PV
References: <20060206215141.GB7492@tui.site> <20060208093304.GA9374@tui.site>
In-Reply-To: <20060208093304.GA9374@tui.site>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Gunther Clasen wrote:
> [...] Or is my harddisk dying? 

Take a look at smartmontools (http://smartmontools.sourceforge.net/); 
they can accurately pinpoint existing or imminent hard-disk failures.

--Marcin
