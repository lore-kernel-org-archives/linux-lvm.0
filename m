From: Petro <petro@auctionwatch.com>
Subject: Re: [linux-lvm] A way to bypass LVM and extract the raw data off?
Message-ID: <20020109023404.GC1096@auctionwatch.com>
References: <1010309724.3c381a5ce8cbe@www.snappymail.ca> <1010343969.3c38a0214056f@www.snappymail.ca> <20020106152433.Q12868@lynx.no> <1010359883.3c38de4b3692f@www.snappymail.ca> <1010543196.3c3baa5c40c49@www.snappymail.ca>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1010543196.3c3baa5c40c49@www.snappymail.ca>
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
Date: Tue Jan  8 20:35:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jan 08, 2002 at 06:26:36PM -0800, IpSo wrote:
> Well, it doesn't look like there is a way I can recover my LVM volume groups and
> whatnot. (See below) But I know theres a fully intact ReiserFS of 17315mb on
> /dev/hda6. "gpart" scanned my disk and came up with this: 

    Does the OS recognize /dev/hda6 as a partition? 

> Is there some way to "dd" the data off onto another partition and access it
> there? Because I know the filesystem was only on a single PV, and a single LV,
> and the problems occured when trying to extend that LV, but I never got to the
> point of extending the filesystem itself with reiser_resize. You would think I
> could somehow using the offsets given above create a new partition to copy the
> data to, run a reiserfsck and rebuild the file system so I can access the data?
> Has anyone tryed something along these lines before?

    If you have the HD space, you could try dd if=/dev/hda6
    of=/some/file

    Then mount -o loop /some/file /mnt/point -t reiserfs. 

    I don't think this would do any more damage. 

-- 
Share and Enjoy. 
