From: =?iso-8859-1?Q?Jos=E9_Luis_Domingo_L=F3pez?= <linux-lvm@24x7linux.com>
Subject: Re: [linux-lvm] [Fwd: [support] (no subject)]
Message-ID: <20020913182136.GB1592@localhost>
References: <2984.208.210.149.34.1031939187.squirrel@webmail.sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2984.208.210.149.34.1031939187.squirrel@webmail.sistina.com>
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
Date: Fri Sep 13 13:23:32 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Friday, 13 September 2002, at 12:46:27 -0500,
Laurie E. Miller wrote:

> It appears to use 4 129 gb harddrives, an extent size of 8 mb is
> required.
> 
> Does this mean that any small file will be saved using 8 mb of disk
> space, or will small files be evenly distributed over one 8 mb extent?
> 
As far as I know space consumed by a file is a filesystem thing, not a
block-device thing. An extent seems to only affect waste of space when
creating/resizing Logical Volumes, because a LV must be an integer number
of PE (or a LV must be PE-alligned ;-)

So on each LV you will waste up to a PE plus LVM metadata. It depends on
the filesystem, namely on its block-size.

Hope this helps.

-- 
Jose Luis Domingo Lopez
Linux Registered User #189436     Debian Linux Woody (Linux 2.4.19-pre6aa1)
