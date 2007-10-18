Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l9IDqtw9030981
	for <linux-lvm@redhat.com>; Thu, 18 Oct 2007 09:52:55 -0400
Received: from mail.reagi.com (mail.reagi.com [195.60.188.80])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l9IDqktc007198
	for <linux-lvm@redhat.com>; Thu, 18 Oct 2007 09:52:48 -0400
Message-ID: <47176524.2080508@oxeva.fr>
Date: Thu, 18 Oct 2007 15:52:36 +0200
From: Gabriel Barazer <gabriel@oxeva.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] very slow fw performance when snapshots active
References: <47171BD6.3090709@idmedia.com>
In-Reply-To: <47171BD6.3090709@idmedia.com>
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

Hi,

On 10/18/2007 10:39:50 AM +0200, Falko Zurell <falko.zurell@idmedia.com> 
wrote:
> 
> Then I edit a 2 GB text file on /opt (XFS filesystem) with vi (just
> hitting "enter" and save this minor change). This will take minutes to
> finish the vi during saving.

This problem is not lvm-related: when opening a file with vim, it reads 
the entire file into memory (even if the file is 2GB), marks the changes 
into a .swp file. When saving, vim rewrites the entire file in place, 
effectively changing 2GB of copy on write blocks. This happens every 
time, with or without snapshot, the latter being worse because of the 
cow overhead.

for reading-only very large files, "less" or "more" read files on-demand 
which is a far more effecient way.

for writing, I don't know any method allowing to safely write a small 
change into a large file, except using awk or perl parsing (which reads 
the entire streamed file anyway)

Gabriel
