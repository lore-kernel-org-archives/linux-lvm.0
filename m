Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oBEGFHMg012996
	for <linux-lvm@redhat.com>; Tue, 14 Dec 2010 11:15:18 -0500
Received: from esri3.esri.com (esrismtp2.esri.com [198.102.62.103])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oBEGF57o002402
	for <linux-lvm@redhat.com>; Tue, 14 Dec 2010 11:15:05 -0500
Received: from leoray.esri.com (leoray.esri.com [10.27.102.12])
	by esri3.esri.com (8.11.7p3+Sun/8.11.7) with ESMTP id oBEGF5o10727
	for <linux-lvm@redhat.com>; Tue, 14 Dec 2010 08:15:05 -0800 (PST)
Received: from leoray.esri.com (leoray.esri.com [127.0.0.1])
	by leoray.esri.com (8.14.4/8.14.3) with ESMTP id oBEGF5h2029839
	for <linux-lvm@redhat.com>; Tue, 14 Dec 2010 08:15:05 -0800
Received: (from ray5147@localhost)
	by leoray.esri.com (8.14.4/8.14.3/Submit) id oBEGF5P5029837
	for linux-lvm@redhat.com; Tue, 14 Dec 2010 08:15:05 -0800
Date: Tue, 14 Dec 2010 08:15:05 -0800
From: Ray Van Dolson <rvandolson@esri.com>
Message-ID: <20101214161505.GA29811@esri.com>
References: <AANLkTi=zsNTng5n6gnEro_Dsb8_m+dszDUgxovRAX+LT@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <AANLkTi=zsNTng5n6gnEro_Dsb8_m+dszDUgxovRAX+LT@mail.gmail.com>
Subject: Re: [linux-lvm] Shared LVM questions
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

On Tue, Dec 14, 2010 at 07:59:19AM -0800, Paolo Smiraglia wrote:
> Hi to every ones...
> 
> 
> I would to setup a LVM build on top of an iSCSI disk shared between
> some nodes which is managed by a Master Node (MN) that sents commands
> to other nodes (N1, N2,...) through SSH.
> 
> I think the cluster extension is not required because a particular
> Logical Volume (LV) is accessed exclusively by one node, and because
> LVM metadata cannot be modified at the same time by multiple nodes.
> 
> One issue is that once a LV is created by a node it cannot be
> activated by another node by executing the command
> 
>   $> lvchange -aey vg/lv01
> 
> and the LV created is a snapshot. The error displayed is
> 
>   Can't change logical volume "lv01"
> 
> 
> 1. In this scenario is CLVMD required?
> 2. Is it possible to activate a LV in another node?
> 
> 
> Thanks in advance for all replies.

I haven't tried this, but you probably would need to release the LVM
from use by node B for node A to activate and use it.

Ray
