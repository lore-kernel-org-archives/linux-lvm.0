From: Petro <petro@auctionwatch.com>
Subject: Re: [linux-lvm] LVM on large drives
Message-ID: <20020108222353.GC18179@auctionwatch.com>
References: <Pine.LNX.4.33.0201081343410.2001-100000@lx1.daboard.com> <001201c1987d$858e8b50$18c8ba81@ormanpc>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <001201c1987d$858e8b50$18c8ba81@ormanpc>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Tue Jan  8 16:24:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jan 08, 2002 at 01:49:02PM -0600, David Orman wrote:
> David Orman
> Network Administrator
> ISU Center for NDE
> Are there Issue on LVM and very large drives?
 
> Im trying to play with it on a Maxtor 160G IDE and cant hardly get
> started..

    I've got it running on several 300G+ RAID (both hardware and
    software raid volumes. 

 
> [root@habenero /root]# pvcreate /dev/hdc1
> pvcreate -- physical volume "/dev/hdc1" successfully created
> [root@habenero /root]# vgcreate test /dev/hdc1
> vgcreate -- ERROR "pv_read(): PV identifier invalid" reading physical
> volumes

    Um. 

    I tend to do these on raw devices--if you're going to use the whole
    drive, try that. 

-- 
Share and Enjoy. 
