From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Re: GRUB + LVM + XFS?
Message-Id: <20020115153547.GB1022@tykepenguin.com>
References: <1010427293.29260.3.camel@UberGeek>
    <200201080927.g089QVJ00669@hammer.brocade.com>
    <20020115151829.F11005@sistina.com> <E16QVJv-0003Zk-00@hermes.sistina.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <E16QVJv-0003Zk-00@hermes.sistina.com>
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
Date: Tue Jan 15 09:36:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Jan 16, 2002 at 01:16:15AM +1000, Adrian Head wrote:
> The issue was that when I tried to create an XFS snapshot it would Oops and 
> the snapshot creation would not have been completed.  The /dev/vg/lv entries 
> would not be there; however, vgdisplay would show the snapshot as being in 
> use but I could not remove the incomplete snapshot.
> 
> When I would reboot using a lvm-1.0.1 kernel (2.4.17-xfs+lvm1.0.1) - the 
> machine would hang during startup; however, if I used a lvm-1.0.1rc4(ish) 
> kernel (2.4.16-xfs+lvm1.0.1rc4) it would fix the problem on the fly during 
> bootup and the snapshot would be put in full operation without problems.  
> This was the only way I found to get the machine up & running again.
> 
> I don't have any info on which lines of code might have been the cause.  I'm 
> still learning how to dig in and dbug.  ;-)

Looking at other threads in this list I think the issues are XFS related. I have
tried the latest XFS patches from

ftp://oss.sgi.com/projects/xfs/download/patches/2.4.17/

and the snapshots seem OK to me (that's without the VFS lock patch which XFS
doesn't seem to need anyway).

patrick
