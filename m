From: Joe Thornber <thornber@sistina.com>
Subject: Re: [linux-lvm] Block-Level Backup
Message-ID: <20030807093631.GE381@fib011235813.fsnet.co.uk>
References: <1060247670.28307.37.camel@rocky>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1060247670.28307.37.camel@rocky>
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
Date: Thu Aug  7 04:37:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Aug 07, 2003 at 05:14:30PM +0800, Rocky Lee wrote:
> >What exactly shall this be good for?
> >I immediately thought about ISO files: CD-ROM images. You can do the
> >very same to any block device:
> >dd if=/dev/hda1 of=/tmp/disk.bak
> >Of course, the drive mounted ot /tmp has to be larger than /dev/hda1, in
> >this case... and it's filesystem should probably support files > 2GB.
> >Compression might help, too.
> >Not sure if that's whah you're looking for...
> >Markus
> 
> Thank you Markus!
> 
> I forget "dd", it really is a good way to do a simple block-level backup, :)
> 
> but it'll be great if there's a tool,
> that supoorts block-level increment backup....

Icremental backup would be good, from the kernel side all you'd need
is a dm target that records which blocks have changed - anyone
interested in coding this ?

- Joe
