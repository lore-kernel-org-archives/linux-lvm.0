Subject: Re: [linux-lvm] LVM 0.9/1.0.x migration
Message-ID: <20011019134146.D644@btconnect.com>
References: <20011019122625.A25049@xlink.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011019122625.A25049@xlink.net>; from hadmut@danisch.de on Fri, Oct 19, 2001 at 12:26:25PM +0200
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
Date: Fri Oct 19 07:40:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Oct 19, 2001 at 12:26:25PM +0200, Hadmut Danisch wrote:
> Hi,
> 
> I just have a question:
> 
> I saw that README.1st and pvversion have vanished between
> 1.0 and 1.0.1-rcX. 
> 
> Does this mean that there is no way or no need to upgrade
> anymore? Any disadvantages with continuing to use the old 
> version?

You no longer need to upgrade to version 2 data structures.  Newer
releases understand both formats so there's no reason not to upgrade.
Newer releases will down grade any version 2 VG's it finds when you
next *change* the metadata (eg. resize an LV).

Version 2 was bogus and resulted from my not realising that
pv->pe_on_disk.size included all the blank space upto the first PE.
Making pv->pe_start redundant.

- Joe
