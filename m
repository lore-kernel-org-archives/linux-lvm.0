Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0TFeSWA023469
	for <linux-lvm@redhat.com>; Thu, 29 Jan 2009 10:40:28 -0500
Received: from esri3.esri.com (esrismtp2.esri.com [198.102.62.103])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n0TFdMRB012150
	for <linux-lvm@redhat.com>; Thu, 29 Jan 2009 10:39:57 -0500
Received: from leoray.esri.com (leoray.esri.com [10.27.102.12])
	by esri3.esri.com (8.11.7p3+Sun/8.11.6) with ESMTP id n0TFdLd27269
	for <linux-lvm@redhat.com>; Thu, 29 Jan 2009 07:39:21 -0800 (PST)
Received: from leoray.esri.com (leoray.esri.com [127.0.0.1])
	by leoray.esri.com (8.14.3/8.14.1) with ESMTP id n0TFdLdx010432
	for <linux-lvm@redhat.com>; Thu, 29 Jan 2009 07:39:21 -0800
Received: (from ray5147@localhost)
	by leoray.esri.com (8.14.3/8.14.3/Submit) id n0TFdLQZ010430
	for linux-lvm@redhat.com; Thu, 29 Jan 2009 07:39:21 -0800
Date: Thu, 29 Jan 2009 07:39:21 -0800
From: Ray Van Dolson <rvandolson@esri.com>
Subject: Re: [linux-lvm] Local + iSCSI disks
Message-ID: <20090129153921.GA10396@esri.com>
References: <20090129153047.GA10306@esri.com> <4981CC92.5090703@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4981CC92.5090703@redhat.com>
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

On Thu, Jan 29, 2009 at 07:34:42AM -0800, Bryn M. Reeves wrote:
> 
> There's the replicator target being worked on:
> 
> http://people.redhat.com/heinzm/sw/dm/dm-repl/
> 

Huh, neat.  Will this be like DRBD only to N number of remote devices?

Ray
