Date: Fri, 31 Aug 2001 10:22:06 +0100
Subject: Re: [linux-lvm] My VG is gone...
Message-ID: <20010831102206.A391@btconnect.com>
References: <20010831071518.07f51602.rasmus.wiman@sami.se>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010831071518.07f51602.rasmus.wiman@sami.se>; from rasmus.wiman@sami.se on Fri, Aug 31, 2001 at 07:15:18AM +0200
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

On Fri, Aug 31, 2001 at 07:15:18AM +0200, Rasmus Wiman wrote:
> ...And I want them up quickly!
> 
> This evening I added a 36 GB drive to our department server. I did a
> vgextend on it and somehow it all went terribly wrong. It seems to me that
> the new drive got added twice, but with different UUIDs. Of course there
> is no way vgchange will bring it online. Is there a solution to the
> problem? I downloaded LDE from <http://lde.sourceforge.net/> to have a
> look at it, but I don't know what to alter. I run Slackware 8 with Kernel
> 2.4.8 and LVM-1.0. The attached files contain output from pvdata -U -V -PP
> on all three partitions.

You're right sdb1 appears to have been added twice with seperate
UUID's.  I'm at a loss to explain this at the moment.  Did you run
pvcreate more than once on sdb1 ? (I want to know where that extra
uuid came from).

- Joe
