From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: [linux-lvm] ext2online and 2.4.18
Message-ID: <20020619195508.GA22427@clusterfs.com>
References: <1024512969.1862.6.camel@hiro.prowell.org.bogus>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1024512969.1862.6.camel@hiro.prowell.org.bogus>
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
Date: Wed Jun 19 14:57:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ian Prowell <ip_lvm@prowell.org>
Cc: linux-lvm@sistina.com

On Jun 19, 2002  11:56 -0700, Ian Prowell wrote:
> Has anyone gotten ext2online to work with 2.4.18?  I found an ext2online
> patch for 2.4.17 at the Sourceforge site for ext2online, but it does not
> seem to work for 2.4.18.  I have not been able to find any discussion of
> it on the net or in the linux-lvm mailing list. 

I wasn't aware that there are patch conflicts with 2.4.18, as that is
what I'm running myself.  However, I had upgraded the kernel with
ext2online kernel patches in-place instead of applying the patch to
a new 2.4.18 tree.  I'll make a new 2.4.18 patch.

Cheers, Andreas

PS - I'm just finishing work on a 2.4.18 ext3 kernel patch, in time for
     my presentation on this subject at OLS.  Expect it soon.
--
Andreas Dilger
http://www-mddsp.enel.ucalgary.ca/People/adilger/
http://sourceforge.net/projects/ext2resize/
