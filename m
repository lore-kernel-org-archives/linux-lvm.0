Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j458OEO26944
	for <linux-lvm@redhat.com>; Thu, 5 May 2005 04:24:14 -0400
Received: from corpeumxic1.corp.emc.com (corpeumxic1.corp.emc.com
	[152.62.121.25])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j458ODon026804
	for <linux-lvm@redhat.com>; Thu, 5 May 2005 04:24:13 -0400
Message-ID: <50C05B7AA7D6924FB5E384EF14BC647B676988@inba1mx2.corp.emc.com>
From: Sreedharan_Vinod@emc.com
Subject: Re: [linux-lvm] "Close failed: Bad file descriptor" messages on p
	vcreate
Date: Thu, 5 May 2005 09:24:02 +0100 
MIME-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com



On Wed, May 04, 2005 at 10:49:00AM +0100, Sreedharan_Vinod emc com wrote:
> > > When I do pvcreate, I get deluged with "pvcreate  /dev/sdf: close
failed:
> > > Bad file descriptor" messages.

> > > On the same system, pvcreate another device succeeds.

> What architecture is this?

> It sounds similar to a known bug that is fixed in the RHEL4 Update 1
package.

I have seen this on i386. I have not tried it on other architectures as yet.

Can you point me to the bugzilla # that lists this symptom for my reference?

I will try it out with RHEL4 U1 and let you know.

Thanks.....

- Vinod
