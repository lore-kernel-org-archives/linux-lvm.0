From: Petro <petro@auctionwatch.com>
Subject: Re: [linux-lvm] lvm in SuSE 7.3
Message-Id: <20011220190739.GA8881@auctionwatch.com>
References: <200112200912.fBK9CLC14632@mailgate5.cinetic.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200112200912.fBK9CLC14632@mailgate5.cinetic.de>
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
Date: Thu Dec 20 13:05:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Dec 20, 2001 at 10:12:21AM +0100, r.kahrl@web.de wrote:
> Hello.
> 
> I just wondered what LVM in Yast2 means and opened it... but i didn't want to create a LV on my System, so i closed the program without creating a Logical Volume. If i restart my system, LVM reports no volume group was found and starts vgchange. How can i remove this problem?

    It's not really a "problem", but if the SUSE kernel loads everything
    modularly, then you could check your modules.conf file and see if
    it's loading LVM. If so get rid of that line.

-- 
Share and Enjoy. 
