From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Single snapshots do weird things?
Message-ID: <20030915233257.E2155@uk.sistina.com>
References: <3F663873.6070008@gbrmpa.gov.au>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3F663873.6070008@gbrmpa.gov.au>; from glen@gbrmpa.gov.au on Tue, Sep 16, 2003 at 08:08:51AM +1000
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
Date: Mon Sep 15 17:37:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glen Harris <glen@gbrmpa.gov.au>
Cc: linux-lvm@sistina.com

On Tue, Sep 16, 2003 at 08:08:51AM +1000, Glen Harris wrote:
> Now, when I copy 2Mb onto the filesystem and create an 8Mb snapshot,
> it's immediately flagged INACTIVE, "Allocated to snapshot" is 100%
> and is not mountable.

Thanks for those diagnostics: I'll look into this further tomorrow. 

Stick to using read/write snapshots for now.  With read-only ones, 
it seems the COW device is incorrectly getting set read-only.

 # dmsetup info vg0-snap0-cow           
 Name: vg0-snap0-cow
 State:             ACTIVE (READ-ONLY)

Alasdair
-- 
agk@uk.sistina.com
