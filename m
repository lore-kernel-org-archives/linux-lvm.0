Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m2E1A85c020232
	for <linux-lvm@redhat.com>; Thu, 13 Mar 2008 21:10:08 -0400
Received: from destar.net (88.183.dowl.anc.borealisbroadband.net
	[12.17.183.88])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id m2E19Y4I011825
	for <linux-lvm@redhat.com>; Thu, 13 Mar 2008 21:09:35 -0400
Message-ID: <20080313170928.p624q5xqo844kc0w@www.destar.net>
Date: Thu, 13 Mar 2008 17:09:28 -0800
From: jonr@destar.net
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Duplicate VG
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
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: linux-lvm@redhat.com

Hello!

I have somehow got a duplicate VG on my system. I was wondering if  
there is a way to remove it without having to shutdown the server.  
They have uniqe uuid's so I was hoping I could just do a vgremove  
<uuid>. So far I have been unable to find a way to do it without  
shutting down.

Thanks for any help,

Jon
