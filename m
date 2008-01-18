Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m0IAcbPb001345
	for <linux-lvm@redhat.com>; Fri, 18 Jan 2008 05:38:37 -0500
Received: from seanic27.net (w27-7.dnslinks.net [216.12.218.108])
	by mx3.redhat.com (8.13.1/8.13.1) with SMTP id m0IAc64R009147
	for <linux-lvm@redhat.com>; Fri, 18 Jan 2008 05:38:07 -0500
From: Rahul Sahadevan <rahul@sanatdata.net>
In-Reply-To: <1199426489.3844.14.camel@rahul>
References: <1199426489.3844.14.camel@rahul>
Date: Fri, 18 Jan 2008 16:07:55 +0530
Message-Id: <1200652675.32292.53.camel@rahul>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: Snapshot - Commit and Rollback
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

Hi Group,
     I have posted this mail regarding the SNAPSHOT operations in LVM2.
If anyone has any clue or comments please put forward. I am deliberately
waiting for a reply from this group. 

regards,
    Rahul

On Fri, 2008-01-04 at 11:31 +0530, Rahul Sahadevan wrote:
> Group,
>      I am using LVM2 for my volume management and its working very fine.
> Last day i try to take backup of the volumes using snapshot feature
> available. I have following queries regarding the snapshot working.
> After the snapshot is taken is there any way to update the contents
> (COMMIT) of the same snapshot with the changed contents in the share in
> a future point of time. 
> Also is there any feature like ROLLBACK to revert back the volume
> content with the contents of the nth snapshot. 
> As per now i have to store multiple snapshots for every changes
> happening in the volume, which is almost like wasting a hell lot of
> space. 
> If anyone put light on these and let me know where to refer to get more
> details on this will be highly appreciable.
> 
> Thanks in advance. 
> 
> regards,
>      Rahul
