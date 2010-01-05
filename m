Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx08.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o05JZRtu024791
	for <linux-lvm@redhat.com>; Tue, 5 Jan 2010 14:35:27 -0500
Received: from Vail.esri.com (esrismtp2.esri.com [198.102.62.103])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o05JZBd7011637
	for <linux-lvm@redhat.com>; Tue, 5 Jan 2010 14:35:12 -0500
Received: from leoray.esri.com (leoray.esri.com [10.27.102.12])
	by Vail.esri.com (8.13.7+Sun/8.13.7) with ESMTP id o05JZBHs002345
	for <linux-lvm@redhat.com>; Tue, 5 Jan 2010 11:35:11 -0800 (PST)
Received: from leoray.esri.com (leoray.esri.com [127.0.0.1])
	by leoray.esri.com (8.14.3/8.14.3) with ESMTP id o05JZBC3024100
	for <linux-lvm@redhat.com>; Tue, 5 Jan 2010 11:35:11 -0800
Received: (from ray5147@localhost)
	by leoray.esri.com (8.14.3/8.14.3/Submit) id o05JZBvE024099
	for linux-lvm@redhat.com; Tue, 5 Jan 2010 11:35:11 -0800
Date: Tue, 5 Jan 2010 11:35:11 -0800
From: Ray Van Dolson <rvandolson@esri.com>
Message-ID: <20100105193511.GB23959@esri.com>
References: <4B438ECC.5000805@alteeve.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4B438ECC.5000805@alteeve.com>
Subject: Re: [linux-lvm] What is holding back clustered snapshotting?
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

On Tue, Jan 05, 2010 at 11:11:08AM -0800, Madison Kelly wrote:
> Hi all,
> 
>    I know that, currently, this isn't supported. Would someone be able 
> to explain or point me at a place to read up on what is holding this 
> feature back? What are the difficulties? Is it just a question of time, 
> or are there certain technical hurdles in the way?
> 
>    Thanks for any input!
> 

I'm sure there are some technical hurdles... but perhaps customers need
to put more of a priority on it.

I keep forgetting to open an RFE SR for this feature.  That sorta stuff
makes a difference in prioritization for RH's engineering though for
sure!

Ray
