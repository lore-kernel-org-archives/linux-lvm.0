From: Petro <petro@auctionwatch.com>
Subject: Re: [linux-lvm] Mandrake 8.1 and LVM
Message-ID: <20011130140221.B32143@auctionwatch.com>
References: <20011130142015.F23836@wookimus.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011130142015.F23836@wookimus.net>
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
Date: Fri Nov 30 16:00:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Nov 30, 2001 at 12:20:15PM -0800, Chad C. Walstrom wrote:
> On Fri, Nov 30, 2001 at 09:41:21PM +1300, Steve Wray wrote:
> > > Reason #1:  Mount /usr as read-only.  There is only one reason why
> you
> > ONLY if you also have /usr/share (for one, there may be others) on
> writeable
> > partitions!!!
> Why would you want/need to have /usr/share writeable?  FHS 2.2 states:
>         4.11  /usr/share : Architecture-independent data
>         4.11.1  Purpose
>         The /usr/share hierarchy is for all read-only architecture
>         independent data files. [25]
    
    So you can install software that puts stuff in /usr/share/man and
    /usr/share/doc?  


-- 
Share and Enjoy. 
