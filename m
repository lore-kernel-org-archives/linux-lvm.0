From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: [linux-lvm] Re: Problems running with LVM on RedHat 7.2
Message-Id: <20020301103227.N22608@lynx.adilger.int>
References: <OF8D931057.C81A9527-ON86256B6F.0052D789@raleigh.ibm.com >
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <OF8D931057.C81A9527-ON86256B6F.0052D789@raleigh.ibm.com >;
    from westj@us.ibm.com on Fri, Mar 01, 2002 at 09:30:46AM -0600
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
Date: Fri Mar  1 11:32:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Mar 01, 2002  09:30 -0600, James T West wrote:
> The problem with running "vgscan" with every boot, is "vgscan" first
> destroys /etc/lvmtab and all the files in /etc/lvmtab.d.   These are very
> important files containing your LVM Volume Group description.  These files
> were probably "good" files when your system was shutdown.   If "vgscan"
> runs into any problem while running, it will fail to recreate these files,
> and you will not be able to access your volume groups without first
> restoring these files.
> 
> In my view "vgscan" should only be run manually, and should not be run
> automatically on every boot.  Running "vgscan" on every boot is not
> necessary, and can potentially cause serious problems.

I totally agree, and have stated this in the past.  It would be nice if
the "pvscan" command updated the list of available PVs, but did not
change the VG layout _at_all_ (where the VG layout only referred to
PVs by UUID).  I believe that LVM2 does this (at least I hope).

Cheers, Andreas

PS - James, can you please learn to trim your quoting a bit???
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
