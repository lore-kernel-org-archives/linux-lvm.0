Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k2TGcQUR014575
	for <linux-lvm@redhat.com>; Wed, 29 Mar 2006 11:38:26 -0500
Received: from xproxy.gmail.com (xproxy.gmail.com [66.249.82.192])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k2TGbkDM005406
	for <linux-lvm@redhat.com>; Wed, 29 Mar 2006 11:38:20 -0500
Received: by xproxy.gmail.com with SMTP id h30so293337wxd
	for <linux-lvm@redhat.com>; Wed, 29 Mar 2006 08:38:20 -0800 (PST)
Date: Wed, 29 Mar 2006 11:38:07 -0500
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200603291138.08104.kmescher@vt.edu>
From: Kevin Mescher <kevin.mescher@gmail.com>
Subject: [linux-lvm] Accessing volume group on single drive of failed raid 1?
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
To: linux-lvm@redhat.com

Is there a way to access/start up a volume group from a 
single drive of a failed raid 1?

I had a drive fail on my raid 1 array, and I didn't want to 
have to bring up a md device to be able to access the 
volume group information.  Is there any way to access the 
individual drives in the array without having to bring it 
up?

I know that on a Solaris system, you can access any single 
drive in a mirror independently, if the mirror is 
misbehaving.

Any help would be appreciated.
