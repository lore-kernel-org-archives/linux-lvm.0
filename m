Date: Tue, 24 Sep 2019 09:45:06 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20190924144506.GB24560@redhat.com>
References: <CH2PR18MB320633BFA3C024C348A1F91ECF840@CH2PR18MB3206.namprd18.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CH2PR18MB320633BFA3C024C348A1F91ECF840@CH2PR18MB3206.namprd18.prod.outlook.com>
Subject: Re: [linux-lvm] questions about dlm: add TCP multihoming/failover
 support
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Gang He <GHe@suse.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Sep 24, 2019 at 09:04:56AM +0000, Gang He wrote:
> Hello List,
> 
> When I tried to upgrade libdlm to v4.0.9, I can see one commit for add TCP multihoming/failover support. 
> commit 7a273b8714da400d292d6c9762acedcde1997e52
> Author: David Windsor <dwindsor@redhat.com>
> Date:   Tue May 7 09:56:53 2019 -0400
>     dlm_controld: bind to all interfaces for failover 
> 
> According to the commit description, I can find there are some kernel related patches(fs/dlm in kernel space).
> e.g. 
> https://www.redhat.com/archives/cluster-devel/2019-January/msg00009.html
> https://www.redhat.com/archives/cluster-devel/2019-January/msg00010.html
> 
> But, so far, these kernel patches have not been in Torvalds kernel git tree.
> That means we cannot use this feature, although we upgrade libdlm to v4.0.9?
> 
> Second, how to use this feature after these kernel patch are available? There is any document to guide the use to use(or test) this feature?

The project was never completed and seems to be abandoned. I will revert
that dlm_controld commit if it's never used for anything.
