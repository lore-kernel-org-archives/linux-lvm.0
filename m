From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] 2.4.9 + lvm-1.0.1rc1 + ext2online
Message-ID: <20011117152858.T1308@lynx.no>
References: <000801c16f99$c997c210$2101a8c0@raleigh.ibm.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <000801c16f99$c997c210$2101a8c0@raleigh.ibm.com>; from leonbrn@bellsouth.net on Sat, Nov 17, 2001 at 01:58:04PM -0500
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
Date: Sat Nov 17 16:27:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Leon Brown <leonbrn@bellsouth.net>
Cc: linux-lvm@sistina.com

On Nov 17, 2001  13:58 -0500, Leon Brown wrote:
> I saw your append indicating that you have successfully use the
> EXT2ONLINE patch on kernel level 2.4.9. I attempted to apply the patch
> on the same kernel level and received errors updating the super.c
> source. Did  you encounter this also. Do you have a updated patch that
> will apply. I am not a programmer type so I am at a lost for trying to
> fix the mismatches. I'd appreciate any help you could me. Thanks.

You need to go to the sourceforge site and check out the patches section.
http://sourceforge.net/projects/ext2resize/

There is a patch for 2.4.8 which should apply to newer kernels.  If it
doesn't, give me a shout.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
