Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1PEfpi24253
	for <linux-lvm@redhat.com>; Wed, 25 Feb 2004 09:41:51 -0500
Received: from host1.appws.com ([216.136.72.3])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1PEfob26058
	for <linux-lvm@redhat.com>; Wed, 25 Feb 2004 09:41:50 -0500
Received: from grandmother.littlebald.com (localhost.localdomain [127.0.0.1])
	by grandmother.littlebald.com (8.12.8/8.12.8) with ESMTP id i1PEfgPD007183
	for <linux-lvm@redhat.com>; Wed, 25 Feb 2004 09:41:42 -0500
Received: (from david@localhost)
	by grandmother.littlebald.com (8.12.8/8.12.8/Submit) id i1PEfgXT007181
	for linux-lvm@redhat.com; Wed, 25 Feb 2004 09:41:42 -0500
Subject: Re: [linux-lvm] lvm size mismatch?
From: David Johnston <david@littlebald.com>
In-Reply-To: <20040224005603.GA17483@kldp.net>
References: <20040224005603.GA17483@kldp.net>
Content-Transfer-Encoding: 7bit
Message-Id: <1077720101.6906.6.camel@grandmother.littlebald.com>
Mime-Version: 1.0
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Wed Feb 25 09:40:04 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On Mon, 2004-02-23 at 19:56, Soon-Son Kwon wrote:
> Hi I am using lvm on debian woody.
> The version would be about 1.0.x.
> 
> foo:/var# df -h
> Filesystem            Size  Used Avail Use% Mounted on
> /dev/vol/var           18G   16G  2.7G  85% /var
> 
> foo:/var# du . -sh
> 5.4G    .
> 
> where does this size mismatch come from?

iirc, df looks at the filesystem's free space maps, while du sums the
file sizes as listed in the directories.  I'd guess that you've got
10.6G marked as "in use" in the free space maps that isn't referenced by
any inode. 'fsck -f /var' should fix it; remember that you'll have to
unmount /var first.

-- 
David Johnston <david@littlebald.com>
Little Bald Consulting, LLC
