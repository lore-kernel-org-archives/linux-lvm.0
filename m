From: Jesse Keating <jkeating@pogolinux.com>
Subject: Re: re[2]: [linux-lvm] Core questions from a LVM neophyte...
References: <20030311165457.CLW7741.imf25bis.bellsouth.net@tiger2>
In-Reply-To: <20030311165457.CLW7741.imf25bis.bellsouth.net@tiger2>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <200303111037.28169.jkeating@pogolinux.com>
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
Date: Tue Mar 11 12:36:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM Mailing list <linux-lvm@sistina.com>

On Tuesday 11 March 2003 08:56, Greg Freemyer wrote:
> I tried them also.  No luck yet.  Let us know if you get it working.

I've been able to use LVM across HyperSCSI exported disk subsystems.  2 
systems exporting thier unpartitioned disks, a third client takes these 2 
disks and creates an LVM group and LV that spans both disks.  Worked good, 
but I didn't have time to stress test it.  I was able to get a second client 
to access the LVM group and write to it.

-- 
Jesse Keating RHCE MCSE
Pogo Linux -- Linux Systems Engineer
tel: (888) 828-7646 ex: 436
