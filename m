From: Tim <tim@connectlive.com>
Subject: Re: [linux-lvm] System Suggestions
Message-Id: <20020306234746.B26236@connectlive.com>
References: <20020306210600.JKKL21197.imf11bis.bellsouth.net@taz>
    <20020306161130.D855@kluge.net> <20020307034009.GJ32504@auctionwatch.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20020307034009.GJ32504@auctionwatch.com>; from
    petro@auctionwatch.com on Wed, Mar 06, 2002 at 07:40:09PM -0800
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
Date: Wed Mar  6 22:47:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

>     We're also having some problems with Mysql that people keep pointing
>     fingers at LVM for, but at this time we're point right back and
>     saying "No!" in a firm voice...

MySQL is weak under real read/write concurrent loads.  PostgreSQL is
terrific for that.  On the other hand, MySQL buries psql for keeping up
with my IDS alerts.  Gotta use the right tool for the job...

-- 
     "To be suspended from the legal profession is the moral equivalent of 
      being ostracized by child molesters."
                                                           --Ian Rowan
