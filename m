Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2O3YZMk010971
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2009 23:34:35 -0400
Received: from pluto.sivell.com (pluto-t3.sivell.com [65.112.245.197])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n2O3YI9O026304
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2009 23:34:18 -0400
Received: from [192.168.235.60] ([192.168.235.60]) (authenticated bits=0)
	by pluto.sivell.com (8.13.1/8.13.1) with ESMTP id n2O3Ytwf018658
	for <linux-lvm@redhat.com>; Mon, 23 Mar 2009 22:34:55 -0500
Message-ID: <49C854B8.3080009@sivell.com>
Date: Mon, 23 Mar 2009 22:34:16 -0500
From: Vu Pham <vu@sivell.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] CLVM Snapshot HOWTO?
References: <1237863480.6512.66.camel@ltpad.dugas.lan>
In-Reply-To: <1237863480.6512.66.camel@ltpad.dugas.lan>
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

Paul Dugas wrote:
> I apologize if this has been covered already or is written up elsewhere
> but I can't seem to find it.  I've got a couple of AoE volumes that I'm
> using for LVM VGs.  They have GFS filesystems on LVs that are sized to
> fill 90% of the the VGs; 10% space left over for snapshots.  I have 4
> CENTOS 5.2 machines clustered and mounting the GFS filesystems.  That's
> working well.
> 
> Having used LVM snapshots in non-cluster environments before, I figured
> I'd just use the same logic for backing up the volumes; lvcreate -s,
> mount, backup, umount, lvremove.  This quickly fell apart and I started
> to think about it more.  I ended up wondering how snapshots of the
> volume could ever really work without coordinating with the other
> nodes.  
> 
> My question is this.  Should I be able to use snapshots on clustered
> volumes like this?  If not, are there plans to support it later?  If so,
> can someone point me to a working example?
> 

I think you have to freeze the GFS volume before you create a snapshot, 
then you unfreeze it. man gfs_tool

Vu
