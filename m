From: Petro <petro@auctionwatch.com>
Subject: Re: [linux-lvm] Automatic snapshot system?
Message-ID: <20011129004736.A14092@auctionwatch.com>
References: <ufasnayrr4e.fsf@epithumia.math.uh.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ufasnayrr4e.fsf@epithumia.math.uh.edu>
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
Date: Thu Nov 29 02:46:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Nov 29, 2001 at 01:08:33AM -0600, Jason L Tibbitts III wrote:
> Has anyone worked up a system that automatically snapshots volumes at
> regular intervals and then expires the snapshots as necessary?  If
> not, I may take a stab at it.

    We have a home-brewed perl script called from cron that does a snap,
    rsync's out the data, then releases the snapshot. 

    Is that what you're talking about? 

-- 
Share and Enjoy. 
