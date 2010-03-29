Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o2TJ5m7Z021301
	for <linux-lvm@redhat.com>; Mon, 29 Mar 2010 15:05:48 -0400
Received: from e9.ny.us.ibm.com (e9.ny.us.ibm.com [32.97.182.139])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o2TJ5ame032310
	for <linux-lvm@redhat.com>; Mon, 29 Mar 2010 15:05:36 -0400
Received: from d01relay06.pok.ibm.com (d01relay06.pok.ibm.com [9.56.227.116])
	by e9.ny.us.ibm.com (8.14.3/8.13.1) with ESMTP id o2TIsL39019073
	for <linux-lvm@redhat.com>; Mon, 29 Mar 2010 14:54:21 -0400
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])
	by d01relay06.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	o2TJ5Wvt1654840
	for <linux-lvm@redhat.com>; Mon, 29 Mar 2010 15:05:32 -0400
Received: from d01av01.pok.ibm.com (loopback [127.0.0.1])
	by d01av01.pok.ibm.com (8.14.3/8.13.1/NCO v10.0 AVout) with ESMTP id
	o2TJ5Wbu032571
	for <linux-lvm@redhat.com>; Mon, 29 Mar 2010 15:05:32 -0400
Received: from malahal.localdomain (malahal.beaverton.ibm.com [9.47.17.130])
	by d01av01.pok.ibm.com (8.14.3/8.13.1/NCO v10.0 AVin) with ESMTP id
	o2TJ5WTu032534
	for <linux-lvm@redhat.com>; Mon, 29 Mar 2010 15:05:32 -0400
Date: Mon, 29 Mar 2010 12:05:31 -0700
From: malahal@us.ibm.com
Message-ID: <20100329190531.GA15304@us.ibm.com>
References: <4BB0EEFC.5090207@cfl.rr.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4BB0EEFC.5090207@cfl.rr.com>
Subject: Re: [linux-lvm] dmeventd mirror monitoring
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Phillip Susi [psusi@cfl.rr.com] wrote:
> It seems that dmeventd was created to allow lvm to have it monitor
> mirrored volumes and detect errors and take appropriate action, such as
> notifying the administrator about the mirror becoming degraded and maybe
> rebuilding with a spare.  I can't find any documentation on how to
> configure this though, so I get the feeling that it has not been
> implemented.  Is this the case?

Currently it has snapshot and mirror (raid1) plugins. The mirror part
does monitor (event based) for failed legs or logs and takes some
actions. At the moment, all of its configuration is in /etc/lvm/lvm.conf
file. Look at activation section.

1) It doesn't notify the admin.
2) It doesn't automatically rebuild with a given sparse disk. Although
   you can use "allocate" to get this kind of feature. I have not
   tested this feature though!
