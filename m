Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0ILAAO08655
	for <linux-lvm@redhat.com>; Tue, 18 Jan 2005 16:10:10 -0500
Received: from mproxy.gmail.com (mproxy.gmail.com [216.239.56.243])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j0ILA4uG013387
	for <linux-lvm@redhat.com>; Tue, 18 Jan 2005 16:10:04 -0500
Received: by mproxy.gmail.com with SMTP id q44so597727cwc
	for <linux-lvm@redhat.com>; Tue, 18 Jan 2005 13:10:04 -0800 (PST)
Message-ID: <dff3752705011813103fd9fa26@mail.gmail.com>
Date: Tue, 18 Jan 2005 16:10:03 -0500
From: Kristina Clair <kclair@gmail.com>
Subject: Re: [linux-lvm] snapshots and nfs
In-Reply-To: <41ED6C68.10109@svs.gsfc.nasa.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
References: <dff37527050118093648e504e@mail.gmail.com>
	<20050118194449.GQ26670@agk.surrey.redhat.com>
	<dff3752705011811541b040c4e@mail.gmail.com>
	<41ED6C68.10109@svs.gsfc.nasa.gov>
Reply-To: Kristina Clair <kclair@gmail.com>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 18 Jan 2005 15:07:04 -0500, Randall A. Jones
<rajones@svs.gsfc.nasa.gov> wrote:
> Kristina Clair wrote:
> 
> >No, if I run xfs_freeze first, lvcreate hangs when it tries to suspend
> >the volume, so I stopped doing that.
> >Now, if I run lvcreate shortly after the machine is booted, it runs
> >successfully.  However, if I try to run the same command the next day,
> >after it's been online and the webservers have had the filesystem
> >mounted, it hangs when trying to suspend the volume.
> >
> >
> Is it possible that mounting the NFS mounts on the webservers read-only
> as a temporary measure while creating the snapshot will help?

Actually, I just tried running lvcreate while the fliesystem is not
mounted on any of the webservers, and I'm having the same problem.
If there are any logs or command output that would be especially
helpful to see, let me know.  There is nothing in either
/var/log/messages or dmesg...

Kristina
