From: Petro <petro@auctionwatch.com>
Subject: Re: [linux-lvm] Automatically GROW an LV to max size
Message-Id: <20020124022536.GE13465@auctionwatch.com>
References: <20020123172346.L8275@ultraviolet.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020123172346.L8275@ultraviolet.org>
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
Date: Wed Jan 23 20:26:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jan 23, 2002 at 05:23:46PM -0800, Tracy R Reed wrote:
> I'm the system administrator for MP3.com. I talked to some Sistina
> developers who visited the office a year or so ago but don't recall
> their
> names now, sorry. One if the things I asked for in LVM (and would still
> like to see) is a switch to create an LV that is as big as the remaining
> disk space available. 
> We have a redhat based kickstart install that sets up a basic / and then
> creates an LV out of the rest of the disk. Currently we have hard coded
> the size of the remaining disk but it would be really slick if we could
> just pass an option to lvcreate which would just create an lv with the
> most space possible. 
> Right now if we ever install on anything other than one of our standard
> 36G disks we have to delete the lv that was made and resize it or if the
> disk is smaller than 36G the hard coded lvcreate size will fail due to
> lack of space. 
> There's got to be a cleaner way to do it.

    It's been almost a year since I was inside kickstart, but you should
    be able to customize the script to read the remaining disk space,
    then call lvcreate with a variable.

-- 
Share and Enjoy. 
