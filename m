Date: Thu, 6 Sep 2001 09:00:25 +0100
Subject: Re: [linux-lvm] lvcreate segfaults
Message-ID: <20010906090024.A373@btconnect.com>
References: <20010905121129.I32553@turbolinux.com> <Pine.A41.4.21.0109051323340.22482-300000@gigue.dlib.indiana.edu> <20010905153703.A5914@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010905153703.A5914@sistina.com>; from lewis@sistina.com on Wed, Sep 05, 2001 at 03:37:03PM -0500
From: Joe Thornber <thornber@btconnect.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

AJ,

On Wed, Sep 05, 2001 at 03:37:03PM -0500, AJ Lewis wrote:
> On Wed, Sep 05, 2001 at 01:32:34PM -0500, John Marquart wrote:
> > Good afternoon,
> > 	I am running LVM 1.0.1rc2 on  2.4.8 kernel ontop of a IBM
> > Serverraid 4Mx RAID5 filesystem.  I am trying to create a new lv using
> > "lvcreate -n foo -L 4M rootvg" - however that command insists on giving me
> > a segfault.  
> 
> Here is a patch that should fix this problem.  It has already been applied
> to the CVS.  just save this to a file and apply it to the 1.0.1-rc2 source
> with the -p0 flag after cd'ing to the 1.0.1-rc2 directory.

I don't think this patch fixes it, it's just a tidy up.

- Joe
