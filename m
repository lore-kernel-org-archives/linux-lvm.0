Received: from fentible.pjc.net (vpnuser2.surrey.redhat.com [172.16.9.2])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i8LD9Qin008638
	for <linux-lvm@redhat.com>; Tue, 21 Sep 2004 14:09:26 +0100
Received: from patrick by fentible.pjc.net with local (Exim 4.34)
	id 1C9kOc-0003WC-2t
	for linux-lvm@redhat.com; Tue, 21 Sep 2004 14:09:26 +0100
Date: Tue, 21 Sep 2004 14:09:26 +0100
From: Patrick Caulfield <pcaulfie@redhat.com>
Subject: Re: [linux-lvm] Disk partition required for LVM?
Message-ID: <20040921130925.GB2625@tykepenguin.com>
References: <20040921123206.GA1467@perkamentus>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20040921123206.GA1467@perkamentus>
Sender: Patrick <patrick@tykepenguin.com>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Sep 21, 2004 at 02:32:06PM +0200, lvm@perkamentus.com wrote:
> 
> Why does the partition need to be created on that disk for LVM to work
> (and not on the other two)? Is this a problem with LVM2, the 2.6
> kernel? Or could it be hardware not functioning as it should,
> e.g. disk or controller?
> 
> I would like to know why the creation of a partition is necessary. Has
> anyone experienced the same problem/behaviour with LVM? If so, is
> there a solution so no partition is needed?
> 

Check that you don't have a symlink from /dev/hdb to /dev/cdrom. The debian
lvm.conf file excludes /dev/cdrom from LVM searches.

-- 

patrick
